--  1
INSERT INTO VOO_TABLE VALUES (
    1,               -- pk_localizador_voo
    'GRU',           -- origem 
    'GIG',           -- destino 
    TO_TIMESTAMP('12:00:00', 'HH24:MI:SS'),  -- hora_embarque 
    TO_TIMESTAMP('13:30:00', 'HH24:MI:SS'),  -- hora_desembarque 
    tp_nt_ref_relac(  -- compras
        tp_ref_relac(
            (SELECT REF(p) FROM PASSAGEIRO_TB p WHERE p.PK_CPF = '12345678901'),  -- passageiros 
            (SELECT REF(pa) FROM PASSAGEM pa WHERE pa.pk_localizador_passagem = 1)   -- passagem
        )
    )
);

--  2
INSERT INTO VOO_TABLE VALUES (
    2,               -- pk_localizador_voo
    'CGH',           -- origem 
    'BSB',           -- destino 
    TO_TIMESTAMP('10:30:00', 'HH24:MI:SS'),  -- hora_embarque
    TO_TIMESTAMP('12:15:00', 'HH24:MI:SS'),  -- hora_desembarque 
    tp_nt_ref_relac(  -- compras
        tp_ref_relac(
            (SELECT REF(p) FROM PASSAGEIRO_TB p WHERE p.PK_CPF = '23456789012'),  -- passageiros
            (SELECT REF(pa) FROM PASSAGEM pa WHERE pa.pk_localizador_passagem = 2)   -- passagem
        )
    )
);

--  3
INSERT INTO VOO_TABLE VALUES (
    3,               -- pk_localizador_voo
    'BSB',           -- origem
    'CNF',           -- destino
    TO_TIMESTAMP('14:00:00', 'HH24:MI:SS'),  -- hora_embarque
    TO_TIMESTAMP('15:45:00', 'HH24:MI:SS'),  -- hora_desembarque
    tp_nt_ref_relac(  -- compras
        tp_ref_relac(
            (SELECT REF(p) FROM PASSAGEIRO_TB p WHERE p.PK_CPF = '34567890123'),  -- passageiros
            (SELECT REF(pa) FROM PASSAGEM pa WHERE pa.pk_localizador_passagem = 3)   -- passagem
        )
    )
);

--  4
INSERT INTO VOO_TABLE VALUES (
    4,               -- pk_localizador_voo
    'GIG',           -- origem
    'SSA',           -- destino
    TO_TIMESTAMP('09:45:00', 'HH24:MI:SS'),  -- hora_embarque
    TO_TIMESTAMP('11:30:00', 'HH24:MI:SS'),  -- hora_desembarque
    tp_nt_ref_relac(  -- compras
        tp_ref_relac(
            (SELECT REF(p) FROM PASSAGEIRO_TB p WHERE p.PK_CPF = '45678901234'),  -- passageiros
            (SELECT REF(pa) FROM PASSAGEM pa WHERE pa.pk_localizador_passagem = 4)   -- passagem
        )
    )
);

--  5
INSERT INTO VOO_TABLE VALUES (
    5,               -- pk_localizador_voo
    'CNF',           -- origem
    'REC',           -- destino
    TO_TIMESTAMP('13:20:00', 'HH24:MI:SS'),  -- hora_embarque
    TO_TIMESTAMP('16:10:00', 'HH24:MI:SS'),  -- hora_desembarque
    tp_nt_ref_relac(  -- compras
        tp_ref_relac(
            (SELECT REF(p) FROM PASSAGEIRO_TB p WHERE p.PK_CPF = '56789012345'),  -- passageiros
            (SELECT REF(pa) FROM PASSAGEM pa WHERE pa.pk_localizador_passagem = 5)   -- passagem
        ),tp_ref_relac(
            (SELECT REF(p) FROM PASSAGEIRO_TB p WHERE p.PK_CPF = '67890123456'),  -- passageiros
            (SELECT REF(pa) FROM PASSAGEM pa WHERE pa.pk_localizador_passagem = 6)   -- passagem
        )
    )
);



INSERT INTO VOO_TABLE VALUES (
    6,               -- pk_localizador_voo
    'SSA',           -- origem
    'REC',           -- destino
    TO_TIMESTAMP('11:30:00', 'HH24:MI:SS'),  -- hora_embarque
    TO_TIMESTAMP('14:00:00', 'HH24:MI:SS'),  -- hora_desembarque
    tp_nt_ref_relac(  -- compras
      
    )
);

--  7
INSERT INTO VOO_TABLE VALUES (
    7,               -- pk_localizador_voo
    'REC',           -- origem
    'FOR',           -- destino
    TO_TIMESTAMP('08:45:00', 'HH24:MI:SS'),  -- hora_embarque
    TO_TIMESTAMP('11:15:00', 'HH24:MI:SS'),  -- hora_desembarque
    tp_nt_ref_relac(  -- compras
        tp_ref_relac(
            (SELECT REF(p) FROM PASSAGEIRO_TB p WHERE p.PK_CPF = '78901234567'),  -- passageiros 
            (SELECT REF(pa) FROM PASSAGEM pa WHERE pa.pk_localizador_passagem = 7)   -- passagem 
        )
    )
);

--  8
INSERT INTO VOO_TABLE VALUES (
    8,               -- pk_localizador_voo
    'CNF',           -- origem
    'POA',           -- destino
    TO_TIMESTAMP('14:20:00', 'HH24:MI:SS'),  -- hora_embarque
    TO_TIMESTAMP('16:30:00', 'HH24:MI:SS'),  -- hora_desembarque 
    tp_nt_ref_relac(  -- compras
        tp_ref_relac(
            (SELECT REF(p) FROM PASSAGEIRO_TB p WHERE p.PK_CPF = '89012345678'),  -- passageiros
            (SELECT REF(pa) FROM PASSAGEM pa WHERE pa.pk_localizador_passagem = 8)   -- passagem
        )
    )
);

--  9
INSERT INTO VOO_TABLE VALUES (
    9,               -- pk_localizador_voo
    'POA',           -- origem
    'FLN',           -- destino
    TO_TIMESTAMP('10:00:00', 'HH24:MI:SS'),  -- hora_embarque
    TO_TIMESTAMP('11:30:00', 'HH24:MI:SS'),  -- hora_desembarque
    tp_nt_ref_relac(  -- compras
        tp_ref_relac(
            (SELECT REF(p) FROM PASSAGEIRO_TB p WHERE p.PK_CPF = '90123456789'),  -- passageiros
            (SELECT REF(pa) FROM PASSAGEM pa WHERE pa.pk_localizador_passagem = 9)   -- passagem
        )
    )
);

--  10
INSERT INTO VOO_TABLE VALUES (
    10,              -- pk_localizador_voo
    'BSB',           -- origem
    'POA',           -- destino
    TO_TIMESTAMP('12:45:00', 'HH24:MI:SS'),  -- hora_embarque
    TO_TIMESTAMP('15:00:00', 'HH24:MI:SS'),  -- hora_desembarque 
    tp_nt_ref_relac(  -- compras 
        tp_ref_relac(
            (SELECT REF(p) FROM PASSAGEIRO_TB p WHERE p.PK_CPF = '01234567890'),  -- passageiros
            (SELECT REF(pa) FROM PASSAGEM pa WHERE pa.pk_localizador_passagem = 10)   -- passagem
        )
    )
);




--  11
INSERT INTO VOO_TABLE VALUES (
    11,              -- pk_localizador_voo
    'SSA',           -- origem
    'CNF',           -- destino
    TO_TIMESTAMP('16:30:00', 'HH24:MI:SS'),  -- hora_embarque
    TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),  -- hora_desembarque
    tp_nt_ref_relac(  -- compras
        tp_ref_relac(
            (SELECT REF(p) FROM PASSAGEIRO_TB p WHERE p.PK_CPF = '12345678922'),  -- passageiros
            (SELECT REF(pa) FROM PASSAGEM pa WHERE pa.pk_localizador_passagem = 11)   -- passagem
        ),
        tp_ref_relac(
            (SELECT REF(p) FROM PASSAGEIRO_TB p WHERE p.PK_CPF = '23456289012'),  -- passageiros
            (SELECT REF(pa) FROM PASSAGEM pa WHERE pa.pk_localizador_passagem = 12)   -- passagem
        )
    )
);
