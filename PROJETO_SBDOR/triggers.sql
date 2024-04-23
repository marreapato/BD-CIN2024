CREATE OR REPLACE TRIGGER idade_passageiro_trigger
BEFORE INSERT ON PASSAGEIRO_TB
FOR EACH ROW
DECLARE
    v_idade NUMBER;
    v_acompanhamento_especial VARCHAR2(3);
BEGIN
    -- Calcula a idade do novo passageiro
    v_idade := calcular_idade_trigger(:new.DATA_NASCIMENTO);

    
    IF v_idade < 16 THEN
        v_acompanhamento_especial := 'sim';
    ELSIF v_idade >= 16 AND v_idade < 18 THEN
        v_acompanhamento_especial := 'nao';
    ELSE
        v_acompanhamento_especial := NULL; -- Você pode definir outro valor padrão se necessário
    END IF;

    -- Insere na tabela apropriada
    IF v_idade < 18 THEN
        -- Inserir na tabela MENOR_IDADE_TB
        INSERT INTO MENOR_IDADE_TB (PK_CPF, NOME, SEXO, DATA_NASCIMENTO, ENDERECO_PAX, TELEFONES, EMAIL, acompanhamento_especial)
        VALUES (:new.PK_CPF, :new.NOME, :new.SEXO, :new.DATA_NASCIMENTO, :new.ENDERECO_PAX, :new.TELEFONES, :new.EMAIL, v_acompanhamento_especial);
    ELSE
        -- Inserir na tabela MAIOR_IDADE_TB
        INSERT INTO MAIOR_IDADE_TB (PK_CPF, NOME, SEXO, DATA_NASCIMENTO, ENDERECO_PAX, TELEFONES, EMAIL)
        VALUES (:new.PK_CPF, :new.NOME, :new.SEXO, :new.DATA_NASCIMENTO, :new.ENDERECO_PAX, :new.TELEFONES, :new.EMAIL);
    END IF;
END;
/
