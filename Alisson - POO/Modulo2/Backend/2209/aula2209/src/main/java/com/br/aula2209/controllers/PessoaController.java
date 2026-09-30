package com.br.aula2209.controllers;

import java.util.List;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.br.aula2209.entities.Pessoa;
import com.br.aula2209.services.PessoaService;

@RestController
@RequestMapping("/pessoa")
public class PessoaController {

    private final PessoaService pessoaService;

    public PessoaController(PessoaService pessoaService) {
        this.pessoaService = pessoaService;
    }

    @GetMapping("/mostrar/{id}")
    public String mostrar(@PathVariable Integer id) {
        return pessoaService.mostrar(id);
    }

    @PostMapping("/salvar")
    public String salvar(@RequestParam String nome, @RequestParam Integer idade, @RequestParam String email) {

        return pessoaService.salvar( nome, idade, email);
    }

    @DeleteMapping("/deletar/{id}")
    public String deletar(@PathVariable Integer id) {
        return pessoaService.deletar(id);
    }

    @PutMapping("/atualizar/{id}")
    public String atualizar(@PathVariable Integer id, @RequestParam String nome, @RequestParam Integer idade, @RequestParam String email, @RequestParam Integer enderecoId) {

        return pessoaService.atualizar(id, nome, idade, email, enderecoId);
    }

    @GetMapping("/listar")
    public List<Pessoa> listar() {
        return pessoaService.listar();
    }

    @PutMapping("/atribuirEndereco")
public String atribuirEndereco(@RequestParam Integer pessoaId, @RequestParam Integer enderecoId) {

    return pessoaService.atribuirEndereco(pessoaId, enderecoId);
}
}