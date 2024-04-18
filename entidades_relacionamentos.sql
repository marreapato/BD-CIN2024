-- ENTIDADE TRECHO
CREATE TABLE trecho (
    pkid_trecho NUMBER(38,0), -- trecho ID
    origem VARCHAR2(3),       -- origem IATA 3
    destino VARCHAR2(3),      -- destino IATA 3
    CONSTRAINT trecho_pkey PRIMARY KEY (pkid_trecho) -- constraint de primary key
);

SELECT * FROM TRECHO;

--DROP TABLE TRECHO;

-- ENTIDADE HOTEL
CREATE TABLE HOTEL(

    pkid_hotel INTEGER,
    nome VARCHAR2(30),
    taxa_comissao BINARY_FLOAT,
    --avg_estrelas BINARY_FLOAT Devo fazer em uma view? acho que fica complicado colocar em uma tabela
    CONSTRAINT hotel_pkey PRIMARY KEY (pkid_hotel)
);

SELECT * FROM HOTEL;

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
--CADASTRO CIA AEREA E TRECHO
CREATE TABLE CADASTRO(    
    pkid_cadastro VARCHAR2(22),
    data_cadastro date,
    fkid_trecho NUMBER(38,0),
    CONSTRAINT cadastro_pkey PRIMARY KEY(pkid_cadastro),
    CONSTRAINT cadastro_fkey_trecho FOREIGN KEY(fkid_trecho) REFERENCES trecho(pkid_trecho)
);

SELECT * FROM CADASTRO;
--DROP TABLE CADASTRO;
