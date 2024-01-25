package org.bamboo.service;

import org.bamboo.pojo.Account;

public interface AccountService {
    /**
     * 根据用户名获取用户信息
     */
    Account getUserInfo(String username);
}