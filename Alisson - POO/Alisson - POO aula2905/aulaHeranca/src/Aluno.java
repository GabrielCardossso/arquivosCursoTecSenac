public class Aluno extends Pessoa {
    // variaveis do filho: Aluno
    private int serie;
    private int turma;

    // construtores
    public Aluno() {
        super();
    }

    public Aluno(String nome, int idade, String cpf, int serie, int turma) {
        super(nome, idade, cpf);
        this.serie = serie;
        this.turma = turma;
    }

    // getters and setters
    public int getSerie() {
        return serie;
    }

    public void setSerie(int serie) {
        this.serie = serie;
    }

    public int getTurma() {
        return turma;
    }

    public void setTurma(int turma) {
        this.turma = turma;
    }

    public String exibirAluno() {
        return "\nNome do aluno: " + getNome() +
                "\nIdade: " + getIdade() +
                "\nCPF: " + getCpf() +
                "\nSérie: " + serie +
                "\nTurma: " + turma;
    }

}
