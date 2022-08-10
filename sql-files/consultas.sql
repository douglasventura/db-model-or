--seleciona o id e tipo do frete onde preco do frete é maior que 10
SELECT f.tipo, f.preco
FROM tb_frete f
WHERE f.preco = ANY (SELECT f.preco FROM tb_frete f WHERE f.preco > 50);

--preco do frete maior media preco
SELECT f.id, f.tipo, f.preco
FROM tb_frete f
WHERE f.preco > (SELECT AVG(pr.preco) FROM tb_frete pr);

-- CONSULTANDO OS NUMS DE TELEFONE DO CLIENTE DE CPF '859...'
SELECT *
FROM TABLE(
    SELECT c.telefones
    FROM tb_cliente c
    WHERE cpf = '859.839.606-01'
);

-- CONSULTANDO O SUPERVISOR DE UM FUNCIONARIO
SELECT e.supervisor.nome
FROM tb_entregador e
WHERE e.nome = 'Leandro Campos';

-- CONSULTANDO OS PACOTES DA CLIENTE 'LUANNA DIAS'
SELECT e.cliente.nome, e.entregador.nome, e.pacote.status_entrega, e.pacote.id
FROM tb_entrega e
WHERE e.cliente.nome = 'Luanna Dias'

-- CONSULTANDO OS PACOTES DA CLIENTE 'LUANNA DIAS' ENTREGUES
SELECT e.cliente.nome, e.entregador.nome, e.pacote.status_entrega, e.pacote.id
FROM tb_entrega e
WHERE e.cliente.nome = 'Luanna Dias'
AND e.pacote.status_entrega = 'ENTREGUE'

-- CONSULTANDO OS SUPERVISORES DOS ENTREGADORES
SELECT E.nome as NOME_DO_ENTREGADOR, DEREF(E.supervisor).nome as NOME_DO_SUPERVISOR
FROM tb_entregador E;

-- EXIBINDO O ENDERECO DA CLIENTE 'LUANNA DIAS' USANDO O PROCEDIMENTO DO TIPO PESSOA
DECLARE
    mb tp_cliente;
BEGIN 
    SELECT VALUE(c) INTO mb FROM tb_cliente c
    WHERE c.nome = 'Luanna Dias';
    mb.endereco.exibirEndereco();
END;

-- CONSULTAS DOS TELEFONES DE CADA CLIENTE
SELECT d.nome, T.*
FROM tb_cliente d, TABLE(d.telefones) T;