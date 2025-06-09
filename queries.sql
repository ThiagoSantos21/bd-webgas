-- Script com as consultas 

#Bairros com mais de um posto
SELECT nomebairro, COUNT(*) AS total_postos 
FROM posto
GROUP BY nomebairro HAVING COUNT(*) > 1;

#Listar os combustíveis disponíveis em um bairro específico
SELECT DISTINCT posto_combustivel.nomeCombustivel
FROM posto_combustivel
JOIN posto ON posto_combustivel.cnpjPosto = posto.cnpj
JOIN bairro ON posto.nomeBairro = bairro.nome
WHERE bairro.nome = 'Taquaral';

#Mostrar o histórico de preço de cada combustível em cada posto
SELECT 
    posto.nome_fantasia,
    preco.nomeCombustivel,
    preco.valor
FROM preco
JOIN posto ON preco.cnpjPosto = posto.cnpj;

#Listar os 3 combustíveis mais baratos disponíveis em toda a base
SELECT 
    preco.nomeCombustivel,
    posto.nome_fantasia,
    preco.valor,
    preco.momento
FROM preco
JOIN posto ON preco.cnpjPosto = posto.cnpj
ORDER BY preco.valor ASC
LIMIT 3;

#Usuários que comentaram em mais de um posto
SELECT pessoa.nome, COUNT(DISTINCT comentario.cnpjPosto) AS qtd_postos
FROM comentario
JOIN pessoa ON pessoa.login = comentario.loginPessoa
GROUP BY pessoa.login, pessoa.nome
HAVING COUNT(DISTINCT comentario.cnpjPosto) > 1;

#Preço médio de cada combustível por bandeira de posto
SELECT 
    bandeira.nome,
    preco.nomeCombustivel,
    ROUND(AVG(preco.valor), 3) AS preco_medio
FROM preco
JOIN posto ON preco.cnpjPosto = posto.cnpj
JOIN bandeira ON posto.nomeBandeira = bandeira.nome
GROUP BY bandeira.nome, preco.nomeCombustivel;

#Listar todos os postos ordenados pela proximidade a uma coordenada (coordenada hipotética) 		# talvez não seja incluida
SELECT 
    posto.nome_fantasia,
    bairro.nome,
    SQRT(
        POWER(posto.latitude - (-22.9064), 2) + POWER(posto.longitude - (-47.0616), 2)
    ) AS distancia_simulada
FROM posto
JOIN bairro ON bairro.nome = posto.nomeBairro
ORDER BY distancia_simulada
LIMIT 5;

#Postos de um bairro com preço médio por tipo de combustível
SELECT 
    bairro.nome AS nome_bairro,
    preco.nomeCombustivel,
    ROUND(AVG(preco.valor), 2) AS media_preco
FROM preco
JOIN posto ON preco.cnpjPosto = posto.cnpj
JOIN bairro ON bairro.nome = posto.nomeBairro
WHERE bairro.nome = 'Tijuca'  #Podemos modificar
GROUP BY bairro.nome, preco.nomeCombustivel
ORDER BY bairro.nome, preco.nomeCombustivel;

#Nome de pessoas com veículos cadastrados
SELECT DISTINCT pessoa.login, pessoa.nome
FROM pessoa
JOIN veiculo ON pessoa.login = veiculo.loginPessoa;

#Top 3 com menor preço em GNV
SELECT posto.nome_fantasia, preco.valor
FROM preco
JOIN posto ON preco.cnpjPosto = posto.cnpj
WHERE preco.nomeCombustivel = 'GNV'
ORDER BY preco.valor ASC
LIMIT 3;

#Posto com o melhor custo-benefício, considerando o rendimento do combustível
SELECT 
    posto.nome_fantasia,
    preco.nomeCombustivel,
    preco.valor,
    ROUND(
        CASE 
            WHEN preco.nomeCombustivel = 'Gasolina' THEN preco.valor / 1.0
            WHEN preco.nomeCombustivel = 'Álcool' THEN preco.valor / 0.7
            WHEN preco.nomeCombustivel = 'GNV' THEN preco.valor / 1.25
            WHEN preco.nomeCombustivel = 'Diesel' THEN preco.valor / 0.85
        END, 3
    ) AS custo_beneficio
FROM preco
JOIN posto ON preco.cnpjPosto = posto.cnpj
ORDER BY custo_beneficio ASC
LIMIT 1;