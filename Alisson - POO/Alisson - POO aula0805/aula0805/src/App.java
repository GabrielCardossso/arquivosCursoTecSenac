// importar a classe Scanner para ler a entrada do usuário
import java.util.Scanner;
// classe App principal do programa
public class App {
    public static void main(String[] args) throws Exception {
// importar a classe Pessoa para criar um objeto da classe Pessoa        
        Pessoa pessoa1 = new Pessoa();
        Pessoa pessoa2 = new Pessoa("Alisson", 25, true);
// importar a classe Scanner para ler a entrada do usuário
        Scanner scanner = new Scanner(System.in);
// setando o nome e a idade e divida da pessoa1 usando scanner para ler a entrada do usuário
        pessoa1.setNome("Gabriel");
        pessoa1.setIdade(16);
        pessoa1.setTemDivida(false);


// pegando o nome e a idade e informando se a pessoa tem divida da pessoa1 e exibindo na tela
        System.out.println("Nome: " + pessoa1.getNome() + "\nIdade: " + pessoa1.getIdade() + "\nPode comprar fiado? " + pessoa1.podeComprarFiado());
        // exibindo os dados da pessoa2
        System.out.println("Nome: " + pessoa2.getNome() + "\nIdade: " + pessoa2.getIdade() + "\nPode comprar fiado? " + pessoa2.podeComprarFiado());
    scanner.close();
}
}
