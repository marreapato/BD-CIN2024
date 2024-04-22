CREATE OR REPLACE PROCEDURE MoveRecordsToMaiorIdade AS
    CURSOR menor_cursor IS
        SELECT *
        FROM MENOR_IDADE_TB;

    v_idade NUMBER;
BEGIN
    -- Percorre o cursor para processar cada registro na MENOR_IDADE_TB
    FOR menor_rec IN menor_cursor LOOP
        -- Calcula a idade usando a função calcular_idade_trigger
        v_idade := calcular_idade_trigger(menor_rec.DATA_NASCIMENTO);

        -- Verifica se a idade é maior ou igual a 18 anos
        IF v_idade >= 18 THEN
            -- Insere o registro na MAIOR_IDADE_TB
            INSERT INTO MAIOR_IDADE_TB (
                PK_CPF,
                NOME,
                SEXO,
                DATA_NASCIMENTO,
                ENDERECO_PAX,
                TELEFONES,
                EMAIL
            ) VALUES (
                menor_rec.PK_CPF,
                menor_rec.NOME,
                menor_rec.SEXO,
                menor_rec.DATA_NASCIMENTO,
                menor_rec.ENDERECO_PAX,
                menor_rec.TELEFONES,
                menor_rec.EMAIL
            );

            -- Exclui o registro da MENOR_IDADE_TB
            DELETE FROM MENOR_IDADE_TB
            WHERE PK_CPF = menor_rec.PK_CPF; -- Assumindo que PK_CPF é a chave primária
        END IF;
    END LOOP;
    -- Confirma a transação para aplicar as mudanças
    COMMIT;
END MoveRecordsToMaiorIdade;
/

    
EXEC MoveRecordsToMaiorIdade();

----------



CREATE OR REPLACE PROCEDURE UpdateAutorizacaoViagem AS
BEGIN
    -- Update AUTORIZACAO_VIAGEM to 'SIM' for passengers aged 16 years or older
    UPDATE MENOR_IDADE_TB
    SET AUTORIZACAO_VIAGEM = 'SIM'
    WHERE calcular_idade_trigger(DATA_NASCIMENTO) >= 16;
    
    -- Commit the transaction to apply changes
    COMMIT;
    
    -- Display a success message
    DBMS_OUTPUT.PUT_LINE('Autorizacao Viagem updated successfully.');
EXCEPTION
    WHEN OTHERS THEN
        -- Handle exceptions (e.g., rollback transaction, log error)
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error updating Autorizacao Viagem: ' || SQLERRM);
        RAISE;
END UpdateAutorizacaoViagem;

EXEC UPDATEAUTORIZACAOVIAGEM();
------



