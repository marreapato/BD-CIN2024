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
