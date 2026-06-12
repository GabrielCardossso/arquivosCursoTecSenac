
public class App {
    public static void main(String[] args) {
        // importando Objetos
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

        System.out.println("Bem-Vindo ao Sistema de Agendamentos de Estética Automotiva");
        System.out.println("===========================================================");

        gerenciamento.exibirMenuPrincipal();
    }
}
