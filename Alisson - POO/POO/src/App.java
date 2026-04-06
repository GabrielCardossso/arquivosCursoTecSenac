public class App {
    public static void main(String[] args) throws Exception {
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


    }
}
