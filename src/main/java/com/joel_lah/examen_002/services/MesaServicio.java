package com.joel_lah.examen_002.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.joel_lah.examen_002.models.Mesa;
import com.joel_lah.examen_002.models.User;
import com.joel_lah.examen_002.repositories.MesaRepository;

@Service
public class MesaServicio extends BaseServicio<Mesa>{

    @Autowired private MesaRepository mesaRepository;

    public List<Mesa> findByUser(User user) {
        return mesaRepository.findByUser(user);
    }
    
}
