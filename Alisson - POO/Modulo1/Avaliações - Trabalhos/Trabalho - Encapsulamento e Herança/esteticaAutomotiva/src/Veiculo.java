public class Veiculo {
    private String marca;
    private String modelo;
    private String placa;
    private Cliente dono;

    // construtor
    public Veiculo(String marca, String modelo, String placa, Cliente dono) {
        this.marca = marca;
        this.modelo = modelo;
        this.placa = placa;
        this.dono = dono;
    }

    // getters, setters e metodos

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        if (marca == null || marca.trim().isEmpty()) {
            System.out.println("ERRO: Marca inválida.");
        } else {
            this.marca = marca;
        }
    }

    public String getModelo() {
        return modelo;
    }

    public void setModelo(String modelo) {
        if (modelo == null || modelo.trim().isEmpty()) {
            System.out.println("ERRO: Modelo inválido.");
        } else {
            this.modelo = modelo;
        }
    }

    public String getPlaca() {
        return placa;
    }

    public void setPlaca(String placa) {
        if (placa == null || placa.trim().isEmpty()) {
            System.out.println("ERRO: Placa inválida.");
        } else {
            this.placa = placa;
        }
    }

    public Cliente getDono() {
        return dono;
    }

    public void setDono(Cliente dono) {
        this.dono = dono;
    }

    public String exibirModeloPlacaDono() {
        return "\nModelo: " + modelo + "\nPlaca: " + placa + "\nDono: " + dono.getNome();
    }

    public String exibir() {
        return "Marca: " + marca + "\nModelo: " + modelo + "\nPlaca: " + placa + "\nDono: " + dono.getNome();
    }

}
