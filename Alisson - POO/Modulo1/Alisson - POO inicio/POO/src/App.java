import java.util.Scanner;
// import java.util.ArrayList;

public class App {
    public static void main(String[] args) throws Exception {
        Scanner leitura = new Scanner(System.in);

        /*
          System.out.println("Olá, Mundo! Estou aprendendo Java.");
          int idade = 16;
          String nome = "Gabriel Cardoso Corrêa Marcos";
          boolean isEstudando = true;
          
          System.out.println("Minha idade é: " + idade);
          System.out.println("Meu nome é: " + nome);
          System.out.println("Eu estou estudando Java? " + isEstudando);
          
          isEstudando = false;
          System.out.println("Eu estou estudando Java? " + isEstudando);
          idade = 17;
          System.out.println("Minha idade é igual a 16? " + (idade == 16));
          double precoCaderno = 15.99;
          double precoCaneta = 2.99;
          double precoTotal = precoCaderno + precoCaneta;
          System.out.println("O preço total é: R$ " + precoTotal);
          
          int a = 50;
          int b = 150;
          int soma = a + b;
          System.out.println("A soma de " + a + " + " + b + " é: " + soma);
          System.out.println("1" + 1 + 1);
          System.out.print("Digite um número: ");
          int numDigitado = leitura.nextInt();
          System.out.println("O número digitado foi: " + numDigitado);
          
          
          System.out.println("Digite o seu nome: ");
          String nomeDigitado = leitura.nextLine();
          System.out.println("Digite a sua idade: ");
          int idadeDigitada = leitura.nextInt();
          System.out.println("Olá " + nomeDigitado + "! Você tem " + idadeDigitada +
          " anos.");
          leitura.close();
          
          if(idadeDigitada >= 18){
          System.out.println("Maior de idade!");
          } else {
          System.out.println("Menor de idade!");
          }
          
          System.out.println("Digite o primeiro número: ");
          int num1 = leitura.nextInt();
          System.out.println("Digite o segundo número: ");
          int num2 = leitura.nextInt();
          int soma = num1 + num2;
          System.out.println("A soma de (" + num1 + ") + (" + num2 + ") é: " + soma);
          leitura.close();
         */

         // menu inicial da calculadora
          System.out.println("+------------------------------------------------+");
          System.out.println("|        Bem-vindo à calculadora simples!        |");
          System.out.println("| Digite dois números para realizar as operações.|");
          System.out.println("+------------------------------------------------+");
        // leitura dos números
          System.out.println("Digite o primeiro número: ");
          double a = leitura.nextDouble();
          
          System.out.println("Digite o segundo número: ");
          double b = leitura.nextDouble();
        // criação do objeto da classe Calculos
          Calculos calculos = new Calculos();
        // menu de operações
          System.out.println("Escolha a operação que deseja realizar: ");
          System.out.println("1 - Somar");
          System.out.println("2 - Subtrair");
          System.out.println("3 - Multiplicar");
          System.out.println("4 - Dividir");
          int escolha = leitura.nextInt();
        // execução da operação escolhida com switch case
          if(escolha == 1) {
          System.out.println("O resultado da soma é: " + calculos.somar(a, b));
          } else if (escolha == 2) {
          System.out.println("O resultado da subtração é: " + calculos.subtrair(a, b));
          } else if (escolha == 3) {
          System.out.println("O resultado da multiplicação é: " + calculos.multiplicar(a, b));
          } else if (escolha == 4) {
          System.out.println("O resultado da divisão é: " + calculos.dividir(a, b));
         } else {
          System.out.println("Operação inválida.");
          }
          
          leitura.close();
        
        
         /* int[] numeros = new int[5];
          numeros[0] = 10;
          numeros[1] = 20;
          numeros[2] = 30;
          numeros[3] = 40;
          numeros[4] = 50;
          System.out.println("Quantidade de elementos no array: " + numeros.length);
          System.out.println("Elementos do array: ");
          for (int i = 0; i < numeros.length; i++) {
          System.out.println(numeros[i]);
          }
          System.out.println("Elemento na posição 2: " + numeros[2]);
        

        ArrayList<String> frutas = new ArrayList<>();
        frutas.add("Maçã");
        frutas.add("Banana");
        frutas.set(1, "Laranja");
        System.out.println("Quantidade de frutas na lista: " + frutas.size());
        System.out.println("Frutas na lista: " + frutas);
        */
    }
}