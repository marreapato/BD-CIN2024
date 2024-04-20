--TABELA OBJETO

CREATE TABLE PASSAGEIRO_TB OF TP_PASSAGEIRO(
CONSTRAINT CPF_UNICO_PASSAGEIRO PRIMARY KEY (PK_CPF)
);


CREATE TABLE MENOR_IDADE_TB OF MENOR_IDADE_TP(

CONSTRAINT CPF_MENOR_PKEY PRIMARY KEY (MENOR_IDADE_CPF),
CONSTRAINT FK_CPF_MENOR FOREIGN KEY (MENOR_IDADE_CPF) REFERENCES PASSAGEIRO_TB(PK_CPF)

);

CREATE TABLE MAIOR_IDADE_TB OF MAIOR_IDADE_TP(

CONSTRAINT CPF_MAIOR_PKEY PRIMARY KEY (MAIOR_IDADE_CPF),
CONSTRAINT FK_CPF_MAIOR FOREIGN KEY (MAIOR_IDADE_CPF) REFERENCES PASSAGEIRO_TB(PK_CPF)

);
----

--DROP TABLE VOO;


CREATE TABLE VOO OF VOO_TP(
    CONSTRAINT voo_pkey PRIMARY KEY (pk_numero_voo) -- constraint de primary key
);

--DROP TABLE PASSAGEM;

CREATE TABLE PASSAGEM OF PASSAGEM_TP(    
    CONSTRAINT numero_passagem_pkey PRIMARY KEY(pk_numero_passagem)
);


--DROP TABLE ESTADIA;

CREATE TABLE ESTADIA OF ESTADIA_TP(
 CONSTRAINT cod_estadia_pkey PRIMARY KEY(pk_cod_estadia)
);



CREATE TABLE HOTEL OF HOTEL_TP(
    CONSTRAINT hotel_pkey PRIMARY KEY (pkid_hotel)
);

-- RELACIONAMENTOS

CREATE TABLE REL_REFERESE_TB OF REL_REFERESE_TP(
    CONSTRAINT FK_cod_passagem FOREIGN KEY (cod_passagem) REFERENCES PASSAGEM(pk_numero_passagem),
    CONSTRAINT FK_cod_voo FOREIGN KEY (cod_voo) REFERENCES VOO(pk_numero_voo),
    CONSTRAINT unique_cod_passagem UNIQUE (cod_passagem)
);


--COMPRA
CREATE TABLE RELAC_COMPRA_TB OF RELAC_COMPRA_TP(

CONSTRAINT passageiro_cpf_fkey FOREIGN KEY(PASSAGEIRO_ID) REFERENCES PASSAGEIRO_TB(PK_CPF),
CONSTRAINT PASSAGEM_ID_FKEY FOREIGN KEY(PASSAGEM_ID) REFERENCES PASSAGEM(PK_NUMERO_PASSAGEM),
CONSTRAINT RELAC_COMPRA_PK PRIMARY KEY (LOCALIZADOR, PASSAGEIRO_ID, PASSAGEM_ID),
CONSTRAINT UNIQUE_PASSAGEM_ID UNIQUE(PASSAGEM_ID)
);

CREATE TABLE REL_REGISTRA_TB OF REL_REGISTRA_TP(
    CONSTRAINT fk_rel_registra_hotel
    FOREIGN KEY (hotel_id) REFERENCES HOTEL(pkid_hotel), 
    CONSTRAINT fk_rel_registra_estadia
    FOREIGN KEY (estadia_id) REFERENCES ESTADIA(pk_cod_estadia),
    CONSTRAINT estadia_id_unique UNIQUE (estadia_id)
);
