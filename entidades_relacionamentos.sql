-- ENTIDADE TRECHO
CREATE TABLE trecho (
    pkid_trecho INTEGER, -- trecho ID
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

-- CIA AEREA
CREATE TABLE CIA_AEREA(

    pkid_cia INTEGER,
    nome_cia varchar2(30),
    taxa_comissao_cia BINARY_FLOAT, --taxa da cia
    email_cia varchar2(30),--Email simples cia
    telefone_cia varchar2(30),
    status_ativo varchar2(30),
    CONSTRAINT cia_pkey PRIMARY KEY(pkid_cia)
);

SELECT * FROM CIA_AEREA;

--ENTIDADE DEPENDENTE

CREATE TABLE DEPENDENTES(
    pk_cpf_dependente VARCHAR2(30),
    nome VARCHAR2(30),
    idade INTEGER,
    sexo VARCHAR2(1),
    CONSTRAINT dep_cpf_pkey PRIMARY KEY(pk_cpf_dependente)
);

SELECT * FROM DEPENDENTES;

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
