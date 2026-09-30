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

import com.br.aula2209.entities.Endereco;
import com.br.aula2209.services.EnderecoService;

@RestController
@RequestMapping("/endereco")
public class EnderecoController {

    private final EnderecoService enderecoService;

    public EnderecoController(EnderecoService enderecoService) {
        this.enderecoService = enderecoService;
    }

    @PostMapping("/salvar")
    public String salvar(@RequestParam String pais, @RequestParam String estado, @RequestParam String cidade, @RequestParam String rua) {

        return enderecoService.salvar(
                pais,
                estado,
                cidade,
                rua
        );
    }

    @GetMapping("/mostrar/{id}")
    public String mostrar(@PathVariable Integer id) {
        return enderecoService.mostrar(id);
    }

    @GetMapping("/listar")
    public List<Endereco> listar() {
        return enderecoService.listar();
    }

    @DeleteMapping("/deletar/{id}")
    public String deletar(@PathVariable Integer id) {
        return enderecoService.deletar(id);
    }

    @PutMapping("/atualizar/{id}")
    public String atualizar(
            @PathVariable Integer id,
            @RequestParam String pais,
            @RequestParam String estado,
            @RequestParam String cidade,
            @RequestParam String rua) {

        return enderecoService.atualizar(
                id,
                pais,
                estado,
                cidade,
                rua
        );
    }
}