package com.a11.schedule.service;

import org.springframework.security.core.userdetails.UserDetailsService;

public interface UserService extends UserDetailsService {

    boolean isAdmin();

    boolean isAuthorized();
}
