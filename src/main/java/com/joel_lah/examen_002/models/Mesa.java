package com.joel_lah.examen_002.models;

import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "mesas")
@NoArgsConstructor
@Getter
@Setter
public class Mesa extends ModelBase{
    
    @NotBlank(message = "El nombre del invitado no puede estar en blanco")
    @Size(min = 2, message = "El nombre del invitado debe tener al menos 2 caracteres")
    private String guest_name;

    @NotNull(message = "El número de invitados no puede ser nulo")
    @Min(value = 1, message = "El número de invitados debe ser al menos 1")
    private int number_guest;

    @NotBlank(message = "La nota no puede estar en blanco")
    private String note;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="user_id")
    private User user;
}
