
CREATE TABLE PASSAGEIRO_TB OF TP_PASSAGEIRO(
CONSTRAINT CPF_UNICO_PASSAGEIRO PRIMARY KEY (PK_CPF)
);


CREATE TABLE MENOR_IDADE_TB OF MENOR_IDADE_TP;

CREATE TABLE MAIOR_IDADE_TB OF MAIOR_IDADE_TP;


CREATE TABLE PASSAGEM OF PASSAGEM_TP(    
    CONSTRAINT numero_passagem_pkey PRIMARY KEY(pk_numero_passagem)
);

CREATE TABLE VOO_TABLE OF voo_tp (
    CONSTRAINT pkey_localizador_voo PRIMARY KEY (pk_localizador_voo)

) NESTED TABLE COMPRAS STORE AS LISTA_COMPRAS;


CREATE TABLE ESTADIA OF ESTADIA_TP(
 CONSTRAINT cod_estadia_pkey PRIMARY KEY(pk_cod_estadia)
)NESTED TABLE RESERVAS STORE AS LISTA_RESERVAS;
  

CREATE TABLE HOTEL OF HOTEL_TP(
    CONSTRAINT hotel_pkey PRIMARY KEY (pkid_hotel)
)NESTED TABLE REGISTROS STORE AS LISTA_REGISTROS;
