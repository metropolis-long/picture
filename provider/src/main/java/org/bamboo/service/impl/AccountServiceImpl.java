package org.bamboo.service.impl;

import org.bamboo.mapper.AccountMapper;
import org.bamboo.pojo.Account;
import org.bamboo.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AccountServiceImpl implements AccountService {

    @Autowired
    private AccountMapper accountDao;

    /**
     * 根据用户名获取用户信息
     */
    @Override
    public Account getUserInfo(String username) {
        return accountDao.getUserInfo(username);
    }
}