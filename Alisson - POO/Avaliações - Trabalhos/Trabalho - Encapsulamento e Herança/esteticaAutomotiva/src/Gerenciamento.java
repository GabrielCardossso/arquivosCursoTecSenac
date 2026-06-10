import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class Gerenciamento {
    // criando arrayLists e scanner
    Scanner scanner = new Scanner(System.in);
    List<Cliente> listaClientes = new ArrayList<>();
    List<Funcionario> listaFuncionarios = new ArrayList<>();
    List<Servico> listaServicos = new ArrayList<>();
    List<Agendamento> listaAgendamentos = new ArrayList<>();
    List<Veiculo> listaVeiculos = new ArrayList<>();

    public void cadastrarCliente(Scanner scanner) {
        System.out.println("Cadastro de Cliente");
        System.out.println("===================");

        System.out.println("Digite o nome: ");
        String nomeDigitado = scanner.nextLine();

        System.out.println("Digite o CPF: ");
        String cpfDigitado = scanner.nextLine();

        System.out.println("Digite o telefone: ");
        String telefoneDigitado = scanner.nextLine();

        System.out.println("Digite o endereço: ");
        String enderecoDigitado = scanner.nextLine();

        Cliente cliente = new Cliente(nomeDigitado, cpfDigitado, telefoneDigitado, enderecoDigitado);
        listaClientes.add(cliente);
        System.out.println("Cadastro de Cliente Concluído.");
    }

    public void cadastrarFuncionario(Scanner scanner) {
        System.out.println("Cadastro de Funcionário");
        System.out.println("=======================");

        System.out.println("Digite o nome: ");
        String nomeDigitado = scanner.nextLine();

        System.out.println("Digite o CPF: ");
        String cpfDigitado = scanner.nextLine();

        System.out.println("Digite o telefone: ");
        String telefoneDigitado = scanner.nextLine();

        System.out.println("Digite o cargo: ");
        String cargoDigitado = scanner.nextLine();

        System.out.println("Digite o salário: ");
        double salarioDigitado = scanner.nextDouble();

        Funcionario funcionario = new Funcionario(nomeDigitado, cpfDigitado, telefoneDigitado, cargoDigitado,
                salarioDigitado);
        listaFuncionarios.add(funcionario);
        System.out.println("Cadastro de Funcionário Concluído.");
    }

    public void cadastrarVeiculo(Scanner scanner) {
        System.out.println("Cadastro de Veiculo");
        System.out.println("===================");

        System.out.println("Digite a marca: ");
        String marcaDigitada = scanner.nextLine();

        System.out.println("Digite o modelo: ");
        String modeloDigitado = scanner.nextLine();

        System.out.println("Digite a placa: ");
        String placaDigitada = scanner.nextLine();

        System.out.println("De quem é o veículo?");
        listarClientes();
        int opcaoCliente = scanner.nextInt();
        Cliente clienteSelecionado = listaClientes.get(opcaoCliente - 1);

        Veiculo veiculo = new Veiculo(marcaDigitada, modeloDigitado, placaDigitada, clienteSelecionado);
        listaVeiculos.add(veiculo);
        System.out.println("Cadastro de Veículo Concluído.");
    }

    public void cadastrarServico(Scanner scanner) {
        System.out.println("Cadastro de Serviço");
        System.out.println("===================");

        System.out.println("Digite o nome: ");
        String nomeDigitado = scanner.nextLine();

        System.out.println("Digite a descrição: ");
        String descricaoDigitada = scanner.nextLine();

        System.out.println("Digite o preço: ");
        Double precoDigitado = scanner.nextDouble();

        System.out.println("Digite a duração (em minutos): ");
        int duracaoDigitada = scanner.nextInt();

        Servico servico = new Servico(nomeDigitado, descricaoDigitada, precoDigitado, duracaoDigitada);
        listaServicos.add(servico);
        System.out.println("Cadastro de Cliente Concluído.");
    }

    public void agendarServico(Scanner scanner) {
        System.out.println("Agendamento de Serviço");
        System.out.println("======================");

        System.out.println("Qual o cliente? ");
        listarClientes();
        int opcaoCliente = scanner.nextInt();
        Cliente clienteSelecionado = listaClientes.get(opcaoCliente - 1);

        System.out.println("======================");

        System.out.println("Qual o veículo? ");
        listarVeiculos();
        int opcaoVeiculo = scanner.nextInt();
        Veiculo veiculoSelecionado = listaVeiculos.get(opcaoVeiculo - 1);

        System.out.println("======================");

        System.out.println("Qual o servço? ");
        listarServicos();
        int opcaoServico = scanner.nextInt();
        Servico servicoSelecionado = listaServicos.get(opcaoServico - 1);

        String statusPadrao = "Pendente";

        System.out.println("Informe uma data (dd/mm/aaaa):");
        String dataDigitada = scanner.nextLine();

        System.out.println("Informe um horário (hh:mm): ");
        String horarioDigitado = scanner.nextLine();

        Agendamento agendamento = new Agendamento(clienteSelecionado, veiculoSelecionado, servicoSelecionado,
                statusPadrao, horarioDigitado, dataDigitada);
        listaAgendamentos.add(agendamento);
    }

    public void concluirAgendamento(Scanner scanner) {
        System.out.println("Concluir agendamento");
        System.out.println("====================");

        System.out.println("Escolha um agendamento para concluir: ");
        listarAgendamentos();
        int opcaoAgendamento = scanner.nextInt();
        Agendamento agendamentoSelecionado = listaAgendamentos.get(opcaoAgendamento - 1);
        agendamentoSelecionado.setStatus("Concluído");

        System.out.println("Agendamento concluído!");
    }

    public void cancelarAgendamento(Scanner scanner) {
        System.out.println("Cancelar agendamento");
        System.out.println("====================");

        System.out.println("Escolha um agendamento para cancelar: ");
        listarAgendamentos();
        int opcaoAgendamento = scanner.nextInt();
        Agendamento agendamentoSelecionado = listaAgendamentos.get(opcaoAgendamento - 1);
        agendamentoSelecionado.setStatus("Cancelado");

        System.out.println("Agendamento cancelado!");
    }

    public void removerCliente(Scanner scanner) {
        System.out.println("Remover cliente");
        System.out.println("===============");

        System.out.println("Escolha um cliente para remover: ");
        listarClientes();
        int opcaoRemocao = scanner.nextInt();
        listaClientes.remove(opcaoRemocao - 1);
        System.out.println("Cliente removido!");
    }

    public void removerFuncionario(Scanner scanner) {
        System.out.println("Remover funcionário");
        System.out.println("===============");

        System.out.println("Escolha um funcionário para remover: ");
        listarFuncionarios();
        int opcaoRemocao = scanner.nextInt();
        listaFuncionarios.remove(opcaoRemocao - 1);
        System.out.println("Funcionário removido!");
    }

    public void removerVeiculo(Scanner scanner) {
        System.out.println("Remover veículo");
        System.out.println("===============");

        System.out.println("Escolha um veículo para remover: ");
        listarVeiculos();
        int opcaoRemocao = scanner.nextInt();
        listaVeiculos.remove(opcaoRemocao - 1);
        System.out.println("Veículo removido!");
    }

    public void removerServico(Scanner scanner) {
        System.out.println("Remover serviço");
        System.out.println("===============");

        System.out.println("Escolha um serviço para remover: ");
        listarServicos();
        int opcaoRemocao = scanner.nextInt();
        listaServicos.remove(opcaoRemocao - 1);
        System.out.println("Serviço removido!");
    }

    public void listarClientes() {
        System.out.println("Lista de clientes cadastrados: ");
        System.out.println("===============================");

        for (int i = 0; i < listaClientes.size(); i++) {
            System.out.println((i + 1) + " ===== " + listaClientes.get(i).exibirNomeCpf());
        }
    }

    public void listarFuncionarios() {
        System.out.println("Lista de funcionários cadastrados: ");
        System.out.println("===================================");

        for (int i = 0; i < listaFuncionarios.size(); i++) {
            System.out.println((i + 1) + " ===== " + listaFuncionarios.get(i).exibirNomeCpf());
        }
    }

    public void listarVeiculos() {
        System.out.println("Lista de veículos cadastrados: ");
        System.out.println("===============================");

        for (int i = 0; i < listaVeiculos.size(); i++) {
            System.out.println((i + 1) + " ===== " + listaVeiculos.get(i).exibirModeloPlacaDono());
        }
    }

    public void listarServicos() {
        System.out.println("Lista de serviços cadastrados: ");
        System.out.println("===============================");

        for (int i = 0; i < listaServicos.size(); i++) {
            System.out.println((i + 1) + " ===== " + listaServicos.get(i).exibirNomePrecoDuracao());
        }
    }

    public void listarAgendamentos() {
        System.out.println("Lista de agendamentos cadastrados: ");
        System.out.println("===================================");

        for (int i = 0; i < listaAgendamentos.size(); i++) {
            System.out.println((i + 1) + " ===== " + listaAgendamentos.get(i).exibirClienteServicoStatus());
        }
    }

    public void exibirMenuCadastros() {

        int opcao;

        do {

            System.out.println("Menu - Cadastros: ");

            System.out.println("1 - Cadastrar cliente");
            System.out.println("2 - Cadastrar funcionário");
            System.out.println("3 - Cadastrar veículo");
            System.out.println("4 - Cadastrar serviço");
            System.out.println("5 - Voltar");

            System.out.println("=========================");

            System.out.println("Escolha uma opção: ");

            opcao = scanner.nextInt();
            scanner.nextLine();

            switch (opcao) {

                case 1:
                    cadastrarCliente(scanner);
                    break;
                case 2:
                    cadastrarFuncionario(scanner);
                    break;
                case 3:
                    cadastrarVeiculo(scanner);
                    break;
                case 4:
                    cadastrarServico(scanner);
                    break;
                case 5:
                    System.out.println("Voltando...");
                    break;
                default:
                    System.out.println("ERRO: Opção inválida");
                    break;
            }

        } while (opcao != 5);

    }

    public void exibirMenuListagens() {

        int opcao;

        do {

            System.out.println("Menu - Listagens: ");

            System.out.println("1 - Listar clientes");
            System.out.println("2 - Listar funcionários");
            System.out.println("3 - Listar veículos");
            System.out.println("4 - Listar serviços");
            System.out.println("5 - Listar agendamentos");
            System.out.println("6 - Voltar");

            System.out.println("=========================");

            System.out.println("Escolha uma opção: ");

            opcao = scanner.nextInt();
            scanner.nextLine();

            switch (opcao) {

                case 1:
                    listarClientes();
                    break;
                case 2:
                    listarFuncionarios();
                    break;
                case 3:
                    listarVeiculos();
                    break;
                case 4:
                    listarServicos();
                    break;
                case 5:
                    listarAgendamentos();
                    break;
                case 6:
                    System.out.println("Voltando...");
                    break;
                default:
                    System.out.println("ERRO: Opção inválida");
                    break;

            }

        } while (opcao != 6);
    }

    public void exibirMenuAgendamentos() {

        int opcao;

        do {

            System.out.println("Menu - Agendamentos: ");

            System.out.println("1 - Agendar um serviço");
            System.out.println("2 - Concluir agendamento");
            System.out.println("3 - Cancelar agendamento");
            System.out.println("4 - Listar agendamentos");
            System.out.println("5 - Voltar");

            System.out.println("=========================");

            System.out.println("Escolha uma opção: ");

            opcao = scanner.nextInt();
            scanner.nextLine();

            switch (opcao) {

                case 1:
                    agendarServico(scanner);
                    break;
                case 2:
                    concluirAgendamento(scanner);
                    break;
                case 3:
                    cancelarAgendamento(scanner);
                    break;
                case 4:
                    listarAgendamentos();
                    break;
                case 5:
                    System.out.println("Voltando...");
                    break;
                default:
                    System.out.println("ERRO: Opção inválida");
                    break;

            }

        } while (opcao != 5);
    }

    public void exibirMenuRemocoes() {

        int opcao;

        do {

            System.out.println("Menu - Remoções: ");

            System.out.println("1 - Remover cliente");
            System.out.println("2 - Remover funcionário");
            System.out.println("3 - Remover veículo");
            System.out.println("4 - Remover serviço");
            System.out.println("5 - Voltar");

            System.out.println("=========================");

            System.out.println("Escolha uma opção: ");

            opcao = scanner.nextInt();
            scanner.nextLine();

            switch (opcao) {

                case 1:
                    removerCliente(scanner);
                    break;
                case 2:
                    removerFuncionario(scanner);
                    break;
                case 3:
                    removerVeiculo(scanner);
                    break;
                case 4:
                    removerServico(scanner);
                    break;
                case 5:
                    System.out.println("Voltando...");
                    break;
                default:
                    System.out.println("ERRO: Opção inválida");
                    break;

            }

        } while (opcao != 5);
    }

    public void exibirMenuPrincipal() {
        Scanner scanner = new Scanner(System.in);

        int opcao = 0;

        while (opcao != 5) {
            System.out.println("Menu: ");
            System.out.println("1 - Cadastros");
            System.out.println("2 - Listagens");
            System.out.println("4 - Agendamentos");
            System.out.println("4 - Remoções");
            System.out.println("5 - Sair");

            System.out.println("=========================");

            System.out.println("Escolha uma opção: ");
            opcao = scanner.nextInt();

            switch (opcao) {
                case 1:
                    exibirMenuCadastros();
                    break;
                case 2:
                    exibirMenuListagens();
                    break;
                case 3:
                    exibirMenuAgendamentos();
                    break;
                case 4:
                    exibirMenuRemocoes();
                    break;
                case 5:
                    System.out.println("=====================");
                    System.out.println("Saindo... Até logo :)");
                    break;
                default:
                    System.out.println("ERRO: Opção inválida.");
                    break;
            }
        }
    }
}