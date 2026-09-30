public class Funcionario extends Pessoa {
    String salario;
    String cargo;

    public Funcionario(String nome, String cpf, String salario, String cargo) {
        super(nome, cpf);
        this.salario = salario;
        this.cargo = cargo;
    }

    public Funcionario(String salario, String cargo) {
        this.salario = salario;
        this.cargo = cargo;
    }

    public String getSalario() {
        return salario;
    }

    public void setSalario(String salario) {
        this.salario = salario;
    }

    public String getCargo() {
        return cargo;
    }

    public void setCargo(String cargo) {
        this.cargo = cargo;
    }

    @Override
    public String exibirDados() {
        return "Funcionário" + "\n" + super.exibirDados() + "\n" + "Salário: " + salario + "\n" + "Cargo: " + cargo;
    }
}
