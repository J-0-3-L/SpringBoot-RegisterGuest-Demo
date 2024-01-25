package com.joel_lah.examen_002.models;

import java.util.List;

import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "users")
@NoArgsConstructor
@Getter
@Setter
public class User extends ModelBase {

  @NotBlank(message = "El nombre es obligatorio")
  @Size(min = 3, message = "El nombre del invitado debe tener al menos 2 caracteres")
  private String name;

  @NotBlank(message = "El email es obligatorio")
  @Email(message = "El email debe ser válido")
  private String email;

  @NotBlank(message = "La contraseña es obligatoria")
  @Size(min = 8, message = "La contraseña debe tener al menos 8 caracteres")
  private String password;

  @Transient
  private String passwordConfirmation;

  @OneToMany(mappedBy="user", fetch = FetchType.LAZY)
  private List<Mesa> mesas;

}