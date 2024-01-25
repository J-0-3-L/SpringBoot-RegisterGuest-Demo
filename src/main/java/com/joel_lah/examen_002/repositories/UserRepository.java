package com.joel_lah.examen_002.repositories;

import com.joel_lah.examen_002.models.User;

public interface UserRepository extends BaseRepository<User> {
    
    User findByEmail(String email);
    User findByName(String name);

}