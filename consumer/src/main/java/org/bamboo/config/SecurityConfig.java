package org.bamboo.config;

import org.bamboo.filter.TokenFilter;
import org.bamboo.handler.AuthenticationExceptionHandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.ProviderManager;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.util.CollectionUtils;

import java.util.List;

@Configuration
@EnableWebSecurity
public class SecurityConfig {

//    @Bean
//    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
//        http.authorizeHttpRequests(
//                (authorize) -> authorize
//                        .requestMatchers("/login")
//                        .permitAll()
//                        .anyRequest()
//                        .authenticated()
//        );
//        return http.build();
//    }

//    @Bean
//    public AuthenticationManager authenticationManager(
//            UserDetailsService userDetailsService,
//            PasswordEncoder passwordEncoder) {
//        DaoAuthenticationProvider authenticationProvider = new DaoAuthenticationProvider();
//        authenticationProvider.setUserDetailsService(userDetailsService);
//        authenticationProvider.setPasswordEncoder(passwordEncoder);
//
//        return new ProviderManager(authenticationProvider);
//    }
//
//    @Bean
//    public UserDetailsService userDetailsService() {
//        UserDetails userDetails = User.withDefaultPasswordEncoder()
//                .username("user")
//                .password("password")
//                .roles("USER")
//                .build();
//
//        return new InMemoryUserDetailsManager(userDetails);
//    }

    @Autowired
    private AuthenticationExceptionHandler authenticationExceptionHandler;
    @Autowired
    private TokenFilter tokenFilter;
    @Autowired
    private DemoConfiguration.Security security;

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        List<String> permitAllPaths = security.getPermitAllPath();
        // 配置不需要认证的请求(这里所有的路径可以写在配置文件上修改时就不用改代码)
        if (!CollectionUtils.isEmpty(permitAllPaths)) {
            permitAllPaths.forEach(path -> {
                try {
                    http.authorizeHttpRequests().requestMatchers(path).permitAll();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            });
        }
        // 关闭csrf因为不使用session
        http.csrf().disable()
                // 不通过Session获取SecurityContext
                .sessionManagement().sessionCreationPolicy(SessionCreationPolicy.STATELESS)
                .and()
                .authorizeHttpRequests()
                // 除了上面那些请求都需要认证
                .anyRequest().authenticated()
                .and()
                // 配置异常处理
                // 如果是认证过程中出现的异常会被封装成AuthenticationException然后调用AuthenticationEntryPoint对象的方法去进行异常处理。
                // 如果是授权过程中出现的异常会被封装成AccessDeniedException然后调用AccessDeniedHandler对象的方法去进行异常处理。
                .exceptionHandling()
                .authenticationEntryPoint(authenticationExceptionHandler);
        // 配置token拦截过滤器
        http.addFilterBefore(tokenFilter, UsernamePasswordAuthenticationFilter.class);
        return http.build();


        /**
         * anyRequest          |   匹配所有请求路径
         * access              |   SpringEl表达式结果为true时可以访问
         * anonymous           |   匿名可以访问
         * denyAll             |   用户不能访问
         * fullyAuthenticated  |   用户完全认证可以访问（非remember-me下自动登录）
         * hasAnyAuthority     |   如果有参数，参数表示权限，则其中任何一个权限可以访问
         * hasAnyRole          |   如果有参数，参数表示角色，则其中任何一个角色可以访问
         * hasAuthority        |   如果有参数，参数表示权限，则其权限可以访问
         * hasIpAddress        |   如果有参数，参数表示IP地址，如果用户IP和参数匹配，则可以访问
         * hasRole             |   如果有参数，参数表示角色，则其角色可以访问
         * permitAll           |   用户可以任意访问
         * rememberMe          |   允许通过remember-me登录的用户访问
         * authenticated       |   用户登录后可访问
         */
    }

    /**
     * 身份认证管理器，调用authenticate()方法完成认证
     */
    @Bean
    public AuthenticationManager authenticationManager(AuthenticationConfiguration authenticationConfiguration) throws Exception {
        return authenticationConfiguration.getAuthenticationManager();
    }

    /**
     * 密码加密器
     */
    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
}