public class Gerente extends Pessoa {
    String salario;
    String setor;


    public Gerente(String nome, String cpf, String salario, String setor) {
        super(nome, cpf);
        this.salario = salario;
        this.setor = setor;
    }

    public Gerente(String salario, String setor) {
        this.salario = salario;
        this.setor = setor;
    }

    public String getSalario() {
        return salario;
    }

    public void setSalario(String salario) {
        this.salario = salario;
    }

    public String getSetor() {
        return setor;
    }

    public void setSetor(String setor) {
        this.setor = setor;
    }

    public String exibirDados() {
        return "Gerente" + "\n" + super.exibirDados() + "\n" + "Salário: " + salario + "\n" + "Setor: " + setor;
    }
}