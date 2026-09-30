
// importar a classe Scanner para ler a entrada do usuário
import java.util.Scanner;

// classe Pessoa
public class Pessoa {
    // atributos da classe Pessoa
    private String nome;
    private int idade;
    private boolean temDivida;
// construtor da classe Pessoa com parâmetros para setar o nome e a idade da pessoa
    public Pessoa(String nome, int idade, boolean temDivida) {
        this.nome = nome;
        this.idade = idade;
        this.temDivida = temDivida;
    }
// construtor vazio da classe Pessoa
    public Pessoa() {
    }

    // criar um objeto Scanner para ler a entrada do usuário
    Scanner scanner = new Scanner(System.in);

    // pegar o nome da pessoa
    public String getNome() {
        return nome;
    }

    // setar o nome da pessoa
    public void setNome(String nome) {
        this.nome = nome;
    }

    // pegar a idade da pessoa
    public int getIdade() {
        return idade;
    }

    // setar a idade da pessoa
    public void setIdade(int idade) {
        // sistema para impedir que a idade seja negativa
        // se a idade for menor que 0, exibir uma mensagem de erro e pedir novamente
        while (idade < 0) {
            System.out.println("Idade inválida. Digite uma idade maior ou igual a 0:");
            idade = scanner.nextInt();
        }
        this.idade = idade;
    }

    public boolean getTemDivida() {
        return temDivida;
    }

    public void setTemDivida(boolean temDivida) {
        this.temDivida = temDivida;
    }

    public String podeComprarFiado() {
        if (temDivida == true) {
            return "Não pode comprar fiado!";
        } else {
            return "Pode comprar fiado!";
        }
    }
}