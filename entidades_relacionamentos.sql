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

-- ESTADIA

CREATE TABLE ESTADIA(

 pk_cod_estadia INTEGER,
 valor_estadia NUMBER(38,2),
 data_check_in DATE,
 data_check_out DATE,
 CONSTRAINT cod_estadia_pkey PRIMARY KEY(pk_cod_estadia)
);


-- relacionamentos
