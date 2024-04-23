-- Inserting sample data into ESTADIA table
--DELETE FROM ESTADIA;
-- Stay 1
INSERT INTO ESTADIA VALUES (
    1,                     -- pk_cod_estadia
    350.00,                -- valor_estadia
    TO_DATE('2024-05-01', 'YYYY-MM-DD'),  -- data_check_in (check-in date)
    TO_DATE('2024-05-05', 'YYYY-MM-DD'),  -- data_check_out (check-out date)
    tp_nt_ref_relac(       -- reservas (list of passenger-ticket references)
        tp_ref_relac(
            (SELECT REF(p) FROM PASSAGEIRO_TB p WHERE p.PK_CPF = '12345678901'),  -- passageiros (passenger reference)
            (SELECT REF(pa) FROM PASSAGEM pa WHERE pa.pk_localizador_passagem = 1)     -- passagem (ticket reference)
        ),
        tp_ref_relac(
            (SELECT REF(p) FROM PASSAGEIRO_TB p WHERE p.PK_CPF = '23456789012'),  -- passageiros (passenger reference)
            (SELECT REF(pa) FROM PASSAGEM pa WHERE pa.pk_localizador_passagem = 2)     -- passagem (ticket reference)
        )
    )
);

-- Stay 2
INSERT INTO ESTADIA VALUES (
    2,                     -- pk_cod_estadia
    280.50,                -- valor_estadia
    TO_DATE('2024-05-02', 'YYYY-MM-DD'),  -- data_check_in (check-in date)
    TO_DATE('2024-05-04', 'YYYY-MM-DD'),  -- data_check_out (check-out date)
    tp_nt_ref_relac(       -- reservas (list of passenger-ticket references)
        tp_ref_relac(
            (SELECT REF(p) FROM PASSAGEIRO_TB p WHERE p.PK_CPF = '34567890123'),  -- passageiros (passenger reference)
            (SELECT REF(pa) FROM PASSAGEM pa WHERE pa.pk_localizador_passagem = 3)     -- passagem (ticket reference)
        )
    )
);

-- Stay 3
INSERT INTO ESTADIA VALUES (
    3,                     -- pk_cod_estadia
    420.75,                -- valor_estadia
    TO_DATE('2024-05-03', 'YYYY-MM-DD'),  -- data_check_in (check-in date)
    TO_DATE('2024-05-07', 'YYYY-MM-DD'),  -- data_check_out (check-out date)
    tp_nt_ref_relac(       -- reservas (list of passenger-ticket references)
        tp_ref_relac(
            (SELECT REF(p) FROM PASSAGEIRO_TB p WHERE p.PK_CPF = '45678901234'),  -- passageiros (passenger reference)
            (SELECT REF(pa) FROM PASSAGEM pa WHERE pa.pk_localizador_passagem = 4)     -- passagem (ticket reference)
        ),
        tp_ref_relac(
            (SELECT REF(p) FROM PASSAGEIRO_TB p WHERE p.PK_CPF = '56789012345'),  -- passageiros (passenger reference)
            (SELECT REF(pa) FROM PASSAGEM pa WHERE pa.pk_localizador_passagem = 5)     -- passagem (ticket reference)
        )
    )
);

-- Stay 4
INSERT INTO ESTADIA VALUES (
    4,                     -- pk_cod_estadia
    320.00,                -- valor_estadia
    TO_DATE('2024-05-04', 'YYYY-MM-DD'),  -- data_check_in (check-in date)
    TO_DATE('2024-05-06', 'YYYY-MM-DD'),  -- data_check_out (check-out date)
    tp_nt_ref_relac(       -- reservas (list of passenger-ticket references)
        tp_ref_relac(
            (SELECT REF(p) FROM PASSAGEIRO_TB p WHERE p.PK_CPF = '67890123456'),  -- passageiros (passenger reference)
            (SELECT REF(pa) FROM PASSAGEM pa WHERE pa.pk_localizador_passagem = 6)     -- passagem (ticket reference)
        )
    )
);

-- Stay 5
INSERT INTO ESTADIA VALUES (
    5,                     -- pk_cod_estadia
    390.25,                -- valor_estadia
    TO_DATE('2024-05-05', 'YYYY-MM-DD'),  -- data_check_in (check-in date)
    TO_DATE('2024-05-08', 'YYYY-MM-DD'),  -- data_check_out (check-out date)
    tp_nt_ref_relac(       -- reservas (list of passenger-ticket references)
        tp_ref_relac(
            (SELECT REF(p) FROM PASSAGEIRO_TB p WHERE p.PK_CPF = '78901234567'),  -- passageiros (passenger reference)
            (SELECT REF(pa) FROM PASSAGEM pa WHERE pa.pk_localizador_passagem = 7)     -- passagem (ticket reference)
        ),
        tp_ref_relac(
            (SELECT REF(p) FROM PASSAGEIRO_TB p WHERE p.PK_CPF = '89012345678'),  -- passageiros (passenger reference)
            (SELECT REF(pa) FROM PASSAGEM pa WHERE pa.pk_localizador_passagem = 8)     -- passagem (ticket reference)
        )
    )
);
