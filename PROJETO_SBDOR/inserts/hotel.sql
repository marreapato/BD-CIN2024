-- Inserting sample data into HOTEL table

-- Hotel 1
INSERT INTO HOTEL VALUES (
    1,                            -- pkid_hotel
    'Hotel Copacabana Palace',    -- nome (hotel name)
    tp_endereco(                  -- endereco_hotel (hotel address)
        'Brasil',                 -- pais (country)
        '22070-010',              -- cep (postal code)
        'Rio de Janeiro',         -- estado (state)
        'Rio de Janeiro',         -- cidade (city)
        'Avenida Atlântica, 1702' -- complemento (address details)
    ),
    tp_nt_ref_registrada(         -- registros (list of registered stay references)
        tp_ref_registrada(
            (SELECT REF(e) FROM ESTADIA e WHERE e.pk_cod_estadia = 1)  -- estadias (stay reference)
        ),
        tp_ref_registrada(
            (SELECT REF(e) FROM ESTADIA e WHERE e.pk_cod_estadia = 2)  -- estadias (stay reference)
        )
    )
);

-- Hotel 2
INSERT INTO HOTEL VALUES (
    2,                            -- pkid_hotel
    'Hotel Fasano São Paulo',     -- nome (hotel name)
    tp_endereco(                  -- endereco_hotel (hotel address)
        'Brasil',                 -- pais (country)
        '01451-000',              -- cep (postal code)
        'São Paulo',              -- estado (state)
        'São Paulo',              -- cidade (city)
        'Rua Vittorio Fasano, 88' -- complemento (address details)
    ),
    tp_nt_ref_registrada(         -- registros (list of registered stay references)
        tp_ref_registrada(
            (SELECT REF(e) FROM ESTADIA e WHERE e.pk_cod_estadia = 3)  -- estadias (stay reference)
        ),
        tp_ref_registrada(
            (SELECT REF(e) FROM ESTADIA e WHERE e.pk_cod_estadia = 4)  -- estadias (stay reference)
        )
    )
);

-- Hotel 3
INSERT INTO HOTEL VALUES (
    3,                            -- pkid_hotel
    'Hotel Sheraton Recife',      -- nome (hotel name)
    tp_endereco(                  -- endereco_hotel (hotel address)
        'Brasil',                 -- pais (country)
        '51021-390',              -- cep (postal code)
        'Pernambuco',             -- estado (state)
        'Recife',                 -- cidade (city)
        'Avenida Boa Viagem, 1466'-- complemento (address details)
    ),
    tp_nt_ref_registrada(         -- registros (list of registered stay references)
        tp_ref_registrada(
            (SELECT REF(e) FROM ESTADIA e WHERE e.pk_cod_estadia = 5)  -- estadias (stay reference)
        )
    )
);
