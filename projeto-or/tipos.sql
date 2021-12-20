-- CRIACAO DO TIPO ENDERECO
CREATE OR REPLACE TYPE tp_endereco AS OBJECT(
	cep VARCHAR(10), -- XX.XXX-XXX
	rua VARCHAR2(255),
    numero INTEGER,
    cidade VARCHAR2(255),
    estado VARCHAR2(255),

    MEMBER PROCEDURE exibirEndereco
);
/

-- BODY DO TIPO ENDERECO
CREATE OR REPLACE TYPE BODY tp_endereco AS   
    MEMBER PROCEDURE exibirEndereco IS
    BEGIN
        DBMS_OUTPUT.PUT_LINE('Endereço:');
        DBMS_OUTPUT.PUT_LINE(rua || ', ' || TO_CHAR(numero));
        DBMS_OUTPUT.PUT_LINE(cidade || ', ' || estado);
        DBMS_OUTPUT.PUT_LINE('CEP :' || cep);
    END;
END;
/

-- CRIACAO DO TIPO TELEFONE
CREATE OR REPLACE TYPE tp_telefone AS OBJECT(
    telefone VARCHAR(14) -- (XX)XXXXX-XXXX
) NOT FINAL NOT INSTANTIABLE;
/

-- CRIACAO DO TIPO TELEFONES (ATRIBUTO MULTIVALORADO - LISTA DE VARIOS TELEFONES)
CREATE OR REPLACE TYPE tp_telefones AS VARRAY(3) OF tp_telefone;
/

-- CRIACAO DO TIPO PESSOA
CREATE OR REPLACE TYPE tp_pessoa AS OBJECT(
    nome VARCHAR(255),
    cpf VARCHAR(14), -- XXX.XXX.XXX-XX
    endereco tp_endereco,

    CONSTRUCTOR FUNCTION tp_pessoa(SELF IN OUT NOCOPY tp_pessoa, nome VARCHAR2, cpf VARCHAR2, endereco tp_endereco) RETURN SELF AS RESULT,
    ORDER MEMBER FUNCTION ordernaPorNome(P tp_pessoa) RETURN INTEGER,
    MEMBER FUNCTION mesmoLugar(P1 tp_pessoa, P2 tp_pessoa) RETURN BOOLEAN
) NOT FINAL;
/

-- BODY DO TIPO PESSOA
CREATE OR REPLACE TYPE BODY tp_pessoa AS
    CONSTRUCTOR FUNCTION tp_pessoa(SELF IN OUT NOCOPY tp_pessoa, nome VARCHAR2, cpf VARCHAR2, endereco tp_endereco) RETURN SELF AS RESULT IS
    BEGIN
        SELF.nome:= nome;
        SELF.cpf:= cpf;
        SELF.endereco:= endereco;
	    RETURN;
    END;

    ORDER MEMBER FUNCTION ordernaPorNome(P tp_pessoa) RETURN INTEGER IS
    BEGIN
        IF SELF.nome > P.nome THEN
            RETURN (1);
        ELSE IF SELF.nome < P.nome THEN
            RETURN (-1);
            END IF;
        ELSE
            RETURN (0);
        END IF;
    END;

    MEMBER FUNCTION mesmoLugar(P1 tp_pessoa, P2 tp_pessoa) RETURN BOOLEAN IS
    BEGIN
        IF P1.endereco.estado = P2.endereco.estado THEN
            RETURN (TRUE);
        ELSE 
            RETURN (FALSE);
        END IF;
    END;    
END;
/

-- CRIACAO DO TIPO ENTREGADOR (ESPECIALIZAO DE PESSOA)
CREATE OR REPLACE TYPE tp_entregador UNDER tp_pessoa(
    salario NUMBER,

    MEMBER PROCEDURE comparaSalario(E1 tp_entregador, E2 tp_entregador),
    FINAL MEMBER FUNCTION bonusSalarioAnual(E tp_entregador) RETURN NUMBER,
    OVERRIDING MEMBER FUNCTION mesmoLugar(P1 tp_pessoa, P2 tp_pessoa) RETURN BOOLEAN
);
/

-- BODY DO TIPO ENTREGADOR
CREATE OR REPLACE TYPE BODY tp_entregador AS
    MEMBER PROCEDURE comparaSalario(E1 tp_entregador, E2 tp_entregador) IS
    BEGIN
        IF E1.salario > E2.salario THEN
            dif1 NUMBER := E1.salario - E2.salario;
            DBMS_OUTPUT.PUT_LINE(E1.nome || ' recebe R$' || dif1 || ' a mais que ' || E2.nome);
        ELSE IF E1.salario < E2.salario THEN
            dif2 NUMBER := E2.salario - E1.salario;
            DBMS_OUTPUT.PUT_LINE(E2.nome || ' recebe R$' || dif2 || ' a mais que ' || E1.nome);
            END IF;
        ELSE
            DBMS_OUTPUT.PUT_LINE(E2.nome || ' e ' || E1.nome || ' recebem o mesmo salario');
        END IF;        
    END;
    
    FINAL MEMBER FUNCTION bonusSalarioAnual(E tp_entregador) RETURN NUMBER IS
    BEGIN
        RETURN E.salario * 1.15;
    END;

    OVERRIDING MEMBER FUNCTION mesmoLugar(P1 tp_pessoa, P2 tp_pessoa) RETURN BOOLEAN IS
    BEGIN
        IF P1.endereco.cidade = P2.endereco.cidade THEN
            RETURN (TRUE);
        ELSE 
            RETURN (FALSE);
        END IF;
    END;
END;
/

ALTER TYPE tp_entregador
ADD ATTRIBUTE(supervisor REF tp_entregador) CASCADE;
/

-- CRIACAO DO TIPO CLIENTE (ESPECIALIZAO DE PESSOA)
CREATE OR REPLACE TYPE tp_cliente UNDER tp_pessoa(
    telefones tp_telefones
);
/

-- CRIACAO DO TIPO PACOTE
CREATE OR REPLACE TYPE tp_pacote AS OBJECT(
    id INTEGER,
    status_entrega VARCHAR(10),
    endereco_destino tp_endereco,

    MAP MEMBER FUNCTION ordernaPorStatus RETURN NUMBER
);
/

-- BODY DO TIPO PACOTE
CREATE OR REPLACE TYPE BODY tp_pacote AS
    MAP MEMBER FUNCTION ordernaPorStatus RETURN NUMBER IS
    BEGIN
        IF SELF.status_entrega = 'ENTREGUE' THEN
            RETURN (1);
        ELSE
            RETURN (-1);
        END IF; 
    END;   
END;
/

-- COLECAO DE PASCOTES (NESTED TABLE) PARA UTILIZAR NO RELACIONAMENTO COM FRETE
CREATE TYPE tp_nt_pacotes AS TABLE OF tp_pacote;
/

-- CRIACAO DO TIPO DECONTO
CREATE OR REPLACE TYPE tp_desconto AS OBJECT(
    cupom VARCHAR(10),
    valor NUMBER
);
/

-- CRIACAO DO TIPO FRETE
CREATE OR REPLACE TYPE tp_frete AS OBJECT(
    id INTEGER,
    preco NUMBER,
    tipo VARCHAR(9),
    pacotes tp_nt_pacotes,

    MEMBER PROCEDURE detalhesFrete (SELF tp_frete)
);
/

-- BODY DO TIPO FRETE
CREATE OR REPLACE TYPE BODY tp_frete AS
    MEMBER PROCEDURE detalhesFrete (SELF tp_frete) IS
    BEGIN
        DBMS_OUTPUT.PUT_LINE('Custo do frete: ' || 'R$'|| TO_CHAR(SELF.preco));        
        DBMS_OUTPUT.PUT_LINE('Tipo do frete: ' || SELF.tipo);

        DBMS_OUTPUT.PUT_LINE('Pacotes: ' || SELF.pacotes.id);

        i INTEGER := SELF.pacotes.id.FIRST;
        
        WHILE i IS NOT NULL LOOP
            IF i != SELF.pacotes.id.LAST THEN
                DBMS_OUTPUT.PUT(TO_CHAR(SELF.pacotes.id(i)) || ', ');
                i := SELF.pacotes.id.NEXT(i);
            ELSE
                DBMS_OUTPUT.PUT(TO_CHAR(SELF.pacotes.id(i)) || '.');
            END IF;
        END LOOP;
    END;
END;
/

-- CRIACAO DO TIPO IMPOSTO
CREATE OR REPLACE TYPE tp_imposto AS OBJECT(
    valor NUMBER,
    tipo VARCHAR(13)
);
/

-- CRIACAO DO TIPO ENTREGA - RELACIONAMENTO TERNARIO (ENTREGADOR, PACOTE, CLIENTE)
CREATE OR REPLACE TYPE tp_entrega AS OBJECT(
    entregador REF tp_entregador,
    pacote REF tp_pacote,
    cliente REF tp_cliente,
    data_hora DATE, -- ('DD/MM/YYYY HH24:MI')

    MEMBER PROCEDURE detalhesEntrega (SELF tp_entrega)
);
/

-- BODY DO TIPO ENTREGA
CREATE OR REPLACE TYPE BODY tp_entrega AS
    MEMBER PROCEDURE detalhesEntrega (SELF tp_entrega) IS 
    BEGIN
        DBMS_OUTPUT.PUT_LINE('Nome do Entregador: ' || SELF.entregador.nome);        
        DBMS_OUTPUT.PUT_LINE('Nome do Cliente: ' || SELF.cliente.nome);       
        DBMS_OUTPUT.PUT_LINE('Status: ' || SELF.pacote.status);       
    END;
END;
/
-- TIPO "TEM" REPRESENTA O RELACIONAMENTO DA ENTIDADE ASSOCIATIVA PACOTE-FRETE COM DESCONTO
CREATE OR REPLACE TYPE tp_tem AS OBJECT(
    pacote REF tp_pacote,
    frete REF tp_frete,
    desconto REF tp_desconto
);