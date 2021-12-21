-- CRIACAO DO POVOAMENTO DAS TABELAS

-- INSERINDO NA TABELA CLIENTE
INSERT INTO tb_cliente VALUES ('Manuela Castro Barbosa', '578.912.872-00', tp_endereco('14050-270', 'Rua São Pedro', '1629', 'Ribeirão Preto', 'SP'), tp_telefones(tp_telefone('(19)96881-2374')));
INSERT INTO tb_cliente VALUES ('Felipe Azevedo Rocha', '906.692.129-38', tp_endereco('22740-240', 'Rua Coronel Tedim', '1786', 'Rio de Janeiro', 'RJ'), tp_telefones(tp_telefone('(21)94271-4574')));
INSERT INTO tb_cliente VALUES ('Julia Rocha Carvalho', '520.644.719-60', tp_endereco('74325-070', 'Avenida Roma', '52', 'Goiânia', 'GO'), tp_telefones(tp_telefone('62958479531'), tp_telefone('62958479532')));
INSERT INTO tb_cliente VALUES ('Victor Martins Almeida', '176.750.836-01', tp_endereco('88135-090', 'Rua João Domingos da Silva', '112', 'Palhoça', 'SC'), tp_telefones(tp_telefone('48278453164')));
INSERT INTO tb_cliente VALUES ('Tânia Dias Oliveira', '859.839.606-01', tp_endereco('24743-690', 'Rua Augusto Melo', '89', 'São Gonçalo', 'RJ'), tp_telefones(tp_telefone('19784562145')));
INSERT INTO tb_cliente VALUES ('Juan Rocha', '145.692.485-38', tp_endereco('54210-324', 'Rua Professor Nelson', '25', 'Teresina', 'PI'), tp_telefones(tp_telefone('83987864554')));
INSERT INTO tb_cliente VALUES ('Arthur Dias Oliveira', '589.736.772-84', tp_endereco('57.073-550', 'Avenida São Pedro', '1313', 'Maceió', 'AL'), tp_telefones(tp_telefone('(82)96945-6403')));

-- INSERINDO NA TABELA ENTREGADOR
INSERT INTO tb_entregador(nome, cpf, endereco, salario) VALUES ('Lucia', '472413412', tp_endereco('22740-240','Rua Coronel Tedim','1786','Rio de Janeiro','RJ'),12313);

-- INSERINDO NA TABELA PACOTE
INSERT INTO tb_pacote(id, status_entrega, endereco_destino) VALUES (1524, 'ENTREGUE',tp_endereco('22740-240','Rua Coronel Tedim',120,'Rio de Janeiro','RJ'));
INSERT INTO tb_pacote(id, status_entrega, endereco_destino) VALUES (2321, 'A CAMINHO',tp_endereco('24743-690','Rua Augusto Melo',89,'São Gonçalo','RJ'));
INSERT INTO tb_pacote(id, status_entrega, endereco_destino) VALUES (2213, 'ENTREGUE',tp_endereco('14050-270','Rua São Pedro',1629,'Ribeirão Preto','SP'));

-- INSERINDO NA TABELA DESCONTO
INSERT INTO tb_desconto(cupom, valor) VALUES ('GANHOU5BR', 5.00);
INSERT INTO tb_desconto(cupom, valor) VALUES ('GANHOU10BR', 10.00);
INSERT INTO tb_desconto(cupom, valor) VALUES ('GANHOU15BR', 15.00);
INSERT INTO tb_desconto(cupom, valor) VALUES ('GANHOU20BR', 20.00);

-- INSERINDO NA TABELA FRETE
INSERT INTO tb_frete(id,preco,tipo) VALUES (54437, 125.50, 'RAPIDO');
INSERT INTO tb_frete(id,preco,tipo) VALUES (12547, 25.00, 'COMUM');
INSERT INTO tb_frete(id,preco,tipo) VALUES (38696, 33.00, 'ECONOMICO');

-- INSERINDO NA TABELA IMPOSTO
INSERT INTO tb_imposto(tipo, valor) VALUES ('MUNICIPAL', 22.90);
INSERT INTO tb_imposto(tipo, valor) VALUES ('ESTADUAL', 35.90);
INSERT INTO tb_imposto(tipo, valor) VALUES ('NACIONAL', 48.90);
INSERT INTO tb_imposto(tipo, valor) VALUES ('INTERNACIONAL', 67.84);

-- INSERINDO NA TABELA ENTREGA
