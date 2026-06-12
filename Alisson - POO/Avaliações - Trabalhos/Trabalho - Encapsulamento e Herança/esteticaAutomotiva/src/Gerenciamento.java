import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class Gerenciamento {
    // instanciando scanner e as lists
    Scanner scanner = new Scanner(System.in);
    List<Cliente> listaClientes = new ArrayList<>();
    List<Funcionario> listaFuncionarios = new ArrayList<>();
    List<Servico> listaServicos = new ArrayList<>();
    List<Agendamento> listaAgendamentos = new ArrayList<>();
    List<Veiculo> listaVeiculos = new ArrayList<>();

    // criando os metodos
    // cadastros

    public void cadastrarCliente(Scanner scanner) {
        System.out.println("Cadastro de Cliente");
        System.out.println("===================");

        String nomeDigitado;

        do {
            System.out.print("Digite o nome: ");
            nomeDigitado = scanner.nextLine();

            if (nomeDigitado.trim().isEmpty()) {
                System.out.println("ERRO: O nome não pode ficar vazio.");
            }

        } while (nomeDigitado.trim().isEmpty());

        String cpfDigitado;

        do {
            System.out.print("Digite o CPF: ");
            cpfDigitado = scanner.nextLine();

            if (cpfDigitado.trim().isEmpty()) {
                System.out.println("ERRO: O CPF não pode ficar vazio.");
            }

        } while (cpfDigitado.trim().isEmpty());

        String telefoneDigitado;

        do {
            System.out.print("Digite o telefone: ");
            telefoneDigitado = scanner.nextLine();

            if (telefoneDigitado.trim().isEmpty()) {
                System.out.println("ERRO: O telefone não pode ficar vazio.");
            }

        } while (telefoneDigitado.trim().isEmpty());

        String enderecoDigitado;

        do {
            System.out.print("Digite o endereço: ");
            enderecoDigitado = scanner.nextLine();

            if (enderecoDigitado.trim().isEmpty()) {
                System.out.println("ERRO: O endereço não pode ficar vazio.");
            }

        } while (enderecoDigitado.trim().isEmpty());

        System.out.println("====================");
        System.out.println("Deseja concluir o cadastro?");
        System.out.println("1 - Sim");
        System.out.println("2 - Não");

        System.out.println("====================");
        int cadastrarSimNao = scanner.nextInt();
        scanner.nextLine();

        if (cadastrarSimNao == 1) {
            Cliente cliente = new Cliente(nomeDigitado, cpfDigitado, telefoneDigitado, enderecoDigitado);
            listaClientes.add(cliente);
            System.out.println("Cadastro concluído.");
        } else {
            System.out.println("Cadastro cancelado.");
        }
    }

    public void cadastrarFuncionario(Scanner scanner) {
        System.out.println("Cadastro de Funcionário");
        System.out.println("=======================");

        String nomeDigitado;

        do {
            System.out.print("Digite o nome: ");
            nomeDigitado = scanner.nextLine();

            if (nomeDigitado.trim().isEmpty()) {
                System.out.println("ERRO: O nome não pode ficar vazio.");
            }

        } while (nomeDigitado.trim().isEmpty());

        String cpfDigitado;

        do {
            System.out.print("Digite o CPF: ");
            cpfDigitado = scanner.nextLine();

            if (cpfDigitado.trim().isEmpty()) {
                System.out.println("ERRO: O CPF não pode ficar vazio.");
            }

        } while (cpfDigitado.trim().isEmpty());

        String telefoneDigitado;

        do {
            System.out.print("Digite o telefone: ");
            telefoneDigitado = scanner.nextLine();

            if (telefoneDigitado.trim().isEmpty()) {
                System.out.println("ERRO: O telefone não pode ficar vazio.");
            }

        } while (telefoneDigitado.trim().isEmpty());

        String cargoDigitado;

        do {
            System.out.println("Digite o cargo: ");
            cargoDigitado = scanner.nextLine();

            if (cargoDigitado.trim().isEmpty()) {
                System.out.println("ERRO: O cargo não pode ficar vazio.");
            }

        } while (cargoDigitado.trim().isEmpty());

        double salarioDigitado;

        do {
            System.out.print("Digite o salário: ");
            salarioDigitado = scanner.nextDouble();

            if (salarioDigitado <= 0) {
                System.out.println("ERRO: O salário deve ser maior que zero.");
            }

        } while (salarioDigitado <= 0);

        System.out.println("====================");
        System.out.println("Deseja concluir o cadastro?");
        System.out.println("1 - Sim");
        System.out.println("2 - Não");

        System.out.println("====================");
        int cadastrarSimNao = scanner.nextInt();

        if (cadastrarSimNao == 1) {
            Funcionario funcionario = new Funcionario(nomeDigitado, cpfDigitado, telefoneDigitado, cargoDigitado,
                    salarioDigitado);
            listaFuncionarios.add(funcionario);

            System.out.println("Cadastro concluído.");
        } else {
            System.out.println("Cadastro cancelado.");
        }
    }

    public void cadastrarVeiculo(Scanner scanner) {
        System.out.println("Cadastro de Veiculo");
        System.out.println("===================");

        System.out.println("Digite a marca: ");
        String marcaDigitada = scanner.nextLine();

        System.out.println("Digite o modelo: ");
        String modeloDigitado = scanner.nextLine();

        String placaDigitada;
        boolean placaExiste;

        do {
            System.out.println("Digite a placa: ");
            placaDigitada = scanner.nextLine();

            placaExiste = false;

            if (placaDigitada.trim().isEmpty()) {
                System.out.println("ERRO: A placa não pode ficar vazia.");
                continue;
            }

            for (Veiculo veiculo : listaVeiculos) {
                if (veiculo.getPlaca().equalsIgnoreCase(placaDigitada)) {
                    placaExiste = true;
                    System.out.println("ERRO: Já existe um veículo com essa placa.");
                    break;
                }
            }

        } while (placaDigitada.trim().isEmpty() || placaExiste);

        System.out.println("De quem é o veículo?");
        listarClientes();
        int opcaoCliente = scanner.nextInt();
        Cliente clienteSelecionado = listaClientes.get(opcaoCliente - 1);

        System.out.println("====================");
        System.out.println("Deseja concluir o cadastro?");
        System.out.println("1 - Sim");
        System.out.println("2 - Não");

        System.out.println("====================");
        int cadastrarSimNao = scanner.nextInt();

        if (cadastrarSimNao == 1) {
            Veiculo veiculo = new Veiculo(marcaDigitada, modeloDigitado, placaDigitada, clienteSelecionado);
            listaVeiculos.add(veiculo);
            System.out.println("Cadastro concluído.");
        } else {
            System.out.println("Cadastro cancelado.");
        }
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

        System.out.println("====================");
        System.out.println("Deseja concluir o cadastro?");
        System.out.println("1 - Sim");
        System.out.println("2 - Não");

        System.out.println("====================");
        int cadastrarSimNao = scanner.nextInt();

        if (cadastrarSimNao == 1) {
            Servico servico = new Servico(nomeDigitado, descricaoDigitada, precoDigitado, duracaoDigitada);
            listaServicos.add(servico);
            System.out.println("Cadastro concluído.");
        } else {
            System.out.println("Cadastro cancelado.");
        }
    }

    // agendar, concluir, cancelar

    public void agendarServico(Scanner scanner) {
        System.out.println("Agendamento de Serviço");
        System.out.println("======================");

        System.out.println("Qual o cliente? ");
        listarClientes();
        int opcaoCliente = scanner.nextInt();
        Cliente clienteSelecionado = listaClientes.get(opcaoCliente - 1);

        System.out.println("======================");

        System.out.println("Qual o veículo? ");

        // Lista temporária para guardar apenas os veículos do cliente escolhido
        List<Veiculo> veiculosDoCliente = new ArrayList<>();

        for (Veiculo veiculo : listaVeiculos) {

            if (veiculo.getDono().equals(clienteSelecionado)) {

                veiculosDoCliente.add(veiculo);

                System.out.println(
                        veiculosDoCliente.size() +
                                " - " +
                                veiculo.exibirModeloPlacaDono());
            }
        }

        if (veiculosDoCliente.isEmpty()) {
            System.out.println("Este cliente não possui veículos cadastrados.");
            return;
        }

        int opcaoVeiculo = scanner.nextInt();

        Veiculo veiculoSelecionado = veiculosDoCliente.get(opcaoVeiculo - 1);

        System.out.println("======================");

        System.out.println("Qual o servço? ");
        listarServicos();
        int opcaoServico = scanner.nextInt();
        scanner.nextLine();
        Servico servicoSelecionado = listaServicos.get(opcaoServico - 1);

        String statusPadrao = "Pendente";

        System.out.println("Informe uma data (dd/mm/aaaa):");
        String dataDigitada = scanner.nextLine();

        System.out.println("Informe um horário (hh:mm): ");
        String horarioDigitado = scanner.nextLine();

        System.out.println("====================");
        System.out.println("Deseja concluir o cadastro?");
        System.out.println("1 - Sim");
        System.out.println("2 - Não");

        System.out.println("====================");
        int cadastrarSimNao = scanner.nextInt();

        if (cadastrarSimNao == 1) {
            Agendamento agendamento = new Agendamento(clienteSelecionado, veiculoSelecionado, servicoSelecionado,
                    statusPadrao, horarioDigitado, dataDigitada);
            listaAgendamentos.add(agendamento);
            System.out.println("Cadastro concluído.");
        } else {
            System.out.println("Cadastro cancelado.");
        }
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

    // remoções

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

    // listagens

    public void listarClientes() {
        System.out.println("Lista de clientes cadastrados: ");
        System.out.println("===============================");

        if (listaClientes.isEmpty()) {
            System.out.println("ERRO: Nenhum cliente cadastrado!");
        } else {
            for (int i = 0; i < listaClientes.size(); i++) {
                System.out.println((i + 1) + " ===== " + listaClientes.get(i).exibirNomeCpf());
            }
        }
    }

    public void listarFuncionarios() {
        System.out.println("Lista de funcionários cadastrados: ");
        System.out.println("===================================");

        if (listaFuncionarios.isEmpty()) {
            System.out.println("ERRO: Nenhum funcionário cadastrado!");
        } else {
            for (int i = 0; i < listaFuncionarios.size(); i++) {
                System.out.println((i + 1) + " ===== " + listaFuncionarios.get(i).exibirNomeCpf());
            }
        }
    }

    public void listarVeiculos() {
        System.out.println("Lista de veículos cadastrados: ");
        System.out.println("===============================");

        if (listaVeiculos.isEmpty()) {
            System.out.println("ERRO: Nenhum veículo cadastrado!");
        } else {
            for (int i = 0; i < listaVeiculos.size(); i++) {
                System.out.println((i + 1) + " ===== " + listaVeiculos.get(i).exibirModeloPlacaDono());
            }
        }
    }

    public void listarServicos() {
        System.out.println("Lista de serviços cadastrados: ");
        System.out.println("===============================");

        if (listaServicos.isEmpty()) {
            System.out.println("ERRO: Nenhum serviço cadastrado!");
        } else {
            for (int i = 0; i < listaServicos.size(); i++) {
                System.out.println((i + 1) + " ===== " + listaServicos.get(i).exibirNomePrecoDuracao());
            }
        }
    }

    public void listarAgendamentos() {
        System.out.println("Lista de agendamentos cadastrados: ");
        System.out.println("===================================");

        if (listaAgendamentos.isEmpty()) {
            System.out.println("ERRO: Nenhum agendamento cadastrado!");
        } else {
            for (int i = 0; i < listaAgendamentos.size(); i++) {
                System.out.println((i + 1) + " ===== " + listaAgendamentos.get(i).exibirClienteServicoStatus());
            }
        }
    }

    // buscas

    public void buscarCliente(Scanner scanner) {
        System.out.println("Buscar Cliente");
        System.out.println("==============");

        System.out.println("Digite o nome do cliente que deseja buscar:");
        String nomeBusca = scanner.nextLine();

        boolean encontrado = false;

        for (Cliente cliente : listaClientes) {

            if (cliente.getNome().equalsIgnoreCase(nomeBusca)) {

                System.out.println(cliente.exibirDadosCompleto());
                encontrado = true;
            }

        }

        if (!encontrado) {
            System.out.println("ERRO: Cliente não encontrado!");
        }
    }

    public void buscarVeiculo(Scanner scanner) {
        System.out.println("Buscar Veículo");
        System.out.println("==============");

        System.out.println("Digite a placa: ");
        String placaBusca = scanner.nextLine();

        boolean encontrado = false;

        for (Veiculo veiculo : listaVeiculos) {

            if (veiculo.getPlaca().equalsIgnoreCase(placaBusca)) {

                System.out.println(veiculo.exibirModeloPlacaDono());
                encontrado = true;
            }

        }

        if (!encontrado) {
            System.out.println("ERRO: Veículo não encontrado!");
        }
    }

    // menus

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

    public void exibirMenuBuscas() {

        int opcao;

        do {

            System.out.println("Menu - Buscas: ");

            System.out.println("1 - Buscar cliente");
            System.out.println("2 - Buscar veículo");
            System.out.println("3 - Voltar");

            System.out.println("=========================");

            System.out.println("Escolha uma opção: ");

            opcao = scanner.nextInt();
            scanner.nextLine();

            switch (opcao) {

                case 1:
                    buscarCliente(scanner);
                    break;
                case 2:
                    buscarVeiculo(scanner);
                    break;
                case 3:
                    System.out.println("Voltando...");
                    break;
                default:
                    System.out.println("ERRO: Opção inválida");
                    break;

            }

        } while (opcao != 3);
    }

    public void exibirMenuPrincipal() {
        Scanner scanner = new Scanner(System.in);

        int opcao = 0;

        while (opcao != 6) {
            System.out.println("Menu: ");
            System.out.println("1 - Cadastros");
            System.out.println("2 - Listagens");
            System.out.println("3 - Agendamentos");
            System.out.println("4 - Remoções");
            System.out.println("5 - Buscas");
            System.out.println("6 - Sair");

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
                    exibirMenuBuscas();
                    break;
                case 6:
                    System.out.println("=====================");
                    System.out.println("Saindo... Até logo :)");
                    break;
                default:
                    System.out.println("ERRO: Opção inválida.");
                    break;
            }
        }
        scanner.close();
    }
}