-- CRIACAO DO POVOAMENTO DAS TABELAS

-- INSERINDO NA TABELA CLIENTE
INSERT INTO tb_cliente(nome, cpf, endereco, telefones) VALUES ('Manuela Castro Barbosa', '578.912.872-00', tp_endereco('14050-270', 'Rua São Pedro', '1629', 'Ribeirão Preto', 'SP'), tp_telefones(tp_telefone('(19)96881-2374')));
INSERT INTO tb_cliente(nome, cpf, endereco, telefones) VALUES ('Felipe Azevedo Rocha', '906.692.129-38', tp_endereco('22740-240', 'Rua Coronel Tedim', '1786', 'Rio de Janeiro', 'RJ'), tp_telefones(tp_telefone('(21)94271-4574')));
INSERT INTO tb_cliente(nome, cpf, endereco, telefones) VALUES ('Julia Rocha Carvalho', '520.644.719-60', tp_endereco('74325-070', 'Avenida Roma', '52', 'Goiânia', 'GO'), tp_telefones(tp_telefone('(62)95847-9531'), tp_telefone('(62)95847-9532')));
INSERT INTO tb_cliente(nome, cpf, endereco, telefones) VALUES ('Victor Martins Almeida', '176.750.836-01', tp_endereco('88135-090', 'Rua João Domingos da Silva', '112', 'Palhoça', 'SC'), tp_telefones(tp_telefone('(48)27845-3164')));
INSERT INTO tb_cliente(nome, cpf, endereco, telefones) VALUES ('Tânia Dias Oliveira', '859.839.606-01', tp_endereco('24743-690', 'Rua Augusto Melo', '89', 'São Gonçalo', 'RJ'), tp_telefones(tp_telefone('(19)78456-2145'), tp_telefone('(19)78456-2146'), tp_telefone('(19)78456-2147')));
INSERT INTO tb_cliente(nome, cpf, endereco, telefones) VALUES ('Juan Rocha', '145.692.485-38', tp_endereco('54210-324', 'Rua Professor Nelson', '25', 'Teresina', 'PI'), tp_telefones(tp_telefone('(83)9878-64554')));
INSERT INTO tb_cliente(nome, cpf, endereco, telefones) VALUES ('Arthur Dias Oliveira', '589.736.772-84', tp_endereco('57.073-550', 'Avenida São Pedro', '1313', 'Maceió', 'AL'), tp_telefones(tp_telefone('(82)96945-6403'), tp_telefone('(82)96945-6404')));
INSERT INTO tb_cliente(nome, cpf, endereco, telefones) VALUES ('João Paulo Santos', '805.699.224-94', tp_endereco('52.130-000', 'Avenida Beberibe', '2203', 'Recife', 'PE'), tp_telefones(tp_telefone('(81)96945-6403'), tp_telefone('(81)96945-6404')));
INSERT INTO tb_cliente(nome, cpf, endereco, telefones) VALUES ('Ana Fonseca Costa', '589.736.772-12', tp_endereco('53.030-240', 'Rua Dr. Manoel de Barros Lima', '444', 'Olinda', 'PE'), tp_telefones(tp_telefone('(81)96945-6405')));
INSERT INTO tb_cliente(nome, cpf, endereco, telefones) VALUES ('Luanna Dias', '105.246.452-14', tp_endereco('52.130-000', 'Avenida São Pedro', '2204', 'Recife', 'PE'), tp_telefones(tp_telefone('(82)96945-6406'), tp_telefone('(82)96945-6407'), tp_telefone('(82)96945-6408')));


-- INSERINDO NA TABELA ENTREGADOR
INSERT INTO tb_entregador(nome, cpf, endereco, salario, supervisor) VALUES ('Lucia dos Santos', '112.347.229-10', tp_endereco('22.740-240', 'Rua Coronel Tedim', 1780, 'Rio de Janeiro', 'RJ'), 1299.99, NULL);
INSERT INTO tb_entregador(nome, cpf, endereco, salario, supervisor) VALUES ('Jonas Costa', '112.347.229-11', tp_endereco('22.740-241', 'Rua Coronel Tedim', 1781, 'Ribeirão Preto', 'SP'), 1399.99, NULL);
INSERT INTO tb_entregador(nome, cpf, endereco, salario, supervisor) VALUES ('Marcia da Silva', '112.347.229-12', tp_endereco('22.740-242', 'Rua Coronel Tedim', 1782, 'Goiânia', 'GO'), 1123.13, NULL);
INSERT INTO tb_entregador(nome, cpf, endereco, salario, supervisor) VALUES ('Rivaldo Ferreira', '112.347.229-13', tp_endereco('22.740-243', 'Rua Coronel Tedim', 1783, 'Palhoça', 'SC'), 993.69, NULL);
INSERT INTO tb_entregador(nome, cpf, endereco, salario, supervisor) VALUES ('Joana Rocha', '112.347.229-14', tp_endereco('22.740-244', 'Rua Coronel Tedim', 1784, 'Recife', 'PE'), 1420.15, NULL);
INSERT INTO tb_entregador(nome, cpf, endereco, salario, supervisor) VALUES ('Lucas Pereira', '112.347.229-15', tp_endereco('22.740-245', 'Rua Coronel Tedim', 1785, 'Teresina', 'PI'), 1423.13, NULL);
INSERT INTO tb_entregador(nome, cpf, endereco, salario, supervisor) VALUES ('Derek Freitas', '112.347.229-16', tp_endereco('22.740-246', 'Rua Coronel Tedim', 1786, 'Macéio', 'AL'), 1148.98, NULL);
INSERT INTO tb_entregador(nome, cpf, endereco, salario, supervisor) VALUES ('Hyago Arruda', '112.347.229-17', tp_endereco('22.740-247', 'Rua Coronel Tedim', 1787, 'Olinda', 'PE'), 1220.40, (SELECT REF(E) FROM tb_entregador E WHERE cpf = '112.347.229-14'));
INSERT INTO tb_entregador(nome, cpf, endereco, salario, supervisor) VALUES ('Felipe Feitosa', '112.347.229-18', tp_endereco('22.740-248', 'Rua Coronel Tedim', 1788, 'São Gonçalo', 'RJ'), 1223.23, (SELECT REF(E) FROM tb_entregador E WHERE cpf = '112.347.229-10'));
INSERT INTO tb_entregador(nome, cpf, endereco, salario, supervisor) VALUES ('Leandro Campos', '112.347.229-19', tp_endereco('22.740-249', 'Rua Coronel Tedim', 1789, 'Recife', 'PE'), 1545.55, (SELECT REF(E) FROM tb_entregador E WHERE cpf = '112.347.229-14'));


-- INSERINDO NA TABELA PACOTE
INSERT INTO tb_pacote(id, status_entrega, endereco_destino) VALUES (1524, 'ENTREGUE', tp_endereco('22740-240', 'Rua Coronel Tedim', '120', 'Rio de Janeiro', 'RJ'));
INSERT INTO tb_pacote(id, status_entrega, endereco_destino) VALUES (2321, 'A CAMINHO', tp_endereco('24743-690', 'Rua Augusto Melo', '89', 'São Gonçalo', 'RJ'));
INSERT INTO tb_pacote(id, status_entrega, endereco_destino) VALUES (2213, 'ENTREGUE', tp_endereco('14050-270', 'Rua São Pedro', '1629', 'Ribeirão Preto', 'SP'));
INSERT INTO tb_pacote(id, status_entrega, endereco_destino) VALUES (9493, 'ENTREGUE', tp_endereco('22740-240', 'Rua Coronel Tedim', '1786', 'Rio de Janeiro', 'RJ'));
INSERT INTO tb_pacote(id, status_entrega, endereco_destino) VALUES (5464, 'A CAMINHO', tp_endereco('24743-690', 'Rua Augusto Melo', '89', 'São Gonçalo', 'RJ'));
INSERT INTO tb_pacote(id, status_entrega, endereco_destino) VALUES (2356, 'ENTREGUE', tp_endereco('54210-324', 'Rua Professor Nelson', '25', 'Teresina', 'PI'));
INSERT INTO tb_pacote(id, status_entrega, endereco_destino) VALUES (6840, 'ENTREGUE', tp_endereco('57.073-550', 'Avenida São Pedro', '1313', 'Maceió', 'AL'));
INSERT INTO tb_pacote(id, status_entrega, endereco_destino) VALUES (2359, 'A CAMINHO', tp_endereco('52.130-000', 'Avenida Beberibe', '2203', 'Recife', 'PE'));
INSERT INTO tb_pacote(id, status_entrega, endereco_destino) VALUES (1950, 'ENTREGUE', tp_endereco('53.030-240', 'Rua Dr. Manoel de Barros Lima', '444', 'Olinda', 'PE'));
INSERT INTO tb_pacote(id, status_entrega, endereco_destino) VALUES (9904, 'ENTREGUE', tp_endereco('52.130-000', 'Avenida São Pedro', '2204', 'Recife', 'PE'));


-- INSERINDO NA TABELA DESCONTO
INSERT INTO tb_desconto(cupom, valor) VALUES ('GANHOU5BR', 5.00);
INSERT INTO tb_desconto(cupom, valor) VALUES ('GANHOU10BR', 10.00);
INSERT INTO tb_desconto(cupom, valor) VALUES ('GANHOU15BR', 15.00);
INSERT INTO tb_desconto(cupom, valor) VALUES ('GANHOU20BR', 20.00);
INSERT INTO tb_desconto(cupom, valor) VALUES ('GANHOU25BR', 25.00);
INSERT INTO tb_desconto(cupom, valor) VALUES ('GANHOU30BR', 30.00);
INSERT INTO tb_desconto(cupom, valor) VALUES ('GANHOU35BR', 35.00);
INSERT INTO tb_desconto(cupom, valor) VALUES ('GANHOU40BR', 40.00);
INSERT INTO tb_desconto(cupom, valor) VALUES ('GANHOU45BR', 45.00);
INSERT INTO tb_desconto(cupom, valor) VALUES ('GANHOU50BR', 50.00);


-- INSERINDO NA TABELA FRETE
INSERT INTO tb_frete(id, preco, tipo) VALUES (54437, 125.50, 'RAPIDO');
INSERT INTO tb_frete(id, preco, tipo) VALUES (12547, 75.00, 'COMUM');
INSERT INTO tb_frete(id, preco, tipo) VALUES (38696, 24.00, 'ECONOMICO');
INSERT INTO tb_frete(id, preco, tipo) VALUES (54438, 113.70, 'RAPIDO');
INSERT INTO tb_frete(id, preco, tipo) VALUES (12548, 48.99, 'COMUM');
INSERT INTO tb_frete(id, preco, tipo) VALUES (38698, 20.00, 'ECONOMICO');
INSERT INTO tb_frete(id, preco, tipo) VALUES (54439, 120.50, 'RAPIDO');
INSERT INTO tb_frete(id, preco, tipo) VALUES (12549, 79.90, 'COMUM');
INSERT INTO tb_frete(id, preco, tipo) VALUES (38699, 30.00, 'ECONOMICO');
INSERT INTO tb_frete(id, preco, tipo) VALUES (38640, 15.99, 'ECONOMICO');


-- INSERINDO NA TABELA IMPOSTO
INSERT INTO tb_imposto(tipo, valor) VALUES ('MUNICIPAL', 22.90);
INSERT INTO tb_imposto(tipo, valor) VALUES ('MUNICIPAL', 25.90);
INSERT INTO tb_imposto(tipo, valor) VALUES ('ESTADUAL', 35.90);
INSERT INTO tb_imposto(tipo, valor) VALUES ('NACIONAL', 48.90);
INSERT INTO tb_imposto(tipo, valor) VALUES ('MUNICIPAL', 22.90);
INSERT INTO tb_imposto(tipo, valor) VALUES ('INTERNACIONAL', 88.87);
INSERT INTO tb_imposto(tipo, valor) VALUES ('MUNICIPAL', 55.90);
INSERT INTO tb_imposto(tipo, valor) VALUES ('ESTADUAL', 65.90);
INSERT INTO tb_imposto(tipo, valor) VALUES ('NACIONAL', 78.90);
INSERT INTO tb_imposto(tipo, valor) VALUES ('INTERNACIONAL', 107.84);


-- INSERINDO NA TABELA ENTREGA
INSERT INTO tb_entrega(entregador, pacote, cliente, data_hora)
VALUES (
    (SELECT REF(E) FROM tb_entregador E WHERE cpf = '112.347.229-10'),
    (SELECT REF(P) FROM tb_pacote P WHERE id = 1524),
    (SELECT REF(C) FROM tb_cliente C WHERE cpf = '906.692.129-38'),
    TO_DATE('10/02/2021 12:50', 'DD/MM/YYYY HH24:MI'));

INSERT INTO tb_entrega(entregador, pacote, cliente, data_hora)
VALUES (
    (SELECT REF(E) FROM tb_entregador E WHERE cpf = '112.347.229-10'),
    (SELECT REF(P) FROM tb_pacote P WHERE id = 2321),
    (SELECT REF(C) FROM tb_cliente C WHERE cpf = '859.839.606-01'),
    TO_DATE('20/06/2021 08:32', 'DD/MM/YYYY HH24:MI'));

INSERT INTO tb_entrega(entregador, pacote, cliente, data_hora)
VALUES (
    (SELECT REF(E) FROM tb_entregador E WHERE cpf = '112.347.229-17'),
    (SELECT REF(P) FROM tb_pacote P WHERE id = 2213),
    (SELECT REF(C) FROM tb_cliente C WHERE cpf = '906.692.129-38'),
    TO_DATE('15/11/2021 16:24', 'DD/MM/YYYY HH24:MI'));

INSERT INTO tb_entrega(entregador, pacote, cliente, data_hora)
VALUES (
    (SELECT REF(E) FROM tb_entregador E WHERE cpf = '112.347.229-10'),
    (SELECT REF(P) FROM tb_pacote P WHERE id = 9493),
    (SELECT REF(C) FROM tb_cliente C WHERE cpf = '589.736.772-12'),
    TO_DATE('13/01/2021 10:51', 'DD/MM/YYYY HH24:MI'));

INSERT INTO tb_entrega(entregador, pacote, cliente, data_hora)
VALUES (
    (SELECT REF(E) FROM tb_entregador E WHERE cpf = '112.347.229-17'),
    (SELECT REF(P) FROM tb_pacote P WHERE id = 5464),
    (SELECT REF(C) FROM tb_cliente C WHERE cpf = '906.692.129-38'),
    TO_DATE('23/05/2021 13:06', 'DD/MM/YYYY HH24:MI'));

INSERT INTO tb_entrega(entregador, pacote, cliente, data_hora)
VALUES (
    (SELECT REF(E) FROM tb_entregador E WHERE cpf = '112.347.229-10'),
    (SELECT REF(P) FROM tb_pacote P WHERE id = 2356),
    (SELECT REF(C) FROM tb_cliente C WHERE cpf = '589.736.772-12'),
    TO_DATE('07/04/2021 10:48', 'DD/MM/YYYY HH24:MI'));

INSERT INTO tb_entrega(entregador, pacote, cliente, data_hora)
VALUES (
    (SELECT REF(E) FROM tb_entregador E WHERE cpf = '112.347.229-10'),
    (SELECT REF(P) FROM tb_pacote P WHERE id = 6840),
    (SELECT REF(C) FROM tb_cliente C WHERE cpf = '906.692.129-38'),
    TO_DATE('10/02/2021 12:30', 'DD/MM/YYYY HH24:MI'));

INSERT INTO tb_entrega(entregador, pacote, cliente, data_hora)
VALUES (
    (SELECT REF(E) FROM tb_entregador E WHERE cpf = '112.347.229-19'),
    (SELECT REF(P) FROM tb_pacote P WHERE id = 2359),
    (SELECT REF(C) FROM tb_cliente C WHERE cpf = '105.246.452-14'),
    TO_DATE('07/09/2021 14:33', 'DD/MM/YYYY HH24:MI'));

INSERT INTO tb_entrega(entregador, pacote, cliente, data_hora)
VALUES (
    (SELECT REF(E) FROM tb_entregador E WHERE cpf = '112.347.229-10'),
    (SELECT REF(P) FROM tb_pacote P WHERE id = 1950),
    (SELECT REF(C) FROM tb_cliente C WHERE cpf = '589.736.772-12'),
    TO_DATE('03/07/2021 17:00', 'DD/MM/YYYY HH24:MI'));

INSERT INTO tb_entrega(entregador, pacote, cliente, data_hora)
VALUES (
    (SELECT REF(E) FROM tb_entregador E WHERE cpf = '112.347.229-19'),
    (SELECT REF(P) FROM tb_pacote P WHERE id = 9904),
    (SELECT REF(C) FROM tb_cliente C WHERE cpf = '105.246.452-14'),
    TO_DATE('22/12/2021 09:00', 'DD/MM/YYYY HH24:MI'));


-- INSERINDO NA TABELA TEM
INSERT INTO tb_tem(pacote, frete, desconto)
VALUES (
    (SELECT REF(P) FROM tb_pacote P WHERE id = 9904),
    (SELECT REF(F) FROM tb_frete F WHERE id = 54437),
    (SELECT REF(D) FROM tb_desconto D WHERE cupom = 'GANHOU50BR'));

INSERT INTO tb_tem(pacote, frete, desconto)
VALUES (
    (SELECT REF(P) FROM tb_pacote P WHERE id = 2321),
    (SELECT REF(F) FROM tb_frete F WHERE id = 12547),
    NULL);

INSERT INTO tb_tem(pacote, frete, desconto)
VALUES (
    (SELECT REF(P) FROM tb_pacote P WHERE id = 2213),
    (SELECT REF(F) FROM tb_frete F WHERE id = 54438),
    (SELECT REF(D) FROM tb_desconto D WHERE cupom = 'GANHOU30BR'));

INSERT INTO tb_tem(pacote, frete, desconto)
VALUES (
    (SELECT REF(P) FROM tb_pacote P WHERE id = 9493),
    (SELECT REF(F) FROM tb_frete F WHERE id = 38696),
    NULL);

INSERT INTO tb_tem(pacote, frete, desconto)
VALUES (
    (SELECT REF(P) FROM tb_pacote P WHERE id = 5464),
    (SELECT REF(F) FROM tb_frete F WHERE id = 12548),
    (SELECT REF(D) FROM tb_desconto D WHERE cupom = 'GANHOU15BR'));

INSERT INTO tb_tem(pacote, frete, desconto)
VALUES (
    (SELECT REF(P) FROM tb_pacote P WHERE id = 2356),
    (SELECT REF(F) FROM tb_frete F WHERE id = 38698),
    NULL);

INSERT INTO tb_tem(pacote, frete, desconto)
VALUES (
    (SELECT REF(P) FROM tb_pacote P WHERE id = 6840),
    (SELECT REF(F) FROM tb_frete F WHERE id = 54439),
    (SELECT REF(D) FROM tb_desconto D WHERE cupom = 'GANHOU20BR'));

INSERT INTO tb_tem(pacote, frete, desconto)
VALUES (
    (SELECT REF(P) FROM tb_pacote P WHERE id = 1524),
    (SELECT REF(F) FROM tb_frete F WHERE id = 12549),
    NULL);

INSERT INTO tb_tem(pacote, frete, desconto)
VALUES (
    (SELECT REF(P) FROM tb_pacote P WHERE id = 2359),
    (SELECT REF(F) FROM tb_frete F WHERE id = 38699),
    NULL);

INSERT INTO tb_tem(pacote, frete, desconto)
VALUES (
    (SELECT REF(P) FROM tb_pacote P WHERE id = 1950),
    (SELECT REF(F) FROM tb_frete F WHERE id = 38640),
    (SELECT REF(D) FROM tb_desconto D WHERE cupom = 'GANHOU35BR'));