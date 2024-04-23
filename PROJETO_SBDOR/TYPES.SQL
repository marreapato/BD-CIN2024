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


CREATE TYPE MAIOR_IDADE_TP UNDER TP_PASSAGEIRO(
);

--DROP TYPE MENOR_IDADE_TP;
CREATE TYPE MENOR_IDADE_TP UNDER TP_PASSAGEIRO(
    acompanhamento_especial varchar2(3)  
);


--DROP TYPE PASSAGEM_TP;
CREATE TYPE PASSAGEM_TP AS OBJECT(    
    pk_localizador_passagem INTEGER,
    valor_passagem NUMBER(38,2),
    data_ida DATE,
    data_chegada DATE
);

----

CREATE OR REPLACE TYPE tp_ref_relac AS OBJECT(
passageiros REF TP_PASSAGEIRO,
passagem REF PASSAGEM_TP) NOT FINAL;
/
    
CREATE TYPE tp_nt_ref_relac AS TABLE OF tp_ref_relac;
/
    

-- ENTIDADE VOO
CREATE OR REPLACE TYPE VOO_TP AS OBJECT(
    pk_numero_voo NUMBER(38,0), -- trecho ID
    origem VARCHAR2(3),       -- origem IATA 3
    destino VARCHAR2(3),      -- destino IATA 3
    hora_embarque TIMESTAMP,
    hora_desembarque TIMESTAMP,
    compras tp_nt_ref_relac
);


----------------
CREATE TYPE ESTADIA_TP AS OBJECT(

 pk_cod_estadia INTEGER,
 valor_estadia NUMBER(38,2),
 data_check_in DATE,
 data_check_out DATE,
 reservas tp_nt_ref_relac
 
);

    
CREATE OR REPLACE TYPE tp_ref_registrada AS OBJECT(
estadias REF ESTADIA_TP) NOT FINAL;
/
    
CREATE TYPE tp_nt_ref_registrada AS TABLE OF tp_ref_registrada;
/


-- ENTIDADE HOTEL
CREATE TYPE HOTEL_TP AS OBJECT(

    pkid_hotel INTEGER,
    nome VARCHAR2(30),
    endereco_hotel tp_endereco,
    registros tp_nt_ref_registrada
);
