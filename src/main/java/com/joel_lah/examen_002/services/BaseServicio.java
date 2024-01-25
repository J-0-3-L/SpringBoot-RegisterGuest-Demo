package com.joel_lah.examen_002.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;

import com.joel_lah.examen_002.repositories.BaseRepository;

public abstract class BaseServicio<T> {
    
    @Autowired private BaseRepository<T> baseRepo;

    //CREATE
    public T save(T objeto){
        return baseRepo.save(objeto);
    }

    //READ
    public T findById(Long id){
        Optional<T> objeto=baseRepo.findById(id);
        if(objeto.isPresent()){
            return objeto.get();
        }
        return null;
    }
    public List<T> findAll(){
        return baseRepo.findAll();
    }

    //UPDATE
    public T update(T objeto){
        return baseRepo.save(objeto);
    }

    //DELETE
    public void delete(T objeto){
        baseRepo.delete(objeto);
    }

    public void delete(Long id){
        baseRepo.deleteById(id);
    }
}