-- ENTIDADE HOTEL
CREATE TABLE HOTEL(

    pkid_hotel INTEGER,
    nome VARCHAR2(30),
    endereco_hotel tp_endereco,
    CONSTRAINT hotel_pkey PRIMARY KEY (pkid_hotel)
);

SELECT * FROM HOTEL;

--Instance01 sid

--DROP TABLE HOTEL;

-- ENTIDADE VOO
CREATE TABLE VOO (
    pk_numero_voo NUMBER(38,0), -- trecho ID
    origem VARCHAR2(3),       -- origem IATA 3
    destino VARCHAR2(3),      -- destino IATA 3
    hora_embarque TIMESTAMP,
    hora_desembarque TIMESTAMP,
    CONSTRAINT voo_pkey PRIMARY KEY (pk_numero_voo) -- constraint de primary key
);

--DROP TABLE VOO;
--PASSAGEM
CREATE TABLE PASSAGEM(    
    pk_numero_passagem VARCHAR2(22),
    valor_passagem NUMBER(38,2),
    data_ida DATE,
    data_chegada DATE,
    CONSTRAINT numero_passagem_pkey PRIMARY KEY(pk_numero_passagem)
);

SELECT * FROM PASSAGEM;
--DROP TABLE CADASTRO;

-- PASSAGEIRO CONTRATANTE

CREATE TABLE PASSAGEIRO_CONTRATANTE(
    pk_cpf VARCHAR2(30),
    sexo VARCHAR2(1),
    email VARCHAR2(30),
    telefone VARCHAR2(30),
    pais VARCHAR2(30),
    cidade VARCHAR2(30),
    estado VARCHAR2(30),
    cep VARCHAR2(30),
    complemento_end VARCHAR2(30),
    nome VARCHAR2(30),
    CONSTRAINT cpf_pkey PRIMARY KEY(pk_cpf)
);

SELECT * FROM PASSAGEIRO_CONTRATANTE;

-- relacionamentos
