package com.a11.schedule.entity;

import javax.persistence.*;

@Entity
@Table(name = "users")
public class User {

    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Long id;
    public String name;
    public String password;
    public Boolean enabled;
    public String role;
}
