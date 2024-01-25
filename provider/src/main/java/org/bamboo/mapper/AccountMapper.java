package org.bamboo.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.bamboo.pojo.Account;

@Mapper
public interface AccountMapper {
    /**
     * 获取用户信息
     */
    @Select("select * from account where username = #{username}")
    Account getUserInfo(String username);
}