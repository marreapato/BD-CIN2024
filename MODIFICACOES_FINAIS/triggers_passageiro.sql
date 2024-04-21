----- tipos de objetos

DROP TYPE MAIOR_IDADE_TP;

CREATE OR REPLACE TYPE tp_endereco AS OBJECT(
    pais varchar2(15),
    cep varchar2(9),
    estado varchar2(15),
    cidade VARCHAR2(20),
    complemento varchar2(30)
);

--DROP TYPE tp_endereco;

CREATE OR REPLACE TYPE TP_FONE AS OBJECT (
    COD_PAIS VARCHAR(3),
    COD_DDD VARCHAR(5),
    PHONE VARCHAR(10)
);

CREATE OR REPLACE TYPE TP_FONES AS VARRAY(3) OF TP_FONE;

--TIPO PESSOA
CREATE OR REPLACE TYPE TP_PASSAGEIRO AS OBJECT(
    PK_CPF VARCHAR2(11),
    NOME VARCHAR2(20),
    SEXO VARCHAR2(1),
    DATA_NASCIMENTO DATE,
    ENDERECO_PAX tp_endereco,
    TELEFONES tp_fones,
    EMAIL VARCHAR2(30),
    MEMBER FUNCTION calcular_idade RETURN NUMBER
    
)NOT FINAL;


-- Corpo da member function calcular_idade para o tipo TP_PASSAGEIRO --
CREATE OR REPLACE TYPE BODY TP_PASSAGEIRO AS
    MEMBER FUNCTION calcular_idade RETURN NUMBER IS
    BEGIN
        RETURN TRUNC(MONTHS_BETWEEN(SYSDATE, self.DATA_NASCIMENTO) / 12);
    END calcular_idade;
END;


CREATE TYPE MAIOR_IDADE_TP UNDER TP_PASSAGEIRO(idade NUMBER(38,0));

--DROP TYPE MENOR_IDADE_TP;
CREATE TYPE MENOR_IDADE_TP UNDER TP_PASSAGEIRO(
    idade NUMBER(38,0),
    autorizacao_viagem varchar2(3)  
);


--TABELA OBJETO

CREATE TABLE PASSAGEIRO_TB OF TP_PASSAGEIRO(
CONSTRAINT CPF_UNICO_PASSAGEIRO PRIMARY KEY (PK_CPF)
);


CREATE TABLE MENOR_IDADE_TB OF MENOR_IDADE_TP;

CREATE TABLE MAIOR_IDADE_TB OF MAIOR_IDADE_TP;
----

CREATE OR REPLACE FUNCTION calcular_idade_trigger(data_nascimento DATE) RETURN NUMBER IS
BEGIN
    RETURN TRUNC(MONTHS_BETWEEN(SYSDATE, data_nascimento) / 12);
END calcular_idade_trigger;



CREATE OR REPLACE TRIGGER idade_passageiro_trigger
BEFORE INSERT ON PASSAGEIRO_TB
FOR EACH ROW
DECLARE
    v_idade NUMBER;
    v_autorizacao_viagem VARCHAR2(3);
BEGIN
    -- Calcula a idade do novo passageiro
    v_idade := calcular_idade_trigger(:new.DATA_NASCIMENTO);

    -- Determina o valor de autorizacao_viagem com base na idade
    IF v_idade < 16 THEN
        v_autorizacao_viagem := 'nao';
    ELSIF v_idade >= 16 AND v_idade < 18 THEN
        v_autorizacao_viagem := 'sim';
    ELSE
        v_autorizacao_viagem := NULL; -- Você pode definir outro valor padrão se necessário
    END IF;

    -- Insere na tabela apropriada
    IF v_idade < 18 THEN
        -- Inserir na tabela MENOR_IDADE_TB
        INSERT INTO MENOR_IDADE_TB (PK_CPF, NOME, SEXO, DATA_NASCIMENTO, ENDERECO_PAX, TELEFONES, EMAIL, idade, autorizacao_viagem)
        VALUES (:new.PK_CPF, :new.NOME, :new.SEXO, :new.DATA_NASCIMENTO, :new.ENDERECO_PAX, :new.TELEFONES, :new.EMAIL, v_idade, v_autorizacao_viagem);
    ELSE
        -- Inserir na tabela MAIOR_IDADE_TB
        INSERT INTO MAIOR_IDADE_TB (PK_CPF, NOME, SEXO, DATA_NASCIMENTO, ENDERECO_PAX, TELEFONES, EMAIL, idade)
        VALUES (:new.PK_CPF, :new.NOME, :new.SEXO, :new.DATA_NASCIMENTO, :new.ENDERECO_PAX, :new.TELEFONES, :new.EMAIL, v_idade);
    END IF;
END;
/


INSERT INTO PASSAGEIRO_TB(PK_CPF, NOME, SEXO, DATA_NASCIMENTO, ENDERECO_PAX, TELEFONES, EMAIL)
VALUES('12345678912','MARCOS','M',TO_DATE('14/01/2000','DD/MM/YYYY'),TP_ENDERECO('BRASIL','123','BAHIA','SALVADOR','123 RUA'),
    TP_FONES(TP_FONE('55','71','983439843'),TP_FONE('55','89','948343888')),'MARCOS@GMAIL.COM');


SELECT * FROM PASSAGEIRO_TB;

SELECT * FROM MAIOR_IDADE_TB;
