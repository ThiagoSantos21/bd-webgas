/* Script de inicialização do banco de dados */

CREATE TABLE tipo_usuario(
    nome VARCHAR(50) PRIMARY KEY
);

CREATE TABLE combustivel(
    nome VARCHAR(50) PRIMARY KEY
);

CREATE TABLE bandeira(
    nome VARCHAR(50) PRIMARY KEY,
    url VARCHAR(50)
);

CREATE TABLE cidade(
    nome VARCHAR(50) PRIMARY KEY,
    estado VARCHAR(50) UNIQUE NOT NULL,
    latitude DECIMAL(10, 8),
    longitude DECIMAL(11, 8)
);

CREATE TABLE bairro(
    nome VARCHAR(50) PRIMARY KEY,
    nomeCidade VARCHAR(50),
    FOREIGN KEY (nomeCidade) REFERENCES cidade(nome)
);

CREATE TABLE usuario (
    login VARCHAR(50) PRIMARY KEY,
    senha VARCHAR(50),
    nomeTipoUsuario VARCHAR(50),
    FOREIGN KEY (nomeTipoUsuario) REFERENCES tipo_usuario(nome)
);

CREATE TABLE pessoa (
    login VARCHAR(50) PRIMARY KEY,
    nome VARCHAR(50),
    endereco VARCHAR(50),
    nomeBairro VARCHAR(50),
    loginUsuario VARCHAR(50),
    FOREIGN KEY (nomeBairro) REFERENCES bairro(nome),
    FOREIGN KEY (login) REFERENCES usuario(login)
);

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

CREATE TABLE comentario(
    momento DATE,
    loginPessoa VARCHAR(50), 
    cnpjPosto VARCHAR(14),
    FOREIGN KEY (loginPessoa) REFERENCES pessoa(login),
    FOREIGN KEY (cnpjPosto) REFERENCES posto(cnpj)
);

CREATE TABLE veiculo(
    placa VARCHAR(7) PRIMARY KEY,
    marca VARCHAR(50),
    modelo VARCHAR(50),
    loginPessoa VARCHAR(50),
    FOREIGN KEY (loginPessoa) REFERENCES pessoa(login)
);

CREATE TABLE veiculo_abastecido_combustivel(
    placaVeiculo VARCHAR(7),
    nomeCombustivel VARCHAR(50),
    PRIMARY KEY (placaVeiculo, nomeCombustivel),
    FOREIGN KEY (placaVeiculo) REFERENCES veiculo(placa),
    FOREIGN KEY (nomeCombustivel) REFERENCES combustivel(nome)
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
