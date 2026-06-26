public class Funcionario extends Pessoa {
    private String cargo;
    private double salario;

    // construtor
    public Funcionario(String nome, String cpf, String telefone, String cargo, double salario) {
        super(nome, cpf, telefone);
        this.cargo = cargo;
        this.salario = salario;
    }

    // getters, setters e metodos

    public String getCargo() {
        return cargo;
    }

    public void setCargo(String cargo) {
        if (cargo == null || cargo.trim().isEmpty()) {
            System.out.println("ERRO: Cargo inválido.");
        } else {
            this.cargo = cargo;
        }
    }

    public double getSalario() {
        return salario;
    }

    public void setSalario(double salario) {
        if (salario <= 0) {
            System.out.println("ERRO: Salário inválido.");
        } else {
            this.salario = salario;
        }
    }

    @Override
    public String exibir() {
        return "Nome do funcionário: " + getNome() + "\nCPF: " + getCpf() + "\nCargo: " + cargo + "\nSalário: R$ "
                + String.format("%.2f", salario);
    }

}
