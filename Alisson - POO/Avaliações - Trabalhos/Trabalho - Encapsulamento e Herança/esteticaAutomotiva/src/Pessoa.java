public class Pessoa {
    private String nome;
    private String cpf;
    private String telefone;

    // construtores
    public Pessoa() {
    }

    public Pessoa(String nome, String cpf, String telefone) {
        this.nome = nome;
        this.cpf = cpf;
        this.telefone = telefone;
    }

    // getters, setters e metodos

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        if (nome == null || nome.trim().isEmpty()) {
            System.out.println("ERRO: Nome inválido.");
        } else {
            this.nome = nome;
        }
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        if (cpf == null || cpf.trim().isEmpty()) {
            System.out.println("ERRO: CPF inválido.");
        } else {
            this.cpf = cpf;
        }
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        if (telefone == null || telefone.trim().isEmpty()) {
            System.out.println("ERRO: Telefone inválido.");
        } else {
            this.telefone = telefone;
        }
    }

}
