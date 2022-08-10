-- CRIACAO DAS TABELAS DAS ENTIDADES

-- TABELA CLIENTE
CREATE TABLE tb_cliente OF tp_cliente(
    nome NOT NULL,
    cpf PRIMARY KEY,
    endereco NOT NULL,
    telefones NOT NULL
);

-- TABELA ENTREGADOR
CREATE TABLE tb_entregador OF tp_entregador(
    nome NOT NULL,
    cpf PRIMARY KEY,
    endereco NOT NULL,
    salario NOT NULL,
    supervisor WITH ROWID REFERENCES tb_entregador
);

-- TABELA PACOTE
CREATE TABLE tb_pacote OF tp_pacote(
    id PRIMARY KEY,
    endereco_destino NOT NULL,
    status_entrega NOT NULL
);

-- TABELA DESCONTO
CREATE TABLE tb_desconto OF tp_desconto(
    cupom NOT NULL,
    valor NOT NULL
);

-- TABELA FRETE
CREATE TABLE tb_frete OF tp_frete(
    id PRIMARY KEY,
    preco NOT NULL,
    tipo NOT NULL
) NESTED TABLE pacotes STORE AS tb_pacotes;

-- TABELA IMPOSTO
CREATE TABLE tb_imposto OF tp_imposto(
    tipo NOT NULL,
    valor NOT NULL
);

-- TABELA ENTREGA - RELACIONAMENTO TERNARIO (1:1:N)
CREATE TABLE tb_entrega OF tp_entrega(
    entregador SCOPE IS tb_entregador,
    pacote SCOPE IS tb_pacote,
    cliente SCOPE IS tb_cliente,
    data_hora NOT NULL -- ('DD/MM/YYYY HH24:MI')
);

-- TABELA TEM - ENTIDADE ASSOCIATIVA ENTRE PACOTE-FRETE COM DESCONTO
CREATE TABLE tb_tem OF tp_tem(
	pacote WITH ROWID REFERENCES tb_pacote,
	frete WITH ROWID REFERENCES tb_frete,
	desconto WITH ROWID REFERENCES tb_desconto
);