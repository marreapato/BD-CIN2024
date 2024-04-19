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
--SELECT * FROM VOO;--consertando problema
--alter session set ddl_lock_timeout = 20;
--DROP TABLE VOO;
--commit;
--rollback;


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

INSERT INTO MENOR_IDADE_TB (PK_CPF,NOME,SEXO,DATA_NASCIMENTO,ENDERECO_PAX,TELEFONES,EMAIL,AUTORIZACAO_VIAGEM)
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
    'carlos@gmail.com',
    'SIM');
    
SELECT * FROM MENOR_IDADE_TB;

SELECT * FROM TABLE(SELECT M.TELEFONES FROM MENOR_IDADE_TB M
WHERE NOME='CARLOS'
);
