-- Script de inserção de dados no banco

INSERT INTO bandeira (nome, url)
VALUES
	('Vibra','https://www.vibraenergia.com.br/'),
    ('Shell','https://www.shell.com.br/'),
    ('Ipiranga','https://portal.ipiranga/wps/portal/pt-br/ipiranga/inicio');
    
INSERT INTO tipo_usuario (nome)
VALUES
    ('Dono'),
    ('Consumidor');
    
INSERT INTO cidade (nome, estado, latitude, longitude)
VALUES
	('Rio de Janeiro', 'RJ',  -22.9035,  -22.9035),
    ('São Paulo', 'SP',  -23.5489, -46.6388),
    ('Campinas', 'SP',  -22.9064,  -47.0616);

INSERT INTO bairro (nome, nomeCidade)
VALUES
	('Tijuca', 'Rio de Janeiro'),
	('Vila Isabel', 'Rio de Janeiro'),
    ('São cristóvão', 'Rio de Janeiro'),
    ('Moema', 'São Paulo'),
    ('Itaim Bibi', 'São Paulo'),
    ('Butantã', 'São Paulo'),
    ('Cambuí', 'Campinas'),
    ('Centro', 'Campinas'),
    ('Taquaral', 'Campinas');
    
INSERT INTO combustivel (nome)
VALUES
	('Gasolina'),
    ('GNV'),
    ('Álcool'),
    ('Diesel');
    
INSERT INTO usuario (login,senha, nomeTipoUsuario)
VALUES
	('dono1', 'dono1', 'Dono'),
    ('dono2', 'dono2', 'Dono'),
    ('consumidor1', 'consumidor1', 'Consumidor'),
    ('consumidor2', 'consumidor2', 'Consumidor');
    
INSERT INTO pessoa(login, nome, endereco, nomeBairro, loginUsuario)
VALUES 
	('frentista1', 'João', 'Rua 1', 'Tijuca', 'dono1'),
    ('frentista2', 'Paulo', 'Rua 2', 'Vila Isabel', 'dono1'),
    ('frentista3', 'Luiz', 'Rua 3', 'São cristóvão', 'dono2'),
    ('frentista4', 'Thiago', 'Rua 4', 'Moema', 'dono2'),
    ('familia1', 'Amanda', 'Rua 5', 'Itaim Bibi', 'consumidor1'),
    ('familia2', 'Luiza', 'Rua 6', 'Cambuí', 'consumidor1'),
    ('familia3', 'Júlia', 'Rua 6', 'Cambuí', 'consumidor1'),
    ('familia4', 'Gabriela', 'Rua 7', 'Taquaral', 'consumidor2'),
    ('familia5', 'Cesar', 'Rua 7', 'Taquaral', 'consumidor2');

INSERT INTO veiculo(placa, marca, modelo, loginPessoa)
VALUES
	('aaa11a1', 'Fiat', 'Mobi', 'familia1'),
	('bbb22b2', 'Chevrolet', 'Onix', 'familia2'),
	('ccc33c3', 'Toyota', 'Corolla', 'familia3'),
	('ddd44d4', 'Jeep', 'Renegade', 'familia4'),
	('eee55e5', 'Renault', 'Sandero', 'familia5');
    
INSERT INTO posto (cnpj, razao_social, nome_fantasia, latitude, longitude, endereco, telefone, nomeBandeira, nomebairro)
VALUES
	('11111111111111', 'Posto 1', 'Posto 1', -22.9025, -22.9064, 'Rua 8', '111111111', 'Shell', 'Tijuca'),
    ('22222222222222', 'Posto 2', 'Posto 2', -22.9025, -46.6388, 'Rua 9', '222222222', 'Vibra', 'Cambuí'),
    ('33333333333333', 'Posto 3', 'Posto 3', -23.5479, -47.0616, 'Rua 10', '333333333', 'Ipiranga', 'Taquaral');

INSERT INTO posto_combustivel(cnpjPosto, nomeCombustivel)
VALUES
    ('11111111111111', 'Gasolina'),
    ('11111111111111', 'GNV'),
    ('11111111111111', 'Álcool'),
    ('22222222222222', 'Gasolina'),
    ('22222222222222', 'GNV'),
    ('22222222222222', 'Álcool'),
    ('22222222222222', 'Diesel'),
    ('33333333333333', 'Álcool'),
    ('33333333333333', 'Diesel'),
    ('33333333333333', 'GNV');

INSERT INTO preco(momento, valor, cnpjPosto, nomeCombustivel)
VALUES
    ('2025-01-15 08:23:45', 5, '11111111111111', 'Gasolina'),
    ('2025-02-02 14:12:10', 2.56,'11111111111111', 'GNV'),
    ('2025-03-10 19:45:30', 1.5, '11111111111111', 'Álcool'),
    ('2025-04-25 06:35:00', 4.87, '22222222222222', 'Gasolina'),
    ('2025-05-17 22:59:59', 2.44, '22222222222222', 'GNV'),
    ('2025-06-09 12:00:00', 1.56, '22222222222222', 'Álcool'),
    ('2025-07-21 09:15:10', 4.11, '22222222222222', 'Diesel'),
    ('2025-08-30 16:47:25', 1.66, '33333333333333', 'Álcool'),
    ('2025-10-03 11:11:11', 4.22, '33333333333333', 'Diesel'),
    ('2025-12-20 20:30:00', 2.51, '33333333333333', 'GNV');

INSERT INTO veiculo_abastecido_combustivel(placaVeiculo, nomeCombustivel)
VALUES
    ('aaa11a1', 'Gasolina'),
    ('aaa11a1', 'Diesel'),
    ('bbb22b2', 'Gasolina'),
    ('bbb22b2', 'GNV'),
    ('ccc33c3', 'Álcool'),
    ('ccc33c3', 'Diesel'),
    ('ddd44d4', 'Álcool'),
    ('ddd44d4', 'GNV'),
    ('ddd44d4', 'Diesel'),
    ('eee55e5', 'Gasolina'),
    ('eee55e5', 'GNV');
