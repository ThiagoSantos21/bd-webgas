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
    
