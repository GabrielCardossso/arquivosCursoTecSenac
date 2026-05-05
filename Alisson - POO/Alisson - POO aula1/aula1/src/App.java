public class App {
    public static void main(String[] args) throws Exception {
        // cria um cliente com nome e com dívida, e outro cliente sem dívida
        Cliente cliente1 = new Cliente();
        cliente1.setNome("Gabriel");
        cliente1.setIdade(16);
        cliente1.setCpf(11728635985L);
        cliente1.setTemDivida(false);

        Cliente cliente2 = new Cliente("Richard", 26, 11728601243L, true);

        // chama a função para verificar se o cliente pode comprar fiado
        System.out.println("o CPF do cliente Gabriel é: " + cliente1.getCpf());
        System.out.println("o CPF do cliente Richard é: " + cliente2.getCpf());
        System.out.println("a idade do cliente Gabriel é: " + cliente1.getIdade());
        System.out.println("a idade do cliente Richard é: " + cliente2.getIdade());
        System.out.println("o cliente Gabriel pode comprar fiado? " + cliente1.podeComprarFiado());
        System.out.println("o cliente Richard pode comprar fiado? " + cliente2.podeComprarFiado());
    }
}