----- tipos de objetos

DROP TYPE MENOR_IDADE_TB;

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


CREATE TYPE MAIOR_IDADE_TP UNDER TP_PASSAGEIRO();

--DROP TYPE MENOR_IDADE_TP;
CREATE TYPE MENOR_IDADE_TP UNDER TP_PASSAGEIRO(
    autorizacao_viagem varchar2(3)  
);


--TABELA OBJETO

CREATE TABLE PASSAGEIRO_TB OF TP_PASSAGEIRO(
CONSTRAINT CPF_UNICO_PASSAGEIRO PRIMARY KEY (PK_CPF)
);


CREATE TABLE MENOR_IDADE_TB OF MENOR_IDADE_TP;

CREATE TABLE MAIOR_IDADE_TB OF MAIOR_IDADE_TP;
----

CREATE OR REPLACE FUNCTION calcular_idade_trigger(data_nascimento DATE) RETURN NUMBER IS
BEGIN
    RETURN TRUNC(MONTHS_BETWEEN(SYSDATE, data_nascimento) / 12);
END calcular_idade_trigger;



CREATE OR REPLACE TRIGGER idade_passageiro_trigger
BEFORE INSERT ON PASSAGEIRO_TB
FOR EACH ROW
DECLARE
    v_idade NUMBER;
    v_autorizacao_viagem VARCHAR2(3);
BEGIN
    -- Calcula a idade do novo passageiro
    v_idade := calcular_idade_trigger(:new.DATA_NASCIMENTO);

    -- Determina o valor de autorizacao_viagem com base na idade
    IF v_idade < 16 THEN
        v_autorizacao_viagem := 'nao';
    ELSIF v_idade >= 16 AND v_idade < 18 THEN
        v_autorizacao_viagem := 'sim';
    ELSE
        v_autorizacao_viagem := NULL; -- Você pode definir outro valor padrão se necessário
    END IF;

    -- Insere na tabela apropriada
    IF v_idade < 18 THEN
        -- Inserir na tabela MENOR_IDADE_TB
        INSERT INTO MENOR_IDADE_TB (PK_CPF, NOME, SEXO, DATA_NASCIMENTO, ENDERECO_PAX, TELEFONES, EMAIL, autorizacao_viagem)
        VALUES (:new.PK_CPF, :new.NOME, :new.SEXO, :new.DATA_NASCIMENTO, :new.ENDERECO_PAX, :new.TELEFONES, :new.EMAIL, v_autorizacao_viagem);
    ELSE
        -- Inserir na tabela MAIOR_IDADE_TB
        INSERT INTO MAIOR_IDADE_TB (PK_CPF, NOME, SEXO, DATA_NASCIMENTO, ENDERECO_PAX, TELEFONES, EMAIL)
        VALUES (:new.PK_CPF, :new.NOME, :new.SEXO, :new.DATA_NASCIMENTO, :new.ENDERECO_PAX, :new.TELEFONES, :new.EMAIL);
    END IF;
END;
/


INSERT INTO PASSAGEIRO_TB(PK_CPF, NOME, SEXO, DATA_NASCIMENTO, ENDERECO_PAX, TELEFONES, EMAIL)
VALUES('12345678989','MARCOSO','M',TO_DATE('14/01/2008','DD/MM/YYYY'),TP_ENDERECO('BRASIL','123','BAHIA','SALVADOR','123 RUA'),
    TP_FONES(TP_FONE('55','71','983439843'),TP_FONE('55','89','948343888')),'MARCOS@GMAIL.COM');


SELECT T.CALCULAR_IDADE() FROM MENOR_IDADE_TB T;

SELECT * FROM MENOR_IDADE_TB;


CREATE OR REPLACE PROCEDURE MoveRecordsToMaiorIdade AS
    CURSOR menor_cursor IS
        SELECT *
        FROM MENOR_IDADE_TB;

    v_idade NUMBER;
BEGIN
    -- Loop through the cursor to process each record in MENOR_IDADE_TB
    FOR menor_rec IN menor_cursor LOOP
        -- Calculate age using the calcular_idade_trigger function
        v_idade := calcular_idade_trigger(menor_rec.DATA_NASCIMENTO);

        -- Check if the age is 18 years or older
        IF v_idade >= 18 THEN
            -- Insert the record into MAIOR_IDADE_TB
            INSERT INTO MAIOR_IDADE_TB (
                PK_CPF,
                NOME,
                SEXO,
                DATA_NASCIMENTO,
                ENDERECO_PAX,
                TELEFONES,
                EMAIL
            ) VALUES (
                menor_rec.PK_CPF,
                menor_rec.NOME,
                menor_rec.SEXO,
                menor_rec.DATA_NASCIMENTO,
                menor_rec.ENDERECO_PAX,
                menor_rec.TELEFONES,
                menor_rec.EMAIL
            );

            -- Delete the record from MENOR_IDADE_TB
            DELETE FROM MENOR_IDADE_TB
            WHERE PK_CPF = menor_rec.PK_CPF; -- Assuming PK_CPF is the primary key
        END IF;
    END LOOP;

    -- Commit the transaction to apply changes
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        -- Handle exceptions as needed
        ROLLBACK;
        RAISE;
END MoveRecordsToMaiorIdade;
/
    
EXEC MoveRecordsToMaiorIdade();



CREATE OR REPLACE PROCEDURE UpdateAutorizacaoViagem AS
BEGIN
    -- Update AUTORIZACAO_VIAGEM to 'SIM' for passengers aged 16 years or older
    UPDATE MENOR_IDADE_TB
    SET AUTORIZACAO_VIAGEM = 'SIM'
    WHERE calcular_idade_trigger(DATA_NASCIMENTO) >= 16;
    
    -- Commit the transaction to apply changes
    COMMIT;
    
    -- Display a success message
    DBMS_OUTPUT.PUT_LINE('Autorizacao Viagem updated successfully.');
EXCEPTION
    WHEN OTHERS THEN
        -- Handle exceptions (e.g., rollback transaction, log error)
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error updating Autorizacao Viagem: ' || SQLERRM);
        RAISE;
END UpdateAutorizacaoViagem;

DELETE FROM PASSAGEIRO_TB WHERE PK_CPF = '12345678912';

SELECT * FROM MENOR_IDADE_TB;

UPDATE MENOR_IDADE_TB T
SET T.DATA_NASCIMENTO = TO_DATE('14/01/2008','DD/MM/YYYY')
WHERE T.PK_CPF = '12345678912';

EXEC UPDATEAUTORIZACAOVIAGEM();


--------

--PASSAGEM
CREATE TYPE PASSAGEM_TP AS OBJECT(    
    pk_numero_passagem INTEGER,
    valor_passagem NUMBER(38,2),
    data_ida DATE,
    data_chegada DATE
);


--TIPO Compra

CREATE TYPE RELAC_COMPRA_TP AS OBJECT(

    LOCALIZADOR INTEGER,
    PASSAGEIRO_ID VARCHAR2(11),
    PASSAGEM_ID INTEGER,
    DATA_COMPRA DATE
);



CREATE TABLE PASSAGEM OF PASSAGEM_TP(    
    CONSTRAINT numero_passagem_pkey PRIMARY KEY(pk_numero_passagem)
);

--DROP TABLE RELAC_COMPRA_TB;

CREATE TABLE RELAC_COMPRA_TB OF RELAC_COMPRA_TP(

CONSTRAINT RELAC_COMPRA_PK PRIMARY KEY (PASSAGEM_ID),
CONSTRAINT passageiro_cpf_fkey FOREIGN KEY(PASSAGEIRO_ID) REFERENCES PASSAGEIRO_TB(PK_CPF),
CONSTRAINT PASSAGEM_ID_FKEY FOREIGN KEY(PASSAGEM_ID) REFERENCES PASSAGEM(PK_NUMERO_PASSAGEM)
);

INSERT INTO PASSAGEM (pk_numero_passagem,valor_passagem,data_ida,data_chegada)
VALUES(8,
504.23,
TO_DATE('14/06/2012', 'DD/MM/YYYY'), 
TO_DATE('15/06/2012', 'DD/MM/YYYY')
);


SELECT * FROM PASSAGEM;
DROP TRIGGER CheckLocalizadorConstraint;

CREATE OR REPLACE TRIGGER CheckLocalizadorConstraint
BEFORE INSERT ON RELAC_COMPRA_TB
FOR EACH ROW
DECLARE
    v_count_menor_idade_na NUMBER;
    v_total_passengers_in_localizador NUMBER;
BEGIN
    -- Count the number of passengers with AUTORIZACAO_VIAGEM = 'NAO' in the same LOCALIZADOR
    SELECT COUNT(*)
    INTO v_count_menor_idade_na
    FROM RELAC_COMPRA_TB r
    JOIN MENOR_IDADE_TB m ON r.PASSAGEIRO_ID = m.PK_CPF
    WHERE r.LOCALIZADOR = :NEW.LOCALIZADOR
      AND m.AUTORIZACAO_VIAGEM = 'nao';

    -- Count the total number of passengers in the same LOCALIZADOR
    SELECT COUNT(*)
    INTO v_total_passengers_in_localizador
    FROM RELAC_COMPRA_TB
    WHERE LOCALIZADOR = :NEW.LOCALIZADOR;

    -- Check if there are only passengers with AUTORIZACAO_VIAGEM = 'NAO' in the LOCALIZADOR
    IF v_count_menor_idade_na = v_total_passengers_in_localizador THEN
        RAISE_APPLICATION_ERROR(-20001, 'Cannot have only passengers from MENOR_IDADE_TP with AUTORIZACAO_VIAGEM = ''NAO'' in a LOCALIZADOR.');
    END IF;
END;
/

INSERT INTO PASSAGEIRO_TB(PK_CPF, NOME, SEXO, DATA_NASCIMENTO, ENDERECO_PAX, TELEFONES, EMAIL)
VALUES('11122233344','Julia','F',TO_DATE('14/01/2008','DD/MM/YYYY'),TP_ENDERECO('BRASIL','123','BAHIA','SALVADOR','123 RUA'),
    TP_FONES(TP_FONE('55','71','983439843'),TP_FONE('55','89','948343888')),'julia@GMAIL.COM');

INSERT INTO PASSAGEIRO_TB(PK_CPF, NOME, SEXO, DATA_NASCIMENTO, ENDERECO_PAX, TELEFONES, EMAIL)
VALUES('11122223344','Juliana','F',TO_DATE('14/01/2015','DD/MM/YYYY'),TP_ENDERECO('BRASIL','123','BAHIA','SALVADOR','123 RUA'),
    TP_FONES(TP_FONE('55','71','983439843'),TP_FONE('55','89','948343888')),'julia@GMAIL.COM');


INSERT INTO PASSAGEIRO_TB(PK_CPF, NOME, SEXO, DATA_NASCIMENTO, ENDERECO_PAX, TELEFONES, EMAIL)
VALUES('11122223534','Anne','F',TO_DATE('14/01/2015','DD/MM/YYYY'),TP_ENDERECO('BRASIL','123','BAHIA','SALVADOR','123 RUA'),
    TP_FONES(TP_FONE('55','71','983439843'),TP_FONE('55','89','948343888')),'julia@GMAIL.COM');

SELECT * FROM MENOR_IDADE_TB;

SELECT * FROM MAIOR_IDADE_TB;

INSERT INTO RELAC_COMPRA_TB (LOCALIZADOR,PASSAGEIRO_ID,PASSAGEM_ID,DATA_COMPRA)
VALUES(2,'11122223534',4,SYSDATE);

--DELETE FROM RELAC_COMPRA_TB;
SELECT * FROM relac_compra_tb;
