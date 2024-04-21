--DROP TYPE MENOR_IDADE_TP;


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


CREATE TYPE ESTADIA_TP AS OBJECT(

 pk_cod_estadia INTEGER,
 valor_estadia NUMBER(38,2),
 data_check_in DATE,
 data_check_out DATE
 
);

-- ENTIDADE HOTEL
CREATE TYPE HOTEL_TP AS OBJECT(

    pkid_hotel INTEGER,
    nome VARCHAR2(30),
    endereco_hotel tp_endereco
);

--PASSAGEM
CREATE TYPE PASSAGEM_TP AS OBJECT(    
    pk_numero_passagem INTEGER,
    valor_passagem NUMBER(38,2),
    data_ida DATE,
    data_chegada DATE
);

-- ENTIDADE VOO
CREATE OR REPLACE TYPE VOO_TP AS OBJECT(
    pk_numero_voo NUMBER(38,0), -- trecho ID
    origem VARCHAR2(3),       -- origem IATA 3
    destino VARCHAR2(3),      -- destino IATA 3
    hora_embarque TIMESTAMP,
    hora_desembarque TIMESTAMP
);


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


--DROP TABLE PASSAGEIRO_TB;
--TIPO MENOR DE IDADE
--DROP TYPE MENOR_IDADE_TP;
CREATE TYPE MAIOR_IDADE_TP UNDER TP_PASSAGEIRO(
MAIOR_IDADE_CPF VARCHAR2(11),
idade NUMBER(38,0)
);

--DROP TYPE MENOR_IDADE_TP;
CREATE TYPE MENOR_IDADE_TP UNDER TP_PASSAGEIRO(
    MENOR_IDADE_CPF VARCHAR(11),
    idade NUMBER(38,0),
    autorizacao_viagem varchar2(3)  
);


---- RELACIONAMENTOS

CREATE TYPE REL_REFERESE_TP AS OBJECT(
    cod_passagem INTEGER,
    cod_voo NUMBER(38,0)
);


---
CREATE TYPE REL_REGISTRA_TP AS OBJECT(
    hotel_id INTEGER,
    estadia_id INTEGER
);

--TIPO Compra

CREATE TYPE RELAC_COMPRA_TP AS OBJECT(

    LOCALIZADOR INTEGER,
    PASSAGEIRO_ID VARCHAR2(11),
    PASSAGEM_ID INTEGER,
    DATA_COMPRA DATE
);


--DROP TYPE REL_RESERVA_TP;
CREATE TYPE REL_RESERVA_TP AS OBJECT(
    estadia_id INTEGER,
    comprador_passagem_id INTEGER
    
);
