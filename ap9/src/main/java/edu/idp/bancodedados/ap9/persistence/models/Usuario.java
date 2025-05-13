package edu.idp.bancodedados.ap9.persistence.models;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
public class Usuario {
  @Id
  @GeneratedValue(strategy = GenerationType.AUTO)
  public Integer id;
  public String nome;
  public String sobrenome;
  public String email;
  public String cpf;
}
