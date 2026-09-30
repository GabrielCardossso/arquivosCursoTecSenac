package com.br.aula2209.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.br.aula2209.entities.Pessoa;

public interface PessoaRepository extends JpaRepository<Pessoa, Integer> {

    
}