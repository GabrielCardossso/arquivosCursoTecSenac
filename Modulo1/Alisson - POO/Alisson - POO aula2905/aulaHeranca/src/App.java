import java.util.Scanner;
import java.util.ArrayList;
import java.util.List;

public class App {
    public static void main(String[] args) throws Exception {
        // criando scanner e etc
        Scanner scanner = new Scanner(System.in);
        List<Aluno> listaAlunos = new ArrayList<>();
        List<Professor> listaProfessores = new ArrayList<>();

        // apresentação
        System.out.println("Bem-Vindo ao Sistema de Gerenciamento Escolar!");
        System.out.println("==============================================");

        // variaveis pra aux
        int opcao = 0;

        // loop
        while (opcao != 5) {
            // Menu
            System.out.println("\n===== MENU =====");
            System.out.println("1 - Cadastrar aluno");
            System.out.println("2 - Cadastrar professor");
            System.out.println("3 - Listar alunos");
            System.out.println("4 - Listar professores");
            System.out.println("5 - Fechar sistema");
            System.out.print("Escolha: ");

            opcao = scanner.nextInt();
            scanner.nextLine();

            // casos
            switch (opcao) {
                case 1:
                    System.out.println("Cadastro de Aluno");
                    System.out.println("=================");

                    System.out.print("Nome: ");
                    String nomeAluno = scanner.nextLine();

                    System.out.print("Idade: ");
                    int idadeAluno = scanner.nextInt();
                    scanner.nextLine();

                    System.out.println("CPF: ");
                    String cpfAluno = scanner.nextLine();

                    System.out.print("Série: ");
                    int serie = scanner.nextInt();
                    scanner.nextLine();

                    System.out.print("Turma: ");
                    int turma = scanner.nextInt();
                    scanner.nextLine();

                    Aluno aluno = new Aluno(nomeAluno, idadeAluno, cpfAluno, serie, turma);

                    listaAlunos.add(aluno);

                    System.out.println("=================");

                    System.out.println("Aluno cadastrado!");
                    break;

                case 2:
                    System.out.println("Cadastro de Professor");
                    System.out.println("=====================");

                    System.out.print("Nome: ");
                    String nomeProfessor = scanner.nextLine();

                    System.out.print("Idade: ");
                    int idadeProfessor = scanner.nextInt();
                    scanner.nextLine();

                    System.out.println("CPF: ");
                    String cpfProfessor = scanner.nextLine();
                    scanner.nextLine();

                    System.out.print("Salário: ");
                    double salario = scanner.nextDouble();
                    scanner.nextLine();

                    System.out.print("Matéria: ");
                    String materia = scanner.nextLine();
                    scanner.nextLine();

                    Professor professor = new Professor(nomeProfessor, idadeProfessor, cpfProfessor, salario, materia);

                    listaProfessores.add(professor);

                    System.out.println("=====================");

                    System.out.println("Professor cadastrado!");
                    break;

                case 3:
                    if (listaAlunos.isEmpty()) {
                        System.out.println("ERRO: Nenhum aluno cadastrado no sistema!");
                    } else {
                        System.out.println("Lista de Alunos cadastrados: ");
                        System.out.println("=============================");
                        // "Para cada aluno dentro da lista de alunos…"
                        for (Aluno alunoAtual : listaAlunos) {
                            System.out.println(alunoAtual.exibirAluno());
                            System.out.println("=============================");
                        }
                    }
                    break;

                case 4:
                    if (listaAlunos.isEmpty()) {
                        System.out.println("ERRO: Nenhum professor cadastrado no sistema!");
                    } else {
                        System.out.println("Lista de Professores cadastrados: ");
                        System.out.println("=============================");

                        for (Professor professorAtual : listaProfessores) {
                            System.out.println(professorAtual.exibirProfessor());
                            System.out.println("=============================");
                        }
                    }
                    break;

                case 5:
                    System.out.println("Fechando Sistema... :)");
                    break;

                default:
                    System.out.println("ERRO: Opção inválida.");

            }
        }

    }
}
