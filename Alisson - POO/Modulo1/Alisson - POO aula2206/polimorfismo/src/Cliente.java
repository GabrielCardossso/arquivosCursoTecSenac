public class Cliente extends Pessoa {
    String endereco;

    public Cliente(String nome, String cpf, String endereco) {
        super(nome, cpf);
        this.endereco = endereco;
    }

    public Cliente(String endereco) {
        this.endereco = endereco;
    }

    public String getEndereco() {
        return endereco;
    }

    public void setEndereco(String endereco) {
        this.endereco = endereco;
    }

    @Override
    public String exibirDados() {
        return "Cliente" + "\n" + super.exibirDados() + "\n" + "Endereço: " + endereco;
    }
}
