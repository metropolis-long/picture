package org.bamboo.service;

import org.bamboo.pojo.UserEntity;

public interface UserService {

    UserEntity getUserByName(String username);

    UserEntity saveUser(UserEntity userEntity);
}