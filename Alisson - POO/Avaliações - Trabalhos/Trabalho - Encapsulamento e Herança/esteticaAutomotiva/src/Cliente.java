public class Cliente extends Pessoa {
    private String endereco;

    // construtor

    public Cliente(String nome, String cpf, String telefone, String endereco) {
        super(nome, cpf, telefone);
        this.endereco = endereco;
    }

    // getters, setters e metodos

    public String getEndereco() {
        return endereco;
    }

    public void setEndereco(String endereco) {
        if (endereco == null || endereco.trim().isEmpty()) {
            System.out.println("ERRO: Endereço inválido.");
        } else {
            this.endereco = endereco;
        }
    }

    public String exibirNomeCpf() {
        return "\nNome: " + getNome() + "\nCPF: " + getCpf();
    }

    public String exibirDadosCompleto() {
        return "\nNome: " + getNome() + "\nCPF: " + getCpf() + "\nTelefone: " + getTelefone() + "\nEndereço: " + endereco;
    }

}
