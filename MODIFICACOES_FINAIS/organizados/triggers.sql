


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
-- Cria um gatilho para impor a restrição de idade na inserção de passageiros
CREATE OR REPLACE TRIGGER check_passenger_age_trigger
BEFORE INSERT ON RELAC_COMPRA_TB
FOR EACH ROW
DECLARE
    v_passenger_age INTEGER;
    v_count_adult INTEGER;
BEGIN
    -- Recupera a data de nascimento (DATA_NASCIMENTO) do passageiro sendo inserido
    SELECT calcular_idade_trigger(DATA_NASCIMENTO)
    INTO v_passenger_age
    FROM PASSAGEIRO_TB
    WHERE PK_CPF = :new.PASSAGEIRO_ID;

    -- Verifica se a idade do passageiro sendo inserido é menor que 16
    IF v_passenger_age < 16 THEN
        -- Conta o número de passageiros adultos (>16) na mesma reserva (LOCALIZADOR)
        SELECT COUNT(*)
        INTO v_count_adult
        FROM RELAC_COMPRA_TB rc
        JOIN PASSAGEIRO_TB p ON rc.PASSAGEIRO_ID = p.PK_CPF
        WHERE rc.LOCALIZADOR = :new.LOCALIZADOR
          AND calcular_idade_trigger(p.DATA_NASCIMENTO) > 16;

        -- Se nenhum passageiro adulto (>16) for encontrado na mesma reserva, gera um erro
        IF v_count_adult = 0 THEN
            -- Gera um erro com mensagem personalizada se a restrição de idade for violada
            RAISE_APPLICATION_ERROR(-20001, 'Pelo menos um passageiro deve ser maior de 16 anos.');
        END IF;
    END IF;
END;
/
