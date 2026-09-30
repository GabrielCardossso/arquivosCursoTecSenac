import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class App {

    public static void main(String[] args) {

        Scanner scanner = new Scanner(System.in);

        List<Pessoa> listaPessoas = new ArrayList<>();

        int opcao = 0;
// enquanto nao digitar 3, ele fica perguntando se deseja cadastrar(1), listar(2) ou sair(3)
        while (opcao != 3) {
// menu interativo
            System.out.println("\n===== MENU =====");
            System.out.println("1 - Cadastrar pessoa");
            System.out.println("2 - Listar pessoas");
            System.out.println("3 - Sair");
            System.out.print("Escolha: ");

            opcao = scanner.nextInt();
            scanner.nextLine();

            switch (opcao) {

                case 1:

                    System.out.print("Nome: ");
                    String nome = scanner.nextLine();

                    System.out.print("Idade: ");
                    int idade = scanner.nextInt();
                    scanner.nextLine();

                    System.out.print("Tem dívida? (sim/nao): ");
                    String resposta = scanner.nextLine();
// se digitar sim, converte para true, se digitar qualquer coisa diferente, converte para false
                    boolean temDivida = resposta.equalsIgnoreCase("sim");

                    Pessoa pessoa = new Pessoa(nome, idade, temDivida);

                    listaPessoas.add(pessoa);

                    System.out.println("Pessoa cadastrada!");
                    break;

                case 2:
// se a lista tiver vazia e pedir pra listar, vai aparecer que nao tem nada cadastrado
                    if (listaPessoas.isEmpty()) {
                        System.out.println("Nenhuma pessoa cadastrada.");
                    } else {
// para cada pessoa listada, tem alguns hífens separando para melhor organização
                        for (Pessoa p : listaPessoas) {
                            System.out.println(p);
                            System.out.println("---------------");
                        }

                    }

                    break;
// se digitar 3, ele para a execução em looping e mostra saindo...
                case 3:
                    System.out.println("Saindo...");
                    break;
// mostra opção invalida se digitar algo diferente de 1, 2 ou 3
                default:
                    System.out.println("Opção inválida!");
            }

        }

        scanner.close();
    }
}