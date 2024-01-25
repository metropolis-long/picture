package org.bamboo.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.bamboo.pojo.Account;
import org.bamboo.pojo.UserEntity;

@Mapper
public interface UserMapper {
    /**
     * 获取用户信息
     */
    @Select("select * from user where username = #{username}")
    UserEntity getUserByName(String username);
    @Select("insert into user(username,password,salt) value(#{username},#{password},#{salt})")
    int saveUser(UserEntity entity);
    int updateById(UserEntity user);
}