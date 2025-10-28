-- Lista de Exercícios 

-- Nível Básico

-- 1ª Listando o nome e a categoria de todos os produtos com preço unitário acima de R$ 1000

SELECT 
 	nome_produto,
	categoria,
	preco_unitario
FROM public.produtos
WHERE preco_unitario > 1000
ORDER BY categoria;

-- 2ª Listando a data_venda, o nome_cliente e o valor_total de todas as vendas.

SELECT
	v.data_venda,
	v.valor_total,
	c.nome_cliente
FROM public.vendas as v
INNER JOIN public.clientes as c
ON v.id_cliente = c.id_cliente
ORDER BY v.valor_total desc;

-- 3ª Encontrando os nomes e emails dos clientes que residem no estado de 'SP'.
SELECT 
	nome_cliente,
	email,
	estado
FROM clientes
WHERE estado = 'SP';

-- 4ª Verificando qual é o preço unitário médio de todos os produtos na tabela produtos?
SELECT  
	categoria,
	ROUND(AVG(preco_unitario),2) as preco_medio
FROM public.produtos
GROUP BY categoria;

----------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------

-- Nível Intermediário

-- 5ª Contagem quantos produtos diferentes foram vendidos no total
SELECT
	categoria,
	count(distinct nome_produto) as contagem_por_produto
FROM produtos
GROUP BY categoria;

-- 6ª Verificando quantas vendas (pedidos) cada cliente realizou? (Liste nome_cliente e a contagem de vendas).
SELECT
	c.nome_cliente,
	count(id_venda) as contagem_de_vendas,
	sum(v.valor_total) as valor_total
FROM clientes as c
INNER JOIN vendas as v
ON c.id_cliente = v.id_cliente
GROUP BY c.nome_cliente;


-- 7ª Identificando o nome_produto e a categoria do produto com a maior quantidade total vendida. (Dica: Use SUM(), GROUP BY, e ORDER BY com LIMIT 1).

SELECT 
    p.nome_produto as produto,
    p.categoria as categoria,
    SUM(i.quantidade * i.preco_unitario) AS valor_total
FROM produtos as p
INNER JOIN itens_venda as i
    ON p.id_produto = i.id_produto
INNER JOIN vendas as v
    ON v.id_venda = i.id_venda
GROUP BY p.nome_produto, p.categoria
ORDER BY valor_total
LIMIT 1;


-- 8ª Calculando a receita total gerada por cada categoria de produto. (Liste categoria e a soma total).

SELECT 
	p.categoria,
	SUM(i.quantidade * i.preco_unitario) AS valor_total
FROM produtos as p
INNER JOIN itens_venda as i
    ON p.id_produto = i.id_produto
INNER JOIN vendas as v
    ON v.id_venda = i.id_venda
GROUP BY p.categoria
ORDER BY valor_total;

-- 9ª Liste as cidades que possuem mais de um cliente cadastrado.
SELECT
	cidade,
	count(id_cliente) as qtd_clientes
FROM clientes
GROUP BY cidade
HAVING count(id_cliente) > 1
ORDER BY qtd_clientes DESC;

-- 10ª Encontrando o nome_cliente que realizou a venda de maior valor_total (Apenas o nome do cliente).

SELECT 
	c.nome_cliente
FROM clientes as c
INNER JOIN vendas as v
ON c.id_cliente = v.id_cliente
GROUP BY c.nome_cliente 
ORDER BY SUM(v.valor_total) desc
LIMIT 1;

-- 11ª Liste o nome_cliente, data_venda, nome_produto e a quantidade vendida para cada item de todas as vendas. (Requer 4 tabelas: clientes, vendas, itens_venda, produtos).

SELECT
	c.nome_cliente,
	date_trunc('month', v.data_venda)::date as venda_por_mes,
	p.nome_produto,
	SUM(i.quantidade) as qtd_vendida
	
	
FROM vendas as v
INNER JOIN clientes as c
ON v.id_cliente = c.id_cliente
INNER JOIN itens_venda as i
ON i.id_venda = v.id_venda
INNER JOIN produtos as p
ON p.id_produto = i.id_produto
GROUP BY 
	c.nome_cliente,
    p.nome_produto,
    date_trunc('month', v.data_venda)
ORDER BY 
	venda_por_mes,
    qtd_vendida DESC;

select * from clientes
select * from vendas
select * from itens_venda
select * from produtos

-- 12ª Listando a quantidade média de itens (linhas na itens_venda) por venda?
WITH contagem_por_venda as (
	SELECT
		id_venda,
		COUNT(id_item) as total_de_itens
	FROM itens_venda
	GROUP BY id_venda
)

SELECT 
	AVG(total_de_itens) as media_itens_por_venda
FROM contagem_por_venda;

-- 13ª Conte o número total de vendas (pedidos) por mês. (Liste o mês/ano e a contagem). 

SELECT
    COUNT(id_venda) AS contagem_de_vendas, 
    DATE_TRUNC('month', data_venda)::DATE AS mes_ano 
FROM
    vendas
GROUP BY
    DATE_TRUNC('month', data_venda)::DATE 
ORDER BY
    mes_ano;


