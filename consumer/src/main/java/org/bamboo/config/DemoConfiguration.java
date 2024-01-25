package org.bamboo.config;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Configuration;

import java.util.List;

/**
 * TODO
 *
 * @Description
 * @Author laizhenghua
 * @Date 2023/7/2 20:52
 **/
@Configuration
@EnableConfigurationProperties(DemoConfiguration.Security.class)
public class DemoConfiguration {

    @ConfigurationProperties(prefix = "picture-filter.security")
    public static class Security {
        private List<String> permitAllPath;

        public List<String> getPermitAllPath() {
            return permitAllPath;
        }

        public void setPermitAllPath(List<String> permitAllPath) {
            this.permitAllPath = permitAllPath;
        }
    }
}
