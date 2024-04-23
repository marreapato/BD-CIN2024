

CREATE OR REPLACE PROCEDURE MoveRecordsToMaiorIdade AS
    CURSOR menor_cursor IS
        SELECT *
        FROM MENOR_IDADE_TB;

    v_idade NUMBER;
BEGIN

    FOR menor_rec IN menor_cursor LOOP

        v_idade := calcular_idade_trigger(menor_rec.DATA_NASCIMENTO);

        IF v_idade >= 18 THEN

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


            DELETE FROM MENOR_IDADE_TB
            WHERE PK_CPF = menor_rec.PK_CPF; 
        END IF;
    END LOOP;


    COMMIT;
END MoveRecordsToMaiorIdade;
/

CREATE OR REPLACE PROCEDURE UpdateAcompanhamentoViagem AS
BEGIN
  
    UPDATE MENOR_IDADE_TB
    SET ACOMPANHAMENTO_ESPECIAL = 'nao'
    WHERE calcular_idade_trigger(DATA_NASCIMENTO) >= 16;
    

    COMMIT;
    

    DBMS_OUTPUT.PUT_LINE('Acompanhamento Viagem updated successfully.');
END UpdateAcompanhamentoViagem;
