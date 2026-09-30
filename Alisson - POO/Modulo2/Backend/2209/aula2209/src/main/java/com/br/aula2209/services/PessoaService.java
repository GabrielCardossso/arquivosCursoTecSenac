package com.br.aula2209.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.br.aula2209.entities.Endereco;
import com.br.aula2209.entities.Pessoa;
import com.br.aula2209.repositories.EnderecoRepository;
import com.br.aula2209.repositories.PessoaRepository;

@Service
public class PessoaService {

    private final PessoaRepository pessoaRepository;
    private final EnderecoRepository enderecoRepository;

    public PessoaService(PessoaRepository pessoaRepository, EnderecoRepository enderecoRepository) {

        this.pessoaRepository = pessoaRepository;
        this.enderecoRepository = enderecoRepository;
    }

    public String mostrar(Integer id) {

        Pessoa pessoa = pessoaRepository.findById(id).get();

        return pessoa.toString();
    }

    public String salvar(String nome, Integer idade, String email) {

    Pessoa pessoa = new Pessoa(nome, idade, email, null
);

    pessoaRepository.save(pessoa);

    return "Pessoa salva com sucesso!";
}

    public String deletar(Integer id) {

        pessoaRepository.deleteById(id);

        return "Pessoa deletada com sucesso!";
    }

    public String atualizar(Integer id, String nome, Integer idade, String email, Integer enderecoId) {

        Pessoa pessoaBD = pessoaRepository.findById(id).get();

        Endereco endereco = enderecoRepository.findById(enderecoId).get();

        pessoaBD.setNome(nome);
        pessoaBD.setIdade(idade);
        pessoaBD.setEmail(email);
        pessoaBD.setEndereco(endereco);

        pessoaRepository.save(pessoaBD);

        return "Pessoa atualizada com sucesso!";
    }

    public List<Pessoa> listar() {

        return pessoaRepository.findAll();
    }

    public String atribuirEndereco(Integer pessoaId, Integer enderecoId) {

    Pessoa pessoa = pessoaRepository.findById(pessoaId).get();

    Endereco endereco = enderecoRepository.findById(enderecoId).get();

    pessoa.setEndereco(endereco);

    pessoaRepository.save(pessoa);

    return "Endereço atribuído à pessoa com sucesso!";
}
}