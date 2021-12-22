--seleciona o id e tipo do frete onde preco do frete é maior que 10
SELECT f.tipo, f.preco
FROM tb_frete f
WHERE f.preco = ANY (SELECT f.preco FROM tb_frete f WHERE f.preco > 50);

--preco do frete maior media preco
SELECT f.id, f.tipo, f.preco
FROM tb_frete f
WHERE f.preco > (SELECT AVG(pr.preco) FROM tb_frete pr);

-- CONSULTANDO OS NUMS DE TELEFONE DO CLIENTE DE CPF '520...'
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

