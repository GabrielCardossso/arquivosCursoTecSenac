package com.br.aula2209.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.br.aula2209.entities.Endereco;
import com.br.aula2209.repositories.EnderecoRepository;

@Service
public class EnderecoService {

    private final EnderecoRepository enderecoRepository;

    public EnderecoService(EnderecoRepository enderecoRepository) {
        this.enderecoRepository = enderecoRepository;
    }

    public String salvar(String pais, String estado, String cidade, String rua) {

        Endereco endereco = new Endereco(
                pais,
                estado,
                cidade,
                rua
        );

        enderecoRepository.save(endereco);

        return "Endereço salvo com sucesso!";
    }

    public String mostrar(Integer id) {
        Endereco endereco = enderecoRepository.findById(id).get();

        return endereco.toString();
    }

    public List<Endereco> listar() {
        return enderecoRepository.findAll();
    }

    public String deletar(Integer id) {
        enderecoRepository.deleteById(id);

        return "Endereço deletado com sucesso!";
    }

    public String atualizar(
            Integer id,
            String pais,
            String estado,
            String cidade,
            String rua) {

        Endereco enderecoBD = enderecoRepository.findById(id).get();

        enderecoBD.setPais(pais);
        enderecoBD.setEstado(estado);
        enderecoBD.setCidade(cidade);
        enderecoBD.setRua(rua);

        enderecoRepository.save(enderecoBD);

        return "Endereço atualizado com sucesso!";
    }
}