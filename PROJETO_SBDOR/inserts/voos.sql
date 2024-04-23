-- Flight 1
INSERT INTO VOO_TABLE VALUES (
    1,               -- pk_localizador_voo
    'GRU',           -- origem (São Paulo - Guarulhos International Airport)
    'GIG',           -- destino (Rio de Janeiro - Galeão International Airport)
    TO_TIMESTAMP('2024-04-25 12:00:00', 'YYYY-MM-DD HH24:MI:SS'),  -- hora_embarque (boarding time)
    TO_TIMESTAMP('2024-04-25 13:30:00', 'YYYY-MM-DD HH24:MI:SS'),  -- hora_desembarque (arrival time)
    tp_nt_ref_relac(  -- compras (list of passenger-ticket references)
        tp_ref_relac(
            (SELECT REF(p) FROM PASSAGEIRO_TB p WHERE p.PK_CPF = '12345678901'),  -- passageiros (passenger reference)
            (SELECT REF(pa) FROM PASSAGEM pa WHERE pa.pk_numero_passagem = 1)   -- passagem (ticket reference)
        )
    )
);

-- Flight 2
INSERT INTO VOO_TABLE VALUES (
    2,               -- pk_localizador_voo
    'CGH',           -- origem (São Paulo - Congonhas Airport)
    'BSB',           -- destino (Brasília International Airport)
    TO_TIMESTAMP('2024-04-26 10:30:00', 'YYYY-MM-DD HH24:MI:SS'),  -- hora_embarque (boarding time)
    TO_TIMESTAMP('2024-04-26 12:15:00', 'YYYY-MM-DD HH24:MI:SS'),  -- hora_desembarque (arrival time)
    tp_nt_ref_relac(  -- compras (list of passenger-ticket references)
        tp_ref_relac(
            (SELECT REF(p) FROM PASSAGEIRO_TB p WHERE p.PK_CPF = '23456789012'),  -- passageiros (passenger reference)
            (SELECT REF(pa) FROM PASSAGEM pa WHERE pa.pk_numero_passagem = 2)   -- passagem (ticket reference)
        )
    )
);

-- Flight 3
INSERT INTO VOO_TABLE VALUES (
    3,               -- pk_localizador_voo
    'BSB',           -- origem (Brasília International Airport)
    'CNF',           -- destino (Belo Horizonte - Confins International Airport)
    TO_TIMESTAMP('2024-04-27 14:00:00', 'YYYY-MM-DD HH24:MI:SS'),  -- hora_embarque (boarding time)
    TO_TIMESTAMP('2024-04-27 15:45:00', 'YYYY-MM-DD HH24:MI:SS'),  -- hora_desembarque (arrival time)
    tp_nt_ref_relac(  -- compras (list of passenger-ticket references)
        tp_ref_relac(
            (SELECT REF(p) FROM PASSAGEIRO_TB p WHERE p.PK_CPF = '34567890123'),  -- passageiros (passenger reference)
            (SELECT REF(pa) FROM PASSAGEM pa WHERE pa.pk_numero_passagem = 3)   -- passagem (ticket reference)
        )
    )
);

-- Flight 4
INSERT INTO VOO_TABLE VALUES (
    4,               -- pk_localizador_voo
    'GIG',           -- origem (Rio de Janeiro - Galeão International Airport)
    'SSA',           -- destino (Salvador International Airport)
    TO_TIMESTAMP('2024-04-28 09:45:00', 'YYYY-MM-DD HH24:MI:SS'),  -- hora_embarque (boarding time)
    TO_TIMESTAMP('2024-04-28 11:30:00', 'YYYY-MM-DD HH24:MI:SS'),  -- hora_desembarque (arrival time)
    tp_nt_ref_relac(  -- compras (list of passenger-ticket references)
        tp_ref_relac(
            (SELECT REF(p) FROM PASSAGEIRO_TB p WHERE p.PK_CPF = '45678901234'),  -- passageiros (passenger reference)
            (SELECT REF(pa) FROM PASSAGEM pa WHERE pa.pk_numero_passagem = 4)   -- passagem (ticket reference)
        )
    )
);

-- Flight 5
INSERT INTO VOO_TABLE VALUES (
    5,               -- pk_localizador_voo
    'CNF',           -- origem (Belo Horizonte - Confins International Airport)
    'REC',           -- destino (Recife International Airport)
    TO_TIMESTAMP('2024-04-29 13:20:00', 'YYYY-MM-DD HH24:MI:SS'),  -- hora_embarque (boarding time)
    TO_TIMESTAMP('2024-04-29 16:10:00', 'YYYY-MM-DD HH24:MI:SS'),  -- hora_desembarque (arrival time)
    tp_nt_ref_relac(  -- compras (list of passenger-ticket references)
        tp_ref_relac(
            (SELECT REF(p) FROM PASSAGEIRO_TB p WHERE p.PK_CPF = '56789012345'),  -- passageiros (passenger reference)
            (SELECT REF(pa) FROM PASSAGEM pa WHERE pa.pk_numero_passagem = 5)   -- passagem (ticket reference)
        ),tp_ref_relac(
            (SELECT REF(p) FROM PASSAGEIRO_TB p WHERE p.PK_CPF = '67890123456'),  -- passageiros (passenger reference)
            (SELECT REF(pa) FROM PASSAGEM pa WHERE pa.pk_numero_passagem = 6)   -- passagem (ticket reference)
        )
    )
);
-- Inserting next 5 rows of sample data into VOO_TABLE

-- Flight 6
INSERT INTO VOO_TABLE VALUES (
    6,               -- pk_localizador_voo
    'SSA',           -- origem (Salvador International Airport)
    'REC',           -- destino (Recife International Airport)
    TO_TIMESTAMP('2024-05-01 11:30:00', 'YYYY-MM-DD HH24:MI:SS'),  -- hora_embarque (boarding time)
    TO_TIMESTAMP('2024-05-01 14:00:00', 'YYYY-MM-DD HH24:MI:SS'),  -- hora_desembarque (arrival time)
    tp_nt_ref_relac(  -- compras (list of passenger-ticket references)
      
    )
);

-- Flight 7
INSERT INTO VOO_TABLE VALUES (
    7,               -- pk_localizador_voo
    'REC',           -- origem (Recife International Airport)
    'FOR',           -- destino (Fortaleza International Airport)
    TO_TIMESTAMP('2024-05-02 08:45:00', 'YYYY-MM-DD HH24:MI:SS'),  -- hora_embarque (boarding time)
    TO_TIMESTAMP('2024-05-02 11:15:00', 'YYYY-MM-DD HH24:MI:SS'),  -- hora_desembarque (arrival time)
    tp_nt_ref_relac(  -- compras (list of passenger-ticket references)
        tp_ref_relac(
            (SELECT REF(p) FROM PASSAGEIRO_TB p WHERE p.PK_CPF = '78901234567'),  -- passageiros (passenger reference)
            (SELECT REF(pa) FROM PASSAGEM pa WHERE pa.pk_numero_passagem = 7)   -- passagem (ticket reference)
        )
    )
);

-- Flight 8
INSERT INTO VOO_TABLE VALUES (
    8,               -- pk_localizador_voo
    'CNF',           -- origem (Belo Horizonte - Confins International Airport)
    'POA',           -- destino (Porto Alegre International Airport)
    TO_TIMESTAMP('2024-05-03 14:20:00', 'YYYY-MM-DD HH24:MI:SS'),  -- hora_embarque (boarding time)
    TO_TIMESTAMP('2024-05-03 16:30:00', 'YYYY-MM-DD HH24:MI:SS'),  -- hora_desembarque (arrival time)
    tp_nt_ref_relac(  -- compras (list of passenger-ticket references)
        tp_ref_relac(
            (SELECT REF(p) FROM PASSAGEIRO_TB p WHERE p.PK_CPF = '89012345678'),  -- passageiros (passenger reference)
            (SELECT REF(pa) FROM PASSAGEM pa WHERE pa.pk_numero_passagem = 8)   -- passagem (ticket reference)
        )
    )
);

-- Flight 9
INSERT INTO VOO_TABLE VALUES (
    9,               -- pk_localizador_voo
    'POA',           -- origem (Porto Alegre International Airport)
    'FLN',           -- destino (Florianópolis International Airport)
    TO_TIMESTAMP('2024-05-04 10:00:00', 'YYYY-MM-DD HH24:MI:SS'),  -- hora_embarque (boarding time)
    TO_TIMESTAMP('2024-05-04 11:30:00', 'YYYY-MM-DD HH24:MI:SS'),  -- hora_desembarque (arrival time)
    tp_nt_ref_relac(  -- compras (list of passenger-ticket references)
        tp_ref_relac(
            (SELECT REF(p) FROM PASSAGEIRO_TB p WHERE p.PK_CPF = '90123456789'),  -- passageiros (passenger reference)
            (SELECT REF(pa) FROM PASSAGEM pa WHERE pa.pk_numero_passagem = 9)   -- passagem (ticket reference)
        )
    )
);

-- Flight 10
INSERT INTO VOO_TABLE VALUES (
    10,              -- pk_localizador_voo
    'BSB',           -- origem (Brasília International Airport)
    'POA',           -- destino (Porto Alegre International Airport)
    TO_TIMESTAMP('2024-05-05 12:45:00', 'YYYY-MM-DD HH24:MI:SS'),  -- hora_embarque (boarding time)
    TO_TIMESTAMP('2024-05-05 15:00:00', 'YYYY-MM-DD HH24:MI:SS'),  -- hora_desembarque (arrival time)
    tp_nt_ref_relac(  -- compras (list of passenger-ticket references)
        tp_ref_relac(
            (SELECT REF(p) FROM PASSAGEIRO_TB p WHERE p.PK_CPF = '01234567890'),  -- passageiros (passenger reference)
            (SELECT REF(pa) FROM PASSAGEM pa WHERE pa.pk_numero_passagem = 10)   -- passagem (ticket reference)
        )
    )
);
