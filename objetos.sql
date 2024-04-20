--TABELA OBJETO
CREATE TABLE MENOR_IDADE_TB OF MENOR_IDADE_TP(
CONSTRAINT AUTORIZACAO_VALOR CHECK (autorizacao_viagem IN ('SIM', 'NAO'))
);

--DROP TABLE MENOR_IDADE_TB;
SELECT * FROM MENOR_IDADE_TB;


--TABELA OBJETO

CREATE TABLE MAIOR_IDADE_TB OF MAIOR_IDADE_TP;

SELECT * FROM MAIOR_IDADE_TB;

----

DROP TABLE VOO;


CREATE TABLE VOO OF VOO_TP(
    CONSTRAINT voo_pkey PRIMARY KEY (pk_numero_voo) -- constraint de primary key
);

--DROP TABLE PASSAGEM;

CREATE TABLE PASSAGEM OF PASSAGEM_TP(    
    CONSTRAINT numero_passagem_pkey PRIMARY KEY(pk_numero_passagem)
);
----



--DROP TABLE ESTADIA;

CREATE TABLE ESTADIA OF ESTADIA_TP(
 CONSTRAINT cod_estadia_pkey PRIMARY KEY(pk_cod_estadia)
);



CREATE TABLE HOTEL OF HOTEL_TP(
    CONSTRAINT hotel_pkey PRIMARY KEY (pkid_hotel)
);
