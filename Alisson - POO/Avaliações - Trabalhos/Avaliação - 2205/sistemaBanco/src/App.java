import java.util.ArrayList;
import java.util.List;

public class App {
    public static void main(String[] args) {
        System.out.println("Bem vindo ao sistema de Conta Bancária!");
        System.out.println("=======================================");

        List<ContaBancaria> listaContasBancarias = new ArrayList<>();

        ContaBancaria conta1 = new ContaBancaria("Gabriel Cardoso", 0.0, 0);
        ContaBancaria conta2 = new ContaBancaria("Alisson Carrer", 0.0, 0);
        ContaBancaria conta3 = new ContaBancaria("Ana Beatriz", 0.0, 0);

        listaContasBancarias.add(conta1);
        listaContasBancarias.add(conta2);
        listaContasBancarias.add(conta3);

        System.out.println("\nDefinindo titulares e limites...");
        conta1.setTitular("Gabriel");
        conta1.setLimiteSaque(300.0);
        conta2.setTitular("Alisson Carrer");
        conta2.setLimiteSaque(500.0);
        conta3.setTitular("Ana Beatriz");
        conta3.setLimiteSaque(250.0);

        System.out.println("===============================");


        System.out.println("\nRealizando depósitos...");
        conta1.depositar(250.0);
        conta2.depositar(0.0);
        conta3.depositar(150.0);

        System.out.println("===============================");


        System.out.println("\nTentativas de saques...");
        conta1.sacar(400.0);
        conta2.sacar(-20.0);
        conta2.sacar(50.0);
        conta3.sacar(120.0);
        conta3.sacar(70.0);

        System.out.println("===============================");


        System.out.println("\nDados finais das contas...");
        for (ContaBancaria conta : listaContasBancarias) {
            System.out.println(conta.exibirDados());
            System.out.println("================================");

        }
    }
}
