package com.joel_lah.examen_002.repositories;

import java.util.List;

import com.joel_lah.examen_002.models.Mesa;
import com.joel_lah.examen_002.models.User;

public interface MesaRepository extends BaseRepository<Mesa> {

    List<Mesa> findByUser(User user);
    
}