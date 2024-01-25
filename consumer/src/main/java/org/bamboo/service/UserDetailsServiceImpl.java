package org.bamboo.service;

import org.apache.dubbo.config.annotation.DubboReference;
import org.bamboo.dto.SecurityUser;
import org.bamboo.pojo.UserEntity;
import org.bamboo.service.UserService;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class UserDetailsServiceImpl implements UserDetailsService {

    @DubboReference
    private UserService userService;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        System.out.println("login...........");
        UserEntity user = userService.getUserByName(username);
        if (null == user) {
            throw new RuntimeException(String.format("not found [%s]", username));
        }
        return new SecurityUser(user);
    }
}
