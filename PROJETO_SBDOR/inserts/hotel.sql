
-- Hotel 1
INSERT INTO HOTEL VALUES (
    1,                            -- pkid_hotel
    'Hotel Copacabana Palace',    -- nome 
    tp_endereco(                  -- endereco_hotel
        'Brasil',                 -- pais
        '22070-010',              -- cep
        'Rio de Janeiro',         -- estado
        'Rio de Janeiro',         -- cidade
        'Avenida Atlântica, 1702' -- complemento
    ),
    tp_nt_ref_registrada(         -- registros
        tp_ref_registrada(
            (SELECT REF(e) FROM ESTADIA e WHERE e.pk_cod_estadia = 1)  -- estadias
        ),
        tp_ref_registrada(
            (SELECT REF(e) FROM ESTADIA e WHERE e.pk_cod_estadia = 2)  -- estadias
        )
    )
);

-- Hotel 2
INSERT INTO HOTEL VALUES (
    2,                            -- pkid_hotel
    'Hotel Fasano São Paulo',     -- nome 
    tp_endereco(                  -- endereco_hotel 
        'Brasil',                 -- pais 
        '01451-000',              -- cep 
        'São Paulo',              -- estado 
        'São Paulo',              -- cidade
        'Rua Vittorio Fasano, 88' -- complemento
    ),
    tp_nt_ref_registrada(         -- registros
        tp_ref_registrada(
            (SELECT REF(e) FROM ESTADIA e WHERE e.pk_cod_estadia = 3)  -- estadias
        ),
        tp_ref_registrada(
            (SELECT REF(e) FROM ESTADIA e WHERE e.pk_cod_estadia = 4)  -- estadias
        )
    )
);

-- Hotel 3
INSERT INTO HOTEL VALUES (
    3,                            -- pkid_hotel
    'Hotel Sheraton Recife',      -- nome 
    tp_endereco(                  -- endereco_hotel 
        'Brasil',                 -- pais 
        '51021-390',              -- cep 
        'Pernambuco',             -- estado 
        'Recife',                 -- cidade 
        'Avenida Boa Viagem, 1466'-- complemento 
    ),
    tp_nt_ref_registrada(         -- registros 
        tp_ref_registrada(
            (SELECT REF(e) FROM ESTADIA e WHERE e.pk_cod_estadia = 5)  -- estadias 
        )
    )
);
