package com.joel_lah.examen_002.models;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import jakarta.persistence.Column;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.MappedSuperclass;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@MappedSuperclass
@Getter
@Setter
@NoArgsConstructor
public abstract class ModelBase {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    //@NotNull
    @Column(updatable = false)
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date createdAt;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date updatedAt;

    @PrePersist
    protected void onCreate(){
        this.createdAt=new Date();
    }

    @PreUpdate
    protected void onUpdate(){
        this.updatedAt=new Date();
    }
}