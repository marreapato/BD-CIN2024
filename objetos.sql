----- tipos de objetos

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

--DROP TYPE TP_FONES;

--TIPO PESSOA

CREATE OR REPLACE TYPE tp_pessoa AS OBJECT(

    pk_cpf VARCHAR2(11),
    NOME VARCHAR2(20),
    SEXO VARCHAR2(1),
    DATA_NASCIMENTO DATE,
    ENDERECO_PAX tp_endereco,
    TELEFONES tp_fones,
    EMAIL VARCHAR2(30)
    
)NOT FINAL;


--TIPO MENOR DE IDADE

CREATE TYPE MENOR_IDADE_TP UNDER TP_PESSOA(
    autorizacao_viagem varchar2(3)  
);


--TABELA OBJETO

CREATE TABLE MENOR_IDADE_TB OF MENOR_IDADE_TP(
CONSTRAINT AUTORIZACAO_VALOR CHECK (autorizacao_viagem IN ('SIM', 'NAO'))
);

--DROP TABLE MENOR_IDADE_TB;
SELECT * FROM MENOR_IDADE_TB;

--TIPO MENOR DE IDADE

CREATE TYPE MAIOR_IDADE_TP UNDER TP_PESSOA();

--TABELA OBJETO

CREATE TABLE MAIOR_IDADE_TB OF MAIOR_IDADE_TP;

SELECT * FROM MAIOR_IDADE_TB;

----

DROP TABLE VOO;
-- ENTIDADE VOO
CREATE OR REPLACE TYPE VOO_TP AS OBJECT(
    pk_numero_voo NUMBER(38,0), -- trecho ID
    origem VARCHAR2(3),       -- origem IATA 3
    destino VARCHAR2(3),      -- destino IATA 3
    hora_embarque TIMESTAMP,
    hora_desembarque TIMESTAMP
);

CREATE TABLE VOO OF VOO_TP(
    CONSTRAINT voo_pkey PRIMARY KEY (pk_numero_voo) -- constraint de primary key
);

--DROP TABLE PASSAGEM;
--PASSAGEM
CREATE TYPE PASSAGEM_TP AS OBJECT(    
    pk_numero_passagem VARCHAR2(22),
    valor_passagem NUMBER(38,2),
    data_ida DATE,
    data_chegada DATE
);

CREATE TABLE PASSAGEM OF PASSAGEM_TP(    
    CONSTRAINT numero_passagem_pkey PRIMARY KEY(pk_numero_passagem)
);

CREATE OR REPLACE TYPE tp_relac AS OBJECT(
passagem REF tp_projeto,
voo REF tp_atividade,
) NOT
