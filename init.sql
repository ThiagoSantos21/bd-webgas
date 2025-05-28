/* Script de inicialização do banco de dados */

-- Criação dos usuários

CREATE TABLE usuario (
    login VARCHAR(50) PRIMARY KEY,
    senha VARCHAR(50),
    nomeTipoUsuario VARCHAR(50),
    FOREIGN KEY (nomeTipoUsuario) REFERENCES tipo_usuario(nome)
);

CREATE TABLE pessoa (
    login VARCHAR(50), -- Perguntar para a professora se esse realmente precisa ser chave primária
    nome VARCHAR(50),
    endereco VARCHAR(50),
    nomeBairro VARCHAR(50),
    FOREIGN KEY (nomeBairro) REFERENCES bairro(nome)
    FOREIGN KEY (login) REFERENCES usuario(login)
);

CREATE TABLE tipo_usuario(
    nome VARCHAR(50) PRIMARY KEY
);

CREATE TABLE comentario(
    momento DATE,
    loginPessoa VARCHAR(50), 
    cnpjPosto VARCHAR(14),
    FOREIGN KEY (loginPessoa) REFERENCES Pessoa(login),
    FOREIGN KEY (cnpjPosto) REFERENCES Posto(cnpj)
);

CREATE TABLE veiculo(
    placa VARCHAR(7) PRIMARY KEY,
    marca VARCHAR(50),
    modelo VARCHAR(50),
    loginUsuario VARCHAR(50),
    FOREIGN KEY (loginUsuario) REFERENCES usuario(login)
);

CREATE TABLE veiculo_abastecido_combustivel(
    placaVeiculo VARCHAR(7),
    nomeCombustivel VARCHAR(50),
    PRIMARY KEY (placaVeiculo, nomeCombustivel),
    FOREIGN KEY (placaVeiculo) REFERENCES veiculo(placa),
    FOREIGN KEY (nomeCombustivel) REFERENCES combustivel(nome)
);

-- Criação dos postos

CREATE TABLE posto(
    cnpj VARCHAR(14) PRIMARY KEY,
    razao_social VARCHAR(50),
    nome_fantasia VARCHAR(50),
    latitude DECIMAL(10, 8),
    longitude DECIMAL(11, 8),
    endereco VARCHAR(50),
    telefone VARCHAR(9),
    nomeBandeira VARCHAR(50),
    nomebairro VARCHAR(50),
    FOREIGN KEY (nomeBandeira) REFERENCES bandeira(nome),
    FOREIGN KEY (nomeBairro) REFERENCES bairro(nome)
);

CREATE TABLE bandeira(
    nome VARCHAR(50) PRIMARY KEY,
    url VARCHAR(50)
);

CREATE TABLE combustivel(
    nome VARCHAR(50) PRIMARY KEY
);

CREATE TABLE preco(
    momento DATETIME PRIMARY KEY,
    valor DECIMAL(5,3),
    nomeCombustivel VARCHAR(50),
    cnpjPosto VARCHAR(14),
    FOREIGN KEY (nomeCombustivel) REFERENCES combustivel(nome),
    FOREIGN KEY (cnpjPosto) REFERENCES posto(cnpj)
);

CREATE TABLE posto_combustivel(
    nomeCombustivel VARCHAR(50),
    cnpjPosto VARCHAR(14),
    PRIMARY KEY (cnpjPosto, nomeCombustivel),
    FOREIGN KEY (nomeCombustivel) REFERENCES combustivel(nome),
    FOREIGN KEY (cnpjPosto) REFERENCES posto(cnpj)
);


-- Criação dos locais

CREATE TABLE bairro(
    nome VARCHAR(50) PRIMARY KEY,
    nomeCidade VARCHAR(50),
    FOREIGN KEY (nomeCidade) REFERENCES cidade(nome)
);

CREATE TABLE cidade(
    nome VARCHAR(50) PRIMARY KEY,
    estado VARCHAR(50) UNIQUE NOT NULL,
    latitude DECIMAL(10, 8),
    longitude DECIMAL(11, 8)
);
