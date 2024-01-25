package org.bamboo.service;

import org.bamboo.pojo.UserEntity;

public interface AuthService {
    String login(String username, String password);

    UserEntity addUser(UserEntity userEntity);
}
