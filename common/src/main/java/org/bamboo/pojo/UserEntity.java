package org.bamboo.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserEntity implements Serializable {

    private static final long serialVersionUID  = 1555L;
    private Long id;

    private String phone;
    private String username;
    private String password;
    private String salt;
}
