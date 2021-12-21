SELECT VALUE(R).nome, cpf,salario FROM tb_entregador R;

SELECT telefones
FROM tb_cliente
WHERE cpf='4124223412';

--seleciona cpf de cliente e entregador onde possuem os mesmo nomes
SELECT c.cpf, v.cpf 
FROM tb_cliente c 
    LEFT JOIN tb_entregador v
        ON c.nome = v.nome;

--seleciona o id e tipo do frete onde preco do frete é maior que 10
SELECT pr.id, pr.tipo
FROM tb_frete pr
WHERE pr.preco = ANY (SELECT pr.preco FROM tb_frete pr WHERE pr.preco > 10);

--preco do frete maior media preco
SELECT av.id, av.tipo
FROM tb_frete av
WHERE av.preco > (SELECT AVG(pr.preco) FROM tb_frete pr);

-- CONSULTANDO OS NUMS DE TELEFONE DO CLIENTE DE CPF '520...'
SELECT *
FROM TABLE(
    SELECT c.telefones
    FROM tb_cliente c
    WHERE cpf = '520.644.719-60'
);