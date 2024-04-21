INSERT INTO HOTEL (pkid_hotel,nome,endereco_hotel)
VALUES (1,'Hotel ABC',tp_endereco('Brasil','30289-020','São Paulo','São Paulo','123 Main St'));

SELECT * FROM HOTEL;

SELECT H.PKID_HOTEL, H.NOME, H.ENDERECO_HOTEL.CEP, H.ENDERECO_HOTEL.ESTADO FROM HOTEL H;

--voo

INSERT INTO VOO (pk_numero_voo,origem,destino,hora_embarque,hora_desembarque)
VALUES(1,
'GRU',
'BSB',
TO_TIMESTAMP('08:20', 'HH24:,MI'),
TO_TIMESTAMP('11:45','HH24:MI'));


SELECT * FROM VOO;
SELECT ORIGEM,DESTINO,TO_CHAR(hora_embarque,'HH24:MI'),TO_CHAR(hora_desembarque,'HH24:MI') FROM VOO;

INSERT INTO PASSAGEM (pk_numero_passagem,valor_passagem,data_ida,data_chegada)
VALUES(1,
504.23,
TO_DATE('14/06/2012', 'DD/MM/YYYY'), 
TO_DATE('15/06/2012', 'DD/MM/YYYY')
);


SELECT * FROM PASSAGEM;

--

INSERT INTO ESTADIA (pk_cod_estadia,valor_estadia,data_check_in,data_check_out)
VALUES(1,2506.35,TO_DATE('14/06/2012', 'DD/MM/YYYY'),TO_DATE('20/06/2012', 'DD/MM/YYYY'));

SELECT * FROM ESTADIA;

--

INSERT INTO MAIOR_IDADE_TB (pk_cpf,NOME,SEXO,DATA_NASCIMENTO,ENDERECO_PAX,TELEFONES,EMAIL)
VALUES ('11111111111','Maria','F',TO_DATE('20/05/1990', 'DD/MM/YYYY'),
tp_endereco('Brasil', '12345-678', 'São Paulo', 'São Paulo', '456 Oak St'),
tp_fones(
        TP_FONE('55', '11', '987654321'),
        TP_FONE('55', '16', '987624321'),
        TP_FONE('55', '81', '987644321')
    ),
    'maria@gmail.com'                   
);

SELECT * FROM MAIOR_IDADE_TB;

SELECT *
FROM TABLE(SELECT M.TELEFONES
FROM MAIOR_IDADE_TB M
WHERE M.PK_CPF = '11111111111');

SELECT T.PHONE
FROM TABLE(SELECT M.TELEFONES
FROM MAIOR_IDADE_TB M
WHERE M.PK_CPF = '11111111111') T;

SELECT 
    m.pk_cpf AS cpf,
    m.NOME AS nome,
    f.COD_PAIS AS cod_pais,
    f.COD_DDD AS cod_ddd,
    f.PHONE AS phone
FROM 
    MAIOR_IDADE_TB m,
    TABLE(m.TELEFONES) f;
    
--

INSERT INTO PASSAGEIRO_TB (PK_CPF,NOME,SEXO,DATA_NASCIMENTO,ENDERECO_PAX,TELEFONES,EMAIL)
VALUES('12345678901',
'CARLOS',
'M',
TO_DATE('12/09/2015','DD/MM/YYYY'),
tp_endereco('Brasil', '12345-678', 'Salvador', 'Bahia', 'rua da casa'),
tp_fones(
        TP_FONE('55', '71', '987694321'),
        TP_FONE('55', '16', '987624321'),
        TP_FONE('55', '81', '987644321')
    ),
    'carlos@gmail.com'
    );
    
INSERT INTO PASSAGEIRO_TB (PK_CPF,NOME,SEXO,DATA_NASCIMENTO,ENDERECO_PAX,TELEFONES,EMAIL)
VALUES('11113111111',
'MARIA',
'F',
TO_DATE('12/09/2015','DD/MM/YYYY'),
tp_endereco('Brasil', '12345-678', 'Salvador', 'Bahia', 'rua da casa'),
tp_fones(
        TP_FONE('55', '71', '987694321'),
        TP_FONE('55', '16', '987624321'),
        TP_FONE('55', '81', '987644321')
    ),
    'carlos@gmail.com'
    );
    
SELECT * FROM PASSAGEIRO_TB;


SELECT * FROM TABLE(SELECT M.TELEFONES FROM PASSAGEIRO_TB M
WHERE M.NOME='MARIA'
);
----

INSERT INTO REL_REFERESE_TB (COD_PASSAGEM,COD_VOO)
VALUES(3,2);

SELECT * FROM REL_REFERESE_TB;



INSERT INTO REL_REFERESE_TB (COD_PASSAGEM,COD_VOO)
VALUES(3,2);

SELECT * FROM REL_REFERESE_TB;

---

INSERT INTO REL_REGISTRA_TB(HOTEL_ID,ESTADIA_ID)
VALUES(1,1);

SELECT * FROM REL_REGISTRA_TB;

SELECT * FROM HOTEL H, REL_REGISTRA_TB R WHERE R.HOTEL_ID=H.PKID_HOTEL;
SELECT * FROM PASSAGEIRO_TB;
SELECT M.ENDERECO_HOTEL.CIDADE FROM (SELECT * FROM HOTEL H, REL_REGISTRA_TB R WHERE R.HOTEL_ID=H.PKID_HOTEL) M;
----
INSERT INTO RELAC_COMPRA_TB (LOCALIZADOR,PASSAGEIRO_ID,PASSAGEM_ID)
VALUES(3,'12345678901',4);

SELECT * FROM RELAC_COMPRA_TB;
SELECT * FROM RELAC_COMPRA_TB R RIGHT JOIN PASSAGEIRO_TB P ON R.PASSAGEIRO_ID=P.PK_CPF;
SELECT M.ENDERECO_PAX.CIDADE FROM (SELECT * FROM RELAC_COMPRA_TB R RIGHT JOIN PASSAGEIRO_TB P ON R.PASSAGEIRO_ID=P.PK_CPF) M;

----

INSERT INTO REL_RESERVA_TB (ESTADIA_ID,COMPRADOR_PASSAGEM_ID)
VALUES(2,4);

SELECT * FROM REL_RESERVA_TB;

SELECT * FROM REL_RESERVA_TB B INNER JOIN ESTADIA E ON b.estadia_id=e.pk_cod_estadia;

SELECT * FROM REL_RESERVA_TB B RIGHT JOIN ESTADIA E ON b.estadia_id=e.pk_cod_estadia;

SELECT SUM(L.VALOR_ESTADIA) FROM (SELECT * FROM REL_RESERVA_TB B INNER JOIN ESTADIA E ON b.estadia_id=e.pk_cod_estadia) L;
