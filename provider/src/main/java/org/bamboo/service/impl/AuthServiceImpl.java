package org.bamboo.service.impl;

import org.apache.dubbo.config.annotation.DubboService;
import org.bamboo.constant.RedisKey;
import org.bamboo.dto.SecurityUser;
import org.bamboo.pojo.UserEntity;
import org.bamboo.service.AuthService;
import com.alibaba.fastjson.JSON;
import org.bamboo.service.UserService;
import org.bamboo.tools.JwtUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Service;

import java.util.concurrent.TimeUnit;

//@DubboService
class AuthServiceImpl implements AuthService {
    Logger log = LoggerFactory.getLogger(getClass());
    @Autowired
    private RedisTemplate<String, Object> redisTemplate;
    @Autowired
    private AuthenticationManager authenticationManager;
    @Autowired
    private UserService userService;

    @Override
    public String login(String username, String password) {
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
        redisTemplate.opsForValue().set(String.format(RedisKey.AUTH_TOKEN_KEY, username),
                JSON.toJSONString(user), JwtUtil.JWT_EXPIRE_TIME, TimeUnit.MILLISECONDS);
        return token;
    }

    @Override
    public UserEntity addUser(UserEntity userEntity) {
        return userService.saveUser(userEntity);
    }
}
