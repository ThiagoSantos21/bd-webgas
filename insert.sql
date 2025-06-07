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
	('11111111111111', 'Posto 1', 'Posto 1', 0,0,'Rua 8','111111111','Shell','Tijuca'),
    ('22222222222222', 'Posto 2', 'Posto 2', 0,0,'Rua 9','222222222','Vibra','Cambuí'),
    ('33333333333333', 'Posto 3', 'Posto 3', 0,0,'Rua 10','333333333','Ipiranga','Taquaral'),
    ('44444444444444', 'Posto 4', 'Posto 4', 0,0,'Rua 11','444444444','Vibra','Moema');
    
INSERT INTO posto_combustivel (cnpjPosto, nomeCombustivel)
VALUES
	('11111111111111', 'Gasolina'),
    ('11111111111111', 'Diesel'),
    ('22222222222222', 'GNV'),
    ('22222222222222', 'Álcool'),
	('33333333333333', 'Diesel'),
	('33333333333333', 'GNV'),
    ('44444444444444', 'Gasolina'),
    ('44444444444444', 'Álcool');

INSERT INTO preco (momento, valor, cnpjPosto, nomeCombustivel)
VALUES
	('2025-01-01 02:28:11', 4.89, '11111111111111', 'Diesel'),
	('2025-01-06 21:50:59', 5.89, '22222222222222', 'GNV'),
	('2025-01-15 11:36:16', 4.62, '22222222222222', 'Álcool'),
	('2025-01-23 18:13:24', 4.49, '33333333333333', 'Diesel'),
	('2025-01-24 11:59:02', 3.22, '44444444444444', 'Álcool'),
	('2025-01-26 14:42:59', 5.09, '44444444444444', 'Gasolina'),
	('2025-02-12 05:04:40', 4.65, '33333333333333', 'GNV'),
	('2025-03-11 02:07:28', 3.50, '33333333333333', 'Diesel'),
	('2025-03-14 23:00:24', 6.67, '11111111111111', 'Gasolina'),
	('2025-03-21 00:47:11', 5.72, '11111111111111', 'Diesel'),
	('2025-04-26 05:25:49', 5.08, '33333333333333', 'GNV'),
	('2025-05-02 19:26:33', 6.31, '44444444444444', 'Gasolina'),
	('2025-06-02 01:43:13', 6.79, '11111111111111', 'Gasolina'),
	('2025-06-02 16:57:50', 6.76, '44444444444444', 'Álcool'),
	('2025-06-03 15:26:56', 3.42, '22222222222222', 'Álcool'),
	('2025-06-04 06:37:16', 5.82, '22222222222222', 'GNV');

INSERT INTO comentario (momento, loginPessoa, cnpjPosto)
VALUES
	('2025-02-01 08:40:11', 'familia1', '11111111111111'),
	('2025-03-10 05:32:20', 'familia2', '44444444444444'),
	('2025-03-19 18:45:45', 'familia5', '22222222222222'),
	('2025-03-22 12:23:21', 'familia3', '33333333333333'),
	('2025-03-25 23:34:54', 'familia4', '22222222222222'),
	('2025-03-27 15:59:23', 'familia1', '33333333333333'),
	('2025-04-13 08:06:48', 'familia5', '33333333333333'),
	('2025-04-20 06:17:36', 'familia3', '11111111111111'),
	('2025-04-27 06:38:07', 'familia4', '44444444444444'),
	('2025-05-06 08:27:02', 'familia2', '44444444444444');
    
