package org.bamboo.service.impl;

import org.apache.dubbo.config.annotation.DubboService;
import org.bamboo.mapper.UserMapper;
import org.bamboo.pojo.UserEntity;
import org.bamboo.service.UserService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
@DubboService
public class UserServiceImpl  implements UserService {
    @Autowired
    private UserMapper userMapper;

    @Override
    public UserEntity getUserByName(String username) {
        return userMapper.getUserByName(username);
    }

    public UserEntity saveUser(UserEntity entity) {
        UserEntity user = userMapper.getUserByName(entity.getUsername());
        if (null == user) {
            userMapper.saveUser(entity);
            user = entity;
        } else {
            Long id = user.getId();
            BeanUtils.copyProperties(entity, user);
            user.setId(id);
            userMapper.updateById(user);
        }
        return user;
    }
}
