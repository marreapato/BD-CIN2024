-- ENTIDADE HOTEL
CREATE TABLE HOTEL(

    pkid_hotel INTEGER,
    nome VARCHAR2(30),
    endereco_hotel tp_endereco,
    CONSTRAINT hotel_pkey PRIMARY KEY (pkid_hotel)
);

SELECT * FROM HOTEL;

--Instance01 sid


-- ESTADIA

CREATE TABLE ESTADIA(

 pk_cod_estadia INTEGER,
 valor_estadia NUMBER(38,2),
 data_check_in DATE,
 data_check_out DATE,
 CONSTRAINT cod_estadia_pkey PRIMARY KEY(pk_cod_estadia)
);


-- relacionamentos
