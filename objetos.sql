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
    pk_numero_passagem VARCHAR2(22),
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

CREATE OR REPLACE TYPE tp_pessoa AS OBJECT(
    NOME VARCHAR2(20),
    SEXO VARCHAR2(1),
    DATA_NASCIMENTO DATE,
    ENDERECO_PAX tp_endereco,
    TELEFONES tp_fones,
    EMAIL VARCHAR2(30)
    
)NOT FINAL;

--TIPO MENOR DE IDADE

CREATE TYPE MAIOR_IDADE_TP UNDER TP_PESSOA();

CREATE TYPE MENOR_IDADE_TP UNDER TP_PESSOA(
    autorizacao_viagem varchar2(3)  
);


CREATE OR REPLACE TYPE PASSAGEIRO_TP AS OBJECT(
pk_cpf VARCHAR2(11),
PESSOA TP_PESSOA
);

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




--TIPO Compra

CREATE TYPE RELAC_COMPRA_TP AS OBJECT(

    LOCALIZADOR VARCHAR2(20),
    PASSAGEIRO_ID VARCHAR2(11),
    PASSAGEM_ID VARCHAR2(22)
);


