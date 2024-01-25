package org.bamboo.pojo;

import lombok.Data;

import java.io.Serializable;

@Data
public class Account implements Serializable {
    private static final long serialVersionUID  = 1L;
    private String id;
    private String username;
    private String password;
    private String nickname;

}