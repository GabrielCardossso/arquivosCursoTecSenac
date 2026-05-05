public class Cliente {
    private String nome;
    private int idade;
    private long cpf;
    private boolean temDivida;
    // Construtor vazio
    public Cliente() {
    }
    // Construtor com parâmetros
    public Cliente (String nome, int idade, long cpf, boolean temDivida) {
        this.nome = nome;
        this.idade = idade;
        this.cpf = cpf;
        this.temDivida = temDivida;
    }

    // pega o nome do cliente
    public String getNome() { 
        return nome;
    }
    // envia o nome do cliente
    public void setNome(String nome) {
        this.nome = nome;
    }
    // pega a idade do cliente
    public int getIdade() {
        return idade;
    }
    // envia a idade do cliente
    public void setIdade(int idade) {
        this.idade = idade;
    }
    // pega o CPF do cliente
    public long getCpf() {
        return cpf;
    }
    // envia o CPF do cliente
    public void setCpf(long cpf) {
        this.cpf = cpf;
    }
    // pega a informação se o cliente tem dívida ou não
    public boolean temDivida() {
        return temDivida;
    }
    // envia a informação se o cliente tem dívida ou não
    public void setTemDivida(boolean temDivida) {
        this.temDivida = temDivida;
    }
    // Método para verificar se o cliente pode comprar fiado, se for verdade que ele tem dívida, ele não pode comprar fiado
    public boolean podeComprarFiado() {
        return !this.temDivida; // !this temDivida é uma negação lógica, ou seja, se temDivida for true, !temDivida será false, e vice-versa. Portanto, o método podeComprarFiado retorna true se o cliente não tiver dívida (temDivida for false) e retorna false se o cliente tiver dívida (temDivida for true).
    }
}
