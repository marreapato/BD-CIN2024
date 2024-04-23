

--  1
INSERT INTO PASSAGEIRO_TB VALUES (
    '12345678901',       -- CPF
    'João Silva',        -- Nome
    'M',                 -- Sexo
    TO_DATE('1990-05-15', 'YYYY-MM-DD'),  -- Data de Nascimento
    TP_ENDERECO('Brasil', '12345-678', 'São Paulo', 'São Paulo', 'Rua A, 123'),  -- Endereço
    TP_FONES(TP_FONE('55', '11', '91234-5678'), TP_FONE('55', '11', '98765-4321')),  -- Telefones
    'joao.silva@gmail.com'  -- Email
);

--  2
INSERT INTO PASSAGEIRO_TB VALUES (
    '23456789012',       -- CPF
    'Maria Santos',      -- Nome
    'F',                 -- Sexo
    TO_DATE('1985-03-20', 'YYYY-MM-DD'),  -- Data de Nascimento
    TP_ENDERECO('Brasil', '54321-876', 'Rio de Janeiro', 'Rio de Janeiro', 'Av. B, 456'),  -- Endereço
    TP_FONES(TP_FONE('55', '21', '99876-5432')),  -- Telefones
    'maria.santos@yahoo.com'  -- Email
);

--  3
INSERT INTO PASSAGEIRO_TB VALUES (
    '34567890123',       -- CPF
    'Pedro Oliveira',    -- Nome
    'M',                 -- Sexo
    TO_DATE('1988-09-10', 'YYYY-MM-DD'),  -- Data de Nascimento
    TP_ENDERECO('Brasil', '98765-432', 'Belo Horizonte', 'Minas Gerais', 'Rua C, 789'),  -- Endereço
    TP_FONES(TP_FONE('55', '31', '97654-3210')),  -- Telefones
    'pedro.oliveira@outlook.com'  -- Email
);

--  4
INSERT INTO PASSAGEIRO_TB VALUES (
    '45678901234',       -- CPF
    'Ana Costa',         -- Nome
    'F',                 -- Sexo
    TO_DATE('1993-12-05', 'YYYY-MM-DD'),  -- Data de Nascimento
    TP_ENDERECO('Brasil', '67890-123', 'Salvador', 'Bahia', 'Rua D, 890'),  -- Endereço
    TP_FONES(TP_FONE('55', '71', '96543-2109')),  -- Telefones
    'ana.costa@gmail.com'  -- Email
);

--  5
INSERT INTO PASSAGEIRO_TB VALUES (
    '56789012345',       -- CPF
    'Luiz Pereira',      -- Nome
    'M',                 -- Sexo
    TO_DATE('1980-06-30', 'YYYY-MM-DD'),  -- Data de Nascimento
    TP_ENDERECO('Brasil', '01234-567', 'Porto Alegre', 'Rio Grande do Sul', 'Av. E, 234'),  -- Endereço
    TP_FONES(TP_FONE('55', '51', '98765-4321'), TP_FONE('55', '51', '99887-6543')),  -- Telefones
    'luiz.pereira@outlook.com'  -- Email
);

--  6
INSERT INTO PASSAGEIRO_TB VALUES (
    '67890123456',       -- CPF
    'Carla Souza',       -- Nome
    'F',                 -- Sexo
    TO_DATE('2006-04-12', 'YYYY-MM-DD'),  -- Data de Nascimento
    TP_ENDERECO('Brasil', '34567-890', 'Curitiba', 'Paraná', 'Rua F, 345'),  -- Endereço
    TP_FONES(TP_FONE('55', '41', '98765-4321')),  -- Telefones
    'carla.souza@gmail.com'  -- Email
);

--  7
INSERT INTO PASSAGEIRO_TB VALUES (
    '78901234567',       -- CPF
    'Fernando Almeida',  -- Nome
    'M',                 -- Sexo
    TO_DATE('2007-07-25', 'YYYY-MM-DD'),  -- Data de Nascimento
    TP_ENDERECO('Brasil', '45678-901', 'Recife', 'Pernambuco', 'Av. G, 456'),  -- Endereço
    TP_FONES(TP_FONE('55', '81', '97654-3210'), TP_FONE('55', '81', '99887-6543')),  -- Telefones
    'fernando.almeida@yahoo.com'  -- Email
);

--  8
INSERT INTO PASSAGEIRO_TB VALUES (
    '89012345678',       -- CPF
    'Lúcia Ramos',       -- Nome
    'F',                 -- Sexo
    TO_DATE('2005-11-08', 'YYYY-MM-DD'),  -- Data de Nascimento
    TP_ENDERECO('Brasil', '56789-012', 'Fortaleza', 'Ceará', 'Rua H, 567'),  -- Endereço
    TP_FONES(TP_FONE('55', '85', '96543-2109')),  -- Telefones
    'lucia.ramos@outlook.com'  -- Email
);

--  9
INSERT INTO PASSAGEIRO_TB VALUES (
    '90123456789',       -- CPF
    'Ricardo Martins',   -- Nome
    'M',                 -- Sexo
    TO_DATE('2008-02-18', 'YYYY-MM-DD'),  -- Data de Nascimento
    TP_ENDERECO('Brasil', '67890-123', 'Florianópolis', 'Santa Catarina', 'Av. I, 678'),  -- Endereço
    TP_FONES(TP_FONE('55', '48', '91234-5678')),  -- Telefones
    'ricardo.martins@gmail.com'  -- Email
);

--  10
INSERT INTO PASSAGEIRO_TB VALUES (
    '01234567890',       -- CPF
    'Beatriz Mendes',    -- Nome
    'F',                 -- Sexo
    TO_DATE('2005-09-20', 'YYYY-MM-DD'),  -- Data de Nascimento
    TP_ENDERECO('Brasil', '01234-567', 'Porto Alegre', 'Rio Grande do Sul', 'Av. E, 234'),  -- Endereço
    TP_FONES(TP_FONE('55', '62', '99876-5432')),  -- Telefones
    'beatriz.mendes@yahoo.com'  -- Email
);

--  11
INSERT INTO PASSAGEIRO_TB VALUES (
    '12345678922',       -- CPF
    'Eduardo Ferreira',  -- Nome
    'M',                 -- Sexo
    TO_DATE('2010-03-12', 'YYYY-MM-DD'),  -- Data de Nascimento
    TP_ENDERECO('Brasil', '12345-678', 'São Paulo', 'São Paulo', 'Av. K, 123'),  -- Endereço
    TP_FONES(TP_FONE('55', '11', '98765-4321')),  -- Telefones
    'eduardo.ferreira@gmail.com'  -- Email
);

--  12
INSERT INTO PASSAGEIRO_TB VALUES (
    '23456289012',       -- CPF
    'Sônia Rodrigues',   -- Nome
    'F',                 -- Sexo
    TO_DATE('2010-07-05', 'YYYY-MM-DD'),  -- Data de Nascimento
    TP_ENDERECO('Brasil', '54321-876', 'Rio de Janeiro', 'Rio de Janeiro', 'Rua L, 456'),  -- Endereço
    TP_FONES(TP_FONE('55', '21', '99887-6543')),  -- Telefones
    'sonia.rodrigues@yahoo.com'  -- Email
);
