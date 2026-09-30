package com.br.aula2209.entities;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;

@Entity
public class Pessoa {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String nome;
    private Integer idade;
    private String email;

    @ManyToOne
    @JoinColumn(name = "endereco_id")
    private Endereco endereco;

    // Construtor vazio
    public Pessoa() {
    }

    // Construtor
    public Pessoa(String nome, Integer idade, String email, Endereco endereco) {
        this.nome = nome;
        this.idade = idade;
        this.email = email;
        this.endereco = endereco;
    }

    // Getters e Setters

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public Integer getIdade() {
        return idade;
    }

    public void setIdade(Integer idade) {
        this.idade = idade;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Endereco getEndereco() {
        return endereco;
    }

    public void setEndereco(Endereco endereco) {
        this.endereco = endereco;
    }

    @Override
    public String toString() {
        return "Dados da Pessoa de ID " + id
                + ":\nNome: " + nome
                + "\nIdade: " + idade
                + "\nEmail: " + email;
    }
}