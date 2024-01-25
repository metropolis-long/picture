package org.bamboo.mapper;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface AuthMapper {

    List<Map<String,Object>> getRolesAndPermissionsByAccountId(String id);

}