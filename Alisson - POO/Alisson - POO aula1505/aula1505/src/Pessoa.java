public class Pessoa {

    private String nome;
    private int idade;
    private boolean temDivida;

    public Pessoa(String nome, int idade, boolean temDivida) {
        this.nome = nome;
        setIdade(idade);
        this.temDivida = temDivida;
    }

    public Pessoa() {
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public int getIdade() {
        return idade;
    }

    public void setIdade(int idade) {

        if (idade < 0) {
            System.out.println("Idade inválida!");
        } else {
            this.idade = idade;
        }

    }

    public boolean getTemDivida() {
        return temDivida;
    }

    public void setTemDivida(boolean temDivida) {
        this.temDivida = temDivida;
    }

    public String podeComprarFiado() {

        if (temDivida) {
            return "Não pode comprar fiado!";
        }

        return "Pode comprar fiado!";
    }
// retorna o objeto em formato string para nao retornar o endereço: pessoa@1f3...
    @Override
    public String toString() {

        return "\nNome: " + nome +
               "\nIdade: " + idade +
               "\nTem dívida? " + temDivida +
               "\nStatus: " + podeComprarFiado();
    }
}