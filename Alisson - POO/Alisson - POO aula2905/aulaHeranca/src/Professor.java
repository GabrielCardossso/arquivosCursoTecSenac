public class Professor extends Pessoa {
    // variaveis do filho: Professor
    private double salario;
    private String materia;

    // construtor
    public Professor() {
        super();
    }

    public Professor(String nome, int idade, String cpf, double salario, String materia) {
        super(nome, idade, cpf);
        this.salario = salario;
        this.materia = materia;
    }

    // getters and setters
    public double getSalario() {
        return salario;
    }

    public void setSalario(double salario) {
        this.salario = salario;
    }

    public String getMateria() {
        return materia;
    }

    public void setMateria(String materia) {
        this.materia = materia;
    }

    public String exibirProfessor() {
        return "\nNome do professor: " + getNome() +
                "\nIdade: " + getIdade() +
                "\nCPF: " + getCpf() +
                "\nSalário: " + salario +
                "\nMatéria: " + materia;
    }

}
