package org.bamboo.object.mapper;

import org.apache.dubbo.spring.security.jackson.ObjectMapperCodec;
import org.apache.dubbo.spring.security.jackson.ObjectMapperCodecCustomer;
import org.bamboo.pojo.UserEntity;
import org.springframework.security.authentication.AnonymousAuthenticationToken;

public class DefaultObjectMapperCustomer implements ObjectMapperCodecCustomer {
    @Override
    public void customize(ObjectMapperCodec objectMapperCodec) {
        System.out.println("json white list");
        objectMapperCodec.configureMapper(objectMapper -> {
            objectMapper.addMixIn(UserEntity.class, Long.class);
            objectMapper.addMixIn(AnonymousAuthenticationToken.class,Object.class);
        });
    }
}