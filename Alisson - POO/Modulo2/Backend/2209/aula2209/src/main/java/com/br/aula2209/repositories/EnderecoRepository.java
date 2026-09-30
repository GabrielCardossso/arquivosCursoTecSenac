package com.br.aula2209.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.br.aula2209.entities.Endereco;

public interface EnderecoRepository extends JpaRepository<Endereco, Integer> {

}