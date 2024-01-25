package org.bamboo.controller;

import com.alibaba.fastjson.JSONObject;
import org.apache.dubbo.config.annotation.DubboReference;
import org.bamboo.pojo.UserEntity;
import org.bamboo.result.R;
import org.bamboo.service.AuthService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;



@RestController
@RequestMapping("/auth")
public class AuthController {
    @DubboReference
    private AuthService authService;

    @PostMapping("/login")
    public R login(@RequestBody JSONObject params) {
        String username = params.getString("username");
        String password = params.getString("password");
        if (!StringUtils.hasText(username) || !StringUtils.hasText(password)) {
            return R.error(500, "用户名或密码为空！");
        }
        String token = authService.login(username, password);
        return R.success(token);
    }

    @PostMapping("/add/user")
    public R addUser(@RequestBody UserEntity userEntity) {
        UserEntity entity = authService.addUser(userEntity);
        return R.success(entity);
    }
}
