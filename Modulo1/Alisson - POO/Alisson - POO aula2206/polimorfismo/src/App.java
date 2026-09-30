import java.util.ArrayList;
import java.util.List;

public class App {
// polimorfismo basicamente consiste em utilizar a mesma interface para diferentes tipos de objetos, ou seja,
// é a capacidade de um objeto se comportar de diferentes maneiras dependendo do contexto em que é utilizado.
// --------------------
// Em Java, o polimorfismo é implementado através da herança e da sobrescrita de métodos.
// --------------------
// No exemplo abaixo, temos uma classe abstrata chamada "Pessoa" que possui um método abstrato chamado "exibirDados()".
// --------------------
// As classes "Funcionario", "Gerente" e "Cliente" estendem a classe "Pessoa" e implementam o método "exibirDados()"
// de maneiras diferentes.
// --------------------
// No método main, criamos uma lista de objetos do tipo "Pessoa" e adicionamos diferentes tipos de objetos 
// (Funcionario, Gerente e Cliente) a essa lista.
// --------------------
//

    public static void main(String[] args) throws Exception {
        Empresa empresa = new Empresa();
        List<Pessoa> pessoas = new ArrayList<>();
        pessoas.add(new Funcionario("Alisson", "123.456.789-10", "R$ 2.000,00", "Desenvolvedor"));
        pessoas.add(new Gerente("João", "987.654.321-00", "R$ 5.000,00", "TI"));
        pessoas.add(new Cliente("Maria", "321.654.987-01", "Rua A, 123"));

        for (Pessoa pessoa : pessoas) {
            System.out.println("\n");
            System.out.println(pessoa.exibirDados());
            System.out.println("--------------------");
            System.out.println(empresa.criarCracha(pessoa));
        }

    }
}
