CREATE OR REPLACE PROCEDURE MoveRecordsToMaiorIdade AS
    CURSOR menor_cursor IS
        SELECT *
        FROM MENOR_IDADE_TB;

    v_idade NUMBER;
BEGIN
    -- Loop through the cursor to process each record in MENOR_IDADE_TB
    FOR menor_rec IN menor_cursor LOOP
        -- Calculate age using the calcular_idade_trigger function
        v_idade := calcular_idade_trigger(menor_rec.DATA_NASCIMENTO);

        -- Check if the age is 18 years or older
        IF v_idade >= 18 THEN
            -- Insert the record into MAIOR_IDADE_TB
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

            -- Delete the record from MENOR_IDADE_TB
            DELETE FROM MENOR_IDADE_TB
            WHERE PK_CPF = menor_rec.PK_CPF; -- Assuming PK_CPF is the primary key
        END IF;
    END LOOP;

    -- Commit the transaction to apply changes
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        -- Handle exceptions as needed
        ROLLBACK;
        RAISE;
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


