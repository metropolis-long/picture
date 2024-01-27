package org.bamboo.controller;

import com.alibaba.fastjson.JSONObject;
import org.apache.dubbo.config.annotation.DubboReference;
import org.bamboo.pojo.UserEntity;
import org.bamboo.result.R;
import org.bamboo.service.AuthService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;


@RestController
@RequestMapping("/auth")
public class AuthController {
    @Autowired
    private AuthService authService;

    @GetMapping("/login")
    public R login(String username,String password ){
        System.out.println("username = " + username + ", password = " + password);
//        if (!StringUtils.hasText(username) || !StringUtils.hasText(password)) {
//            return R.error(500, "用户名或密码为空！");
//        }
        String token = authService.login("1", "2");
        return R.success(token);
    }

    @PostMapping("/add/user")
    public R addUser(@RequestBody UserEntity userEntity) {
        UserEntity entity = authService.addUser(userEntity);
        return R.success(entity);
    }
}
