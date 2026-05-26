-- =====================================================
-- criando tabela cargos
-- =====================================================

CREATE TABLE cargo (
    idCargo SERIAL PRIMARY KEY,

    nomeCargo VARCHAR(50) UNIQUE NOT NULL
);

-- =====================================================
-- criando tabela usuarios
-- =====================================================

CREATE TABLE usuario (
    idUsuario SERIAL PRIMARY KEY,

    nomeUsuario VARCHAR(100) NOT NULL,

    emailUsuario VARCHAR(150) UNIQUE NOT NULL,

    telefoneUsuario VARCHAR(20) NOT NULL,

    senhaUsuario VARCHAR(255) NOT NULL,

    ativoUsuario BOOLEAN DEFAULT TRUE,

    criadoEm TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    cargoId INT NOT NULL,

    CONSTRAINT chk_email_usuario
    CHECK (emailUsuario LIKE '%@%'),

    CONSTRAINT fk_usuario_cargo
    FOREIGN KEY (cargoId)
    REFERENCES cargo(idCargo)
);

-- =====================================================
-- criando tabela categorias
-- =====================================================

CREATE TABLE categoria (
    idCategoria SERIAL PRIMARY KEY,

    nomeCategoria VARCHAR(50) UNIQUE NOT NULL
);

-- =====================================================
-- criando tabela veiculos
-- =====================================================

CREATE TABLE veiculo (
    idVeiculo SERIAL PRIMARY KEY,

    modeloVeiculo VARCHAR(50) NOT NULL,

    marcaVeiculo VARCHAR(50) NOT NULL,

    placaVeiculo VARCHAR(10) UNIQUE NOT NULL,

    corVeiculo VARCHAR(30),

    anoVeiculo INT,

    criadoEm TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    usuarioId INT NOT NULL,

    categoriaId INT NOT NULL,

    CONSTRAINT chk_ano_veiculo
    CHECK (
        anoVeiculo >= 1900
        AND anoVeiculo <= EXTRACT(YEAR FROM CURRENT_DATE) + 1
    ),

    CONSTRAINT fk_veiculo_usuario
    FOREIGN KEY (usuarioId)
    REFERENCES usuario(idUsuario)
    ON DELETE CASCADE,

    CONSTRAINT fk_veiculo_categoria
    FOREIGN KEY (categoriaId)
    REFERENCES categoria(idCategoria)
);

-- =====================================================
-- criando tabela servicos
-- =====================================================

CREATE TABLE servico (
    idServico SERIAL PRIMARY KEY,

    nomeServico VARCHAR(100) UNIQUE NOT NULL,

    descricaoServico TEXT,

    precoServico DECIMAL(10,2) NOT NULL,

    duracaoMinutosServico INT NOT NULL,

    ativoServico BOOLEAN DEFAULT TRUE,

    CONSTRAINT chk_preco_servico
    CHECK (precoServico > 0),

    CONSTRAINT chk_duracao_servico
    CHECK (duracaoMinutosServico > 0)
);

-- =====================================================
-- criando tabela status agendamentos
-- =====================================================

CREATE TABLE statusAgendamento (
    idStatusAgendamento SERIAL PRIMARY KEY,

    nomeStatusAgendamento VARCHAR(50) UNIQUE NOT NULL,

    descricaoStatusAgendamento TEXT
);

-- =====================================================
-- criando tabela agendamentos
-- =====================================================

CREATE TABLE agendamento (
    idAgendamento SERIAL PRIMARY KEY,

    dataAgendamento DATE NOT NULL,

    horarioAgendamento TIME NOT NULL,

    observacaoAgendamento TEXT,

    criadoEm TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    usuarioId INT NOT NULL,

    veiculoId INT NOT NULL,

    statusAgendamentoId INT NOT NULL,

    CONSTRAINT fk_agendamento_usuario
    FOREIGN KEY (usuarioId)
    REFERENCES usuario(idUsuario),

    CONSTRAINT fk_agendamento_veiculo
    FOREIGN KEY (veiculoId)
    REFERENCES veiculo(idVeiculo),

    CONSTRAINT fk_agendamento_status
    FOREIGN KEY (statusAgendamentoId)
    REFERENCES statusAgendamento(idStatusAgendamento)
);

-- =====================================================
-- criando tabela agendamento servicos
-- =====================================================

CREATE TABLE agendamentoServico (
    agendamentoId INT NOT NULL,

    servicoId INT NOT NULL,

    criadoEm TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY (
        agendamentoId,
        servicoId
    ),

    CONSTRAINT fk_agendamentoServico_agendamento
    FOREIGN KEY (agendamentoId)
    REFERENCES agendamento(idAgendamento)
    ON DELETE CASCADE,

    CONSTRAINT fk_agendamentoServico_servico
    FOREIGN KEY (servicoId)
    REFERENCES servico(idServico)
);

-- =====================================================
-- criando tabela consultas
-- =====================================================

CREATE TABLE consulta (
    idConsulta SERIAL PRIMARY KEY,

    tituloConsulta VARCHAR(100),

    mensagemConsulta TEXT NOT NULL,

    imagemConsulta VARCHAR(255),

    respostaConsulta TEXT,

    statusConsulta VARCHAR(30) DEFAULT 'pendente',

    criadoEm TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    usuarioId INT NOT NULL,

    CONSTRAINT chk_status_consulta
    CHECK (
        statusConsulta IN (
            'pendente',
            'respondida',
            'cancelada'
        )
    ),

    CONSTRAINT fk_consulta_usuario
    FOREIGN KEY (usuarioId)
    REFERENCES usuario(idUsuario)
);

-- =====================================================
-- criando tabela avaliacoes
-- =====================================================

CREATE TABLE avaliacao (
    idAvaliacao SERIAL PRIMARY KEY,

    notaAvaliacao INT NOT NULL,

    comentarioAvaliacao TEXT,

    criadoEm TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    usuarioId INT NOT NULL,

    agendamentoId INT NOT NULL,

    CONSTRAINT chk_nota_avaliacao
    CHECK (
        notaAvaliacao BETWEEN 1 AND 5
    ),

    CONSTRAINT fk_avaliacao_usuario
    FOREIGN KEY (usuarioId)
    REFERENCES usuario(idUsuario),

    CONSTRAINT fk_avaliacao_agendamento
    FOREIGN KEY (agendamentoId)
    REFERENCES agendamento(idAgendamento)
);

-- =====================================================
-- criando tabela notificacoes
-- =====================================================

CREATE TABLE notificacao (
    idNotificacao SERIAL PRIMARY KEY,

    tituloNotificacao VARCHAR(100),

    mensagemNotificacao TEXT NOT NULL,

    lidaNotificacao BOOLEAN DEFAULT FALSE,

    criadoEm TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    usuarioId INT NOT NULL,

    CONSTRAINT fk_notificacao_usuario
    FOREIGN KEY (usuarioId)
    REFERENCES usuario(idUsuario)
);