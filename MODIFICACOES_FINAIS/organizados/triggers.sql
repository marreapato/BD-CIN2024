


CREATE OR REPLACE TRIGGER idade_passageiro_trigger
BEFORE INSERT ON PASSAGEIRO_TB
FOR EACH ROW
DECLARE
    v_idade NUMBER;
    v_autorizacao_viagem VARCHAR2(3);
BEGIN
    -- Calcula a idade do novo passageiro
    v_idade := calcular_idade_trigger(:new.DATA_NASCIMENTO);

    -- Determina o valor de autorizacao_viagem com base na idade
    IF v_idade < 16 THEN
        v_autorizacao_viagem := 'nao';
    ELSIF v_idade >= 16 AND v_idade < 18 THEN
        v_autorizacao_viagem := 'sim';
    ELSE
        v_autorizacao_viagem := NULL; -- Você pode definir outro valor padrão se necessário
    END IF;

    -- Insere na tabela apropriada
    IF v_idade < 18 THEN
        -- Inserir na tabela MENOR_IDADE_TB
        INSERT INTO MENOR_IDADE_TB (PK_CPF, NOME, SEXO, DATA_NASCIMENTO, ENDERECO_PAX, TELEFONES, EMAIL, autorizacao_viagem)
        VALUES (:new.PK_CPF, :new.NOME, :new.SEXO, :new.DATA_NASCIMENTO, :new.ENDERECO_PAX, :new.TELEFONES, :new.EMAIL, v_autorizacao_viagem);
    ELSE
        -- Inserir na tabela MAIOR_IDADE_TB
        INSERT INTO MAIOR_IDADE_TB (PK_CPF, NOME, SEXO, DATA_NASCIMENTO, ENDERECO_PAX, TELEFONES, EMAIL)
        VALUES (:new.PK_CPF, :new.NOME, :new.SEXO, :new.DATA_NASCIMENTO, :new.ENDERECO_PAX, :new.TELEFONES, :new.EMAIL);
    END IF;
END;
/


--------

DROP TRIGGER check_passenger_age_trigger;
-- Create a trigger to enforce age constraint on passenger insertion
CREATE OR REPLACE TRIGGER check_passenger_age_trigger
BEFORE INSERT ON RELAC_COMPRA_TB
FOR EACH ROW
DECLARE
    v_passenger_age INTEGER;
    v_count_adult INTEGER;
BEGIN
    -- Retrieve the date of birth (DATA_NASCIMENTO) of the passenger being inserted
    SELECT calcular_idade_trigger(DATA_NASCIMENTO)
    INTO v_passenger_age
    FROM PASSAGEIRO_TB
    WHERE PK_CPF = :new.PASSAGEIRO_ID;

    -- Check if the age of the passenger being inserted is less than 16
    IF v_passenger_age < 16 THEN
        -- Count the number of adult passengers (>16) in the same booking (LOCALIZADOR)
        SELECT COUNT(*)
        INTO v_count_adult
        FROM RELAC_COMPRA_TB rc
        JOIN PASSAGEIRO_TB p ON rc.PASSAGEIRO_ID = p.PK_CPF
        WHERE rc.LOCALIZADOR = :new.LOCALIZADOR
          AND calcular_idade_trigger(p.DATA_NASCIMENTO) > 16;

        -- If no adult passenger (>16) is found in the same booking, raise an error
        IF v_count_adult = 0 THEN
            -- Raise error with custom message if age constraint is violated
            RAISE_APPLICATION_ERROR(-20001, 'At least one passenger must be older than 16 years.');
        END IF;
    END IF;
END;
/
