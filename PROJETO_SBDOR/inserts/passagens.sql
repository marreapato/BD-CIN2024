-- Inserting first 5 rows of sample data into PASSAGEM table

-- Row 1
INSERT INTO PASSAGEM VALUES (
    1,                 -- pk_numero_passagem
    250.00,            -- valor_passagem
    TO_DATE('2024-04-25', 'YYYY-MM-DD'),  -- data_ida (departure date)
    TO_DATE('2024-04-25', 'YYYY-MM-DD')   -- data_chegada (arrival date, same as departure)
);

-- Row 2
INSERT INTO PASSAGEM VALUES (
    2,                 -- pk_numero_passagem
    180.50,            -- valor_passagem
    TO_DATE('2024-04-26', 'YYYY-MM-DD'),  -- data_ida (departure date)
    TO_DATE('2024-04-26', 'YYYY-MM-DD')   -- data_chegada (arrival date, same as departure)
);

-- Row 3
INSERT INTO PASSAGEM VALUES (
    3,                 -- pk_numero_passagem
    300.75,            -- valor_passagem
    TO_DATE('2024-04-27', 'YYYY-MM-DD'),  -- data_ida (departure date)
    TO_DATE('2024-04-28', 'YYYY-MM-DD')   -- data_chegada (arrival date, one day after departure)
);

-- Row 4
INSERT INTO PASSAGEM VALUES (
    4,                 -- pk_numero_passagem
    210.00,            -- valor_passagem
    TO_DATE('2024-04-29', 'YYYY-MM-DD'),  -- data_ida (departure date)
    TO_DATE('2024-04-29', 'YYYY-MM-DD')   -- data_chegada (arrival date, same as departure)
);

-- Row 5
INSERT INTO PASSAGEM VALUES (
    5,                 -- pk_numero_passagem
    350.25,            -- valor_passagem
    TO_DATE('2024-04-30', 'YYYY-MM-DD'),  -- data_ida (departure date)
    TO_DATE('2024-04-30', 'YYYY-MM-DD')   -- data_chegada (arrival date, same as departure)
);

-- Inserting next 5 rows of sample data into PASSAGEM table

-- Row 6
INSERT INTO PASSAGEM VALUES (
    6,                 -- pk_numero_passagem
    190.00,            -- valor_passagem
    TO_DATE('2024-05-01', 'YYYY-MM-DD'),  -- data_ida (departure date)
    TO_DATE('2024-05-01', 'YYYY-MM-DD')   -- data_chegada (arrival date, same as departure)
);

-- Row 7
INSERT INTO PASSAGEM VALUES (
    7,                 -- pk_numero_passagem
    275.50,            -- valor_passagem
    TO_DATE('2024-05-02', 'YYYY-MM-DD'),  -- data_ida (departure date)
    TO_DATE('2024-05-02', 'YYYY-MM-DD')   -- data_chegada (arrival date, same as departure)
);

-- Row 8
INSERT INTO PASSAGEM VALUES (
    8,                 -- pk_numero_passagem
    320.75,            -- valor_passagem
    TO_DATE('2024-05-03', 'YYYY-MM-DD'),  -- data_ida (departure date)
    TO_DATE('2024-05-04', 'YYYY-MM-DD')   -- data_chegada (arrival date, one day after departure)
);

-- Row 9
INSERT INTO PASSAGEM VALUES (
    9,                 -- pk_numero_passagem
    230.00,            -- valor_passagem
    TO_DATE('2024-05-05', 'YYYY-MM-DD'),  -- data_ida (departure date)
    TO_DATE('2024-05-05', 'YYYY-MM-DD')   -- data_chegada (arrival date, same as departure)
);

-- Row 10
INSERT INTO PASSAGEM VALUES (
    10,                -- pk_numero_passagem
    380.25,            -- valor_passagem
    TO_DATE('2024-05-06', 'YYYY-MM-DD'),  -- data_ida (departure date)
    TO_DATE('2024-05-06', 'YYYY-MM-DD')   -- data_chegada (arrival date, same as departure)
);

-- Row 4
INSERT INTO PASSAGEM VALUES (
    11,                 -- pk_numero_passagem
    210.00,            -- valor_passagem
    TO_DATE('2024-04-29', 'YYYY-MM-DD'),  -- data_ida (departure date)
    TO_DATE('2024-04-29', 'YYYY-MM-DD')   -- data_chegada (arrival date, same as departure)
);

-- Row 5
INSERT INTO PASSAGEM VALUES (
    12,                 -- pk_numero_passagem
    350.25,            -- valor_passagem
    TO_DATE('2024-04-30', 'YYYY-MM-DD'),  -- data_ida (departure date)
    TO_DATE('2024-04-30', 'YYYY-MM-DD')   -- data_chegada (arrival date, same as departure)
);
