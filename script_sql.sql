-- Criando as tabelas para importação

-- Tabela de Clientes
CREATE TABLE clientes (
	id_cliente serial primary key,
	nome_cliente varchar (100) not null,
	email varchar (100) unique,
	cidade varchar (50),
	estado varchar (2)
) 

-- Tabela de Vendas
CREATE TABLE vendas (
	id_venda serial primary key,
	id_cliente integer not null references  clientes(id_cliente),
	data_venda date not null,
	valor_total numeric (10,2) not null
	
)

-- Tabela de Produtos
CREATE TABLE produtos (
	id_produto serial primary key,
	nome_produto varchar (100) not null,
	categoria varchar (50) not null,
	preco_unitario numeric (10,2)
)



-- Tabela de Itens de Venda
CREATE TABLE itens_venda (
	id_item serial primary key,
	id_venda integer not null references vendas (id_venda),
	id_produto integer not null references produtos (id_produto),
	quantidade integer not null,
	preco_unitario numeric (10,2) not null, 
	subtotal numeric (10,2) not null
)


