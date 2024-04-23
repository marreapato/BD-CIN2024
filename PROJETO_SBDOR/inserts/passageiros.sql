-- Inserting first 5 rows of sample data into PASSAGEIRO_TB

-- Row 1
INSERT INTO PASSAGEIRO_TB VALUES (
    '12345678901',       -- CPF (Brazilian ID number)
    'João Silva',        -- Nome (Name)
    'M',                 -- Sexo (Gender: M for male, F for female)
    TO_DATE('1990-05-15', 'YYYY-MM-DD'),  -- Data de Nascimento (Date of Birth)
    TP_ENDERECO('Brasil', '12345-678', 'São Paulo', 'São Paulo', 'Rua A, 123'),  -- Endereço (Address)
    TP_FONES(TP_FONE('55', '11', '91234-5678'), TP_FONE('55', '11', '98765-4321')),  -- Telefones (Phone numbers)
    'joao.silva@gmail.com'  -- Email
);

-- Row 2
INSERT INTO PASSAGEIRO_TB VALUES (
    '23456789012',       -- CPF
    'Maria Santos',      -- Nome
    'F',                 -- Sexo
    TO_DATE('1985-03-20', 'YYYY-MM-DD'),  -- Data de Nascimento
    TP_ENDERECO('Brasil', '54321-876', 'Rio de Janeiro', 'Rio de Janeiro', 'Av. B, 456'),  -- Endereço
    TP_FONES(TP_FONE('55', '21', '99876-5432')),  -- Telefones
    'maria.santos@yahoo.com'  -- Email
);

-- Row 3
INSERT INTO PASSAGEIRO_TB VALUES (
    '34567890123',       -- CPF
    'Pedro Oliveira',    -- Nome
    'M',                 -- Sexo
    TO_DATE('1988-09-10', 'YYYY-MM-DD'),  -- Data de Nascimento
    TP_ENDERECO('Brasil', '98765-432', 'Belo Horizonte', 'Minas Gerais', 'Rua C, 789'),  -- Endereço
    TP_FONES(TP_FONE('55', '31', '97654-3210')),  -- Telefones
    'pedro.oliveira@outlook.com'  -- Email
);

-- Row 4
INSERT INTO PASSAGEIRO_TB VALUES (
    '45678901234',       -- CPF
    'Ana Costa',         -- Nome
    'F',                 -- Sexo
    TO_DATE('1993-12-05', 'YYYY-MM-DD'),  -- Data de Nascimento
    TP_ENDERECO('Brasil', '67890-123', 'Salvador', 'Bahia', 'Rua D, 890'),  -- Endereço
    TP_FONES(TP_FONE('55', '71', '96543-2109')),  -- Telefones
    'ana.costa@gmail.com'  -- Email
);

-- Row 5
INSERT INTO PASSAGEIRO_TB VALUES (
    '56789012345',       -- CPF
    'Luiz Pereira',      -- Nome
    'M',                 -- Sexo
    TO_DATE('1980-06-30', 'YYYY-MM-DD'),  -- Data de Nascimento
    TP_ENDERECO('Brasil', '01234-567', 'Porto Alegre', 'Rio Grande do Sul', 'Av. E, 234'),  -- Endereço
    TP_FONES(TP_FONE('55', '51', '98765-4321'), TP_FONE('55', '51', '99887-6543')),  -- Telefones
    'luiz.pereira@outlook.com'  -- Email
);

