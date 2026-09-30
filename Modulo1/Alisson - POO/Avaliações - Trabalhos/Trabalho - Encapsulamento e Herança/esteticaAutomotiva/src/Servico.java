public class Servico {
    private String nome;
    private String descrição;
    private double preco;
    private int duracao;

    public Servico(String nome, String descrição, double preco, int duracao) {
        this.nome = nome;
        this.descrição = descrição;
        this.preco = preco;
        this.duracao = duracao;
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

    public String getDescrição() {
        return descrição;
    }

    public void setDescrição(String descrição) {
        this.descrição = descrição;
    }

    public double getPreco() {
        return preco;
    }

    public void setPreco(double preco) {
        if (preco <= 0) {
            System.out.println("ERRO: Preço inválido.");
        } else {
            this.preco = preco;
        }
    }

    public int getDuracao() {
        return duracao;
    }

    public void setDuracao(int duracao) {
        if (duracao <= 0) {
            System.out.println("ERRO: Duração inválida.");
        } else {
            this.duracao = duracao;
        }
    }

    public String exibir() {
        return "Nome: " + nome + "\nDescrição: " + descrição + "\nPreço: R$ " + String.format("%.2f", preco)
                + "\nDuração: " + duracao + " minutos";
    }

}
