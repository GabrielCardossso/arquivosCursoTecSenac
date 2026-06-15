

public class Agendamento {
    private Cliente cliente;
    private Veiculo veiculo;
    private Servico servico;
    private String status;
    private String horario;
    private String data;

    // construtor

    public Agendamento(Cliente cliente, Veiculo veiculo, Servico servico, String status, String horario, String data) {
        this.cliente = cliente;
        this.veiculo = veiculo;
        this.servico = servico;
        this.status = status;
        this.horario = horario;
        this.data = data;
    }

    // getters, setters e metodos

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    public Veiculo getVeiculo() {
        return veiculo;
    }

    public void setVeiculo(Veiculo veiculo) {
        this.veiculo = veiculo;
    }

    public Servico getServico() {
        return servico;
    }

    public void setServico(Servico servico) {
        this.servico = servico;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getHorario() {
        return horario;
    }

    public void setHorario(String horario) {
        this.horario = horario;
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }

    public String exibirClienteServicoStatus() {
        return "\nCliente: " + cliente.exibirNomeCpfTelefone() + "\nServiço: " + servico.exibirNomePrecoDuracao() + "\nStatus: " + status;
    }


}
