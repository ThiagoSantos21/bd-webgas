/* Script de inicialização do banco de dados */

CREATE TABLE tipo_usuario(
    nome VARCHAR(255) PRIMARY KEY
);

CREATE TABLE combustivel(
    nome VARCHAR(255) PRIMARY KEY
);

CREATE TABLE bandeira(
    nome VARCHAR(255) PRIMARY KEY,
    url VARCHAR(255)
);

CREATE TABLE cidade(
    nome VARCHAR(255) PRIMARY KEY,
    estado VARCHAR(255) NOT NULL,
    latitude DECIMAL(10, 8),
    longitude DECIMAL(11, 8)
);

CREATE TABLE bairro(
    nome VARCHAR(255) PRIMARY KEY,
    nomeCidade VARCHAR(255),
    FOREIGN KEY (nomeCidade) REFERENCES cidade(nome)
);

CREATE TABLE usuario (
    login VARCHAR(255) PRIMARY KEY,
    senha VARCHAR(255),
    nomeTipoUsuario VARCHAR(255),
    FOREIGN KEY (nomeTipoUsuario) REFERENCES tipo_usuario(nome)
);

CREATE TABLE pessoa (
    login VARCHAR(255) PRIMARY KEY,
    nome VARCHAR(255),
    endereco VARCHAR(255),
    nomeBairro VARCHAR(255),
    loginUsuario VARCHAR(255),
    FOREIGN KEY (nomeBairro) REFERENCES bairro(nome),
    FOREIGN KEY (loginUsuario) REFERENCES usuario(login)
);

CREATE TABLE posto (
    cnpj VARCHAR(14) PRIMARY KEY,
    razao_social VARCHAR(255),
    nome_fantasia VARCHAR(255),
    latitude DECIMAL(10, 8),
    longitude DECIMAL(11, 8),
    endereco VARCHAR(255),
    telefone VARCHAR(9),
    nomeBandeira VARCHAR(255),
    nomebairro VARCHAR(255),
    FOREIGN KEY (nomeBandeira) REFERENCES bandeira(nome),
    FOREIGN KEY (nomeBairro) REFERENCES bairro(nome)
);

CREATE TABLE comentario(
    momento DATE,
    loginPessoa VARCHAR(255), 
    cnpjPosto VARCHAR(14),
    FOREIGN KEY (loginPessoa) REFERENCES pessoa(login),
    FOREIGN KEY (cnpjPosto) REFERENCES posto(cnpj)
);

CREATE TABLE veiculo(
    placa VARCHAR(7) PRIMARY KEY,
    marca VARCHAR(255),
    modelo VARCHAR(255),
    loginPessoa VARCHAR(255),
    FOREIGN KEY (loginPessoa) REFERENCES pessoa(login)
);

CREATE TABLE veiculo_abastecido_combustivel(
    placaVeiculo VARCHAR(7),
    nomeCombustivel VARCHAR(255),
    PRIMARY KEY (placaVeiculo, nomeCombustivel),
    FOREIGN KEY (placaVeiculo) REFERENCES veiculo(placa),
    FOREIGN KEY (nomeCombustivel) REFERENCES combustivel(nome)
);

CREATE TABLE posto_combustivel(
    nomeCombustivel VARCHAR(255),
    cnpjPosto VARCHAR(14),
    PRIMARY KEY (cnpjPosto, nomeCombustivel),
    FOREIGN KEY (nomeCombustivel) REFERENCES combustivel(nome),
    FOREIGN KEY (cnpjPosto) REFERENCES posto(cnpj)
);

CREATE TABLE preco(
    momento DATE,
    valor DECIMAL(4	,2),
    nomeCombustivel VARCHAR(255),
    cnpjPosto VARCHAR(14),
    PRIMARY KEY(momento, cnpjPosto, nomeCombustivel),
    FOREIGN KEY (cnpjPosto, nomeCombustivel) REFERENCES posto_combustivel(cnpjPosto, nomeCombustivel)
);
