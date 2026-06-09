public class ContaBancaria {
    private String titular;
    private double saldo;
    private double limiteSaque;

    public ContaBancaria(String titular, double saldo, double limiteSaque) {
        this.titular = titular;
        this.limiteSaque = limiteSaque;
        this.saldo = saldo;
    }

    // Getters e Setters



    public String getTitular() {
        return titular;
    }

    public void setTitular(String titular) {
        if (titular == "" || titular.trim().isEmpty()) { // corrigido a segunda condição usando métodos prontos
            System.out.println("ERRO: Nome do titular inválido.");
        } else {
            this.titular = titular;
        }
    }

    public double getSaldo() {
        return saldo;
    }

    public void setSaldo(double saldo) {
        this.saldo = saldo;
    }

    public double getLimiteSaque() {
        return limiteSaque;
    }

    public void setLimiteSaque(double limiteSaque) {
        if (limiteSaque <= 0) {
            System.out.println("ERRO: Limite inválido.");
        } else {
            this.limiteSaque = limiteSaque;
        }
    }

    // metodos para Depositar, Sacar e Exibir Dados
    
    public void depositar(double valorDeposito) {
        if (valorDeposito > 0) {
            saldo += valorDeposito;
            System.out.println("Depósito de R$" + valorDeposito + " realizado com sucesso!");
        } else {
            System.out.println("ERRO: Valor de depósito inválido.");
        }
    }

    public void sacar(double valorSaque) {
        if (valorSaque > limiteSaque) {
            System.out.println("ERRO: Limite de saque excedido!");
        } else if (valorSaque <= 0) {
            System.out.println("ERRO: Valor inválido!");
        } else if (valorSaque > saldo) {
            System.out.println("ERRO: Saldo insuficiente!");
        } else {
            saldo -= valorSaque;
            System.out.println("Saque de R$" + valorSaque + " realizado com sucesso!");
        }
    }

    public String exibirDados() {
        return "\nNome do titular: " + titular +
               "\nSaldo atual: R$" + saldo +
               "\nLimite saque: R$" + limiteSaque;
    }
}
