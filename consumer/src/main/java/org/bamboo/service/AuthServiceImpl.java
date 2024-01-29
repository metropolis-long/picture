package org.bamboo.service;

import org.apache.dubbo.config.annotation.DubboReference;
import org.apache.dubbo.config.annotation.DubboService;
import org.bamboo.constant.RedisKey;
import org.bamboo.dto.SecurityUser;
import org.bamboo.pojo.UserEntity;
import org.bamboo.redis.RedisCache;
import org.bamboo.service.AuthService;
import com.alibaba.fastjson.JSON;
import org.bamboo.service.UserService;
import org.bamboo.tools.JwtUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Service;

@Service
class AuthServiceImpl implements AuthService {
    Logger log = LoggerFactory.getLogger(getClass());
    @Autowired
    private RedisCache redisCache;
    @Autowired
    private AuthenticationManager authenticationManager;
    @DubboReference
    private UserService userService;

    @Override
    public String login(String username, String password) {
        System.out.println("begin auth");
        UsernamePasswordAuthenticationToken authenticationToken = new UsernamePasswordAuthenticationToken(username, password);
        Authentication authenticate = authenticationManager.authenticate(authenticationToken);
        if (authenticate == null) {
            log.error("{username: {}, password: {}} 认证失败！", username, password);
            return null;
        }
        SecurityUser user = (SecurityUser) authenticate.getPrincipal();
        // userEntity
        UserEntity userEntity = user.getUserEntity();
        String token = JwtUtil.createToken(userEntity.getSalt(), username, null);
//        redisCache.setCacheObject(token,user);
        return token;
    }

    @Override
    public UserEntity addUser(UserEntity userEntity) {
        return userService.saveUser(userEntity);
    }
}
