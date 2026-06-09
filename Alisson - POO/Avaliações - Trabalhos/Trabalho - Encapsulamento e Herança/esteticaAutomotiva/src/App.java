import java.util.Scanner;

public class App {
    public static void main(String[] args) {
        // importando Objetos
        Scanner scanner = new Scanner(System.in);
        Gerenciamento gerenciamento = new Gerenciamento();

        // area reservada para testes
        Cliente c1 = new Cliente("Neymar da Silva Santos Junior", "000.000.001-91", "(11) 99999-0001", "Rua do Polimento, 1");
        Cliente c2 = new Cliente("Pelé", "000.000.002-92", "(11) 99999-0002", "Av. Lustro, 22");
        Cliente c3 = new Cliente("Ronaldinho Gaúcho", "000.000.003-93", "(11) 99999-0003", "Alameda Shine, 33");
        gerenciamento.listaClientes.add(c1);
        gerenciamento.listaClientes.add(c2);
        gerenciamento.listaClientes.add(c3);

        Funcionario f1 = new Funcionario("Ancelotti", "111.111.111-11", "(11) 98888-1111", "Técnico Sênior",
                4500.0);
        Funcionario f2 = new Funcionario("Jorge Jesus", "222.222.222-22", "(11) 98888-2222",
                "Designer de Estética", 5200.0);
        Funcionario f3 = new Funcionario("Filipe Luís", "333.333.333-33", "(11) 98888-3333", "Detailer Master",
                6000.0);
        gerenciamento.listaFuncionarios.add(f1);
        gerenciamento.listaFuncionarios.add(f2);
        gerenciamento.listaFuncionarios.add(f3);

        Servico s1 = new Servico("Polimento Estelar", "Polimento avançado com lustro profundo", 499.90, 180);
        Servico s2 = new Servico("Cerâmica Titan", "Revestimento cerâmico premium 9H", 1599.00, 240);
        Servico s3 = new Servico("Hidratação de Couro Royale", "Tratamento completo para bancos de couro", 299.90, 90);
        gerenciamento.listaServicos.add(s1);
        gerenciamento.listaServicos.add(s2);
        gerenciamento.listaServicos.add(s3);

        Veiculo v1 = new Veiculo("Ferrari", "F8 Spider", "F8A-2026", c1);
        Veiculo v2 = new Veiculo("Rolls-Royce", "Phantom", "RRX-0001", c2);
        Veiculo v3 = new Veiculo("Porsche", "911 Turbo S", "POR-911", c3);
        gerenciamento.listaVeiculos.add(v1);
        gerenciamento.listaVeiculos.add(v2);
        gerenciamento.listaVeiculos.add(v3);

        Agendamento a1 = new Agendamento(c1, v1, s1, "Pendente", "09:00", "10/06/2026");
        Agendamento a2 = new Agendamento(c2, v2, s2, "Pendente", "11:30", "11/06/2026");
        Agendamento a3 = new Agendamento(c3, v3, s3, "Pendente", "14:00", "12/06/2026");
        gerenciamento.listaAgendamentos.add(a1);
        gerenciamento.listaAgendamentos.add(a2);
        gerenciamento.listaAgendamentos.add(a3);
        // fim da area reservada para testes

        // variaveis utilitarias
        int opcao = 0;
        
        System.out.println("Bem-Vindo ao Sistema de Agendamentos de Estética Automotiva");
        System.out.println("===========================================================");

        while (opcao != 17) {
            System.out.println("Menu: ");
            System.out.println("1 - Cadastrar cliente");
            System.out.println("2 - Cadastrar funcionário");
            System.out.println("3 - Cadastrar veículo");
            System.out.println("4 - Cadastrar serviço");
            System.out.println("5 - Agendar um serviço");
            System.out.println("6 - Concluir agendamento");
            System.out.println("7 - Cancelar agendamento");
            System.out.println("8 - Remover cliente");
            System.out.println("9 - Remover funcionário");
            System.out.println("10 - Remover veículo");
            System.out.println("11 - Remover serviço");
            System.out.println("12 - Listar clientes");
            System.out.println("13 - Listar funcionários");
            System.out.println("14 - Listar veículos");
            System.out.println("15 - Listar serviços");
            System.out.println("16 - Listar agendamentos");
            System.out.println("17 - Sair");

            System.out.println("=========================");

            System.out.println("Escolha uma opção: ");
            opcao = scanner.nextInt();

            switch (opcao) {
                case 1:
                    gerenciamento.cadastrarCliente(scanner);
                    break;
                case 2:
                    gerenciamento.cadastrarFuncionario(scanner);
                    break;
                case 3:
                    gerenciamento.cadastrarVeiculo(scanner);
                    break;
                case 4:
                    gerenciamento.cadastrarServico(scanner);
                    break;
                case 5:
                    gerenciamento.agendarServico(scanner);
                    break;
                case 6:
                    gerenciamento.concluirAgendamento(scanner);
                    break;
                case 7:
                    gerenciamento.cancelarAgendamento(scanner);
                    break;
                case 8:
                    gerenciamento.removerCliente(scanner);
                    break;
                case 9:
                    gerenciamento.removerFuncionario(scanner);
                    break;
                case 10:
                    gerenciamento.removerVeiculo(scanner);
                    break;
                case 11:
                    gerenciamento.removerServico(scanner);
                    break;
                case 12:
                    gerenciamento.listarClientes();
                    break;
                case 13:
                    gerenciamento.listarFuncionarios();
                    break;
                case 14:
                    gerenciamento.listarVeiculos();
                    break;
                case 15:
                    gerenciamento.listarServicos();
                    break;
                case 16:
                    gerenciamento.listarAgendamentos();
                    break;
                case 17:
                    System.out.println("Saindo... Até logo :)");
                    break;

                default:
                    System.out.println("ERRO: Opção inválida.");
                    break;
            }
        }

    }
}
