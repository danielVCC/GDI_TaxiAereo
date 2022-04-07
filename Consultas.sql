-- 1. ALTER TABLE (OK)
-- 2. CREATE INDEX (OK)
-- 3. INSERT INTO (OK)
-- 4. UPDATE (OK)
-- 5. DELETE (OK)
-- 6. SELECT FROM WHERE (OK)
-- 7. BETWEEN (OK)
-- 8. IN (OK)
-- 9. LIKE (OK)
-- 10. IS NULL / IS NOT NULL (OK)
-- 11. INNER JOIN (OK)
-- 12. MAX (OK)
-- 13. MIN (OK)
-- 14. AVG (OK)
-- 15. COUNT (OK)
-- 16. LEFT / RIGHT / FULL OUTER JOIN (OK)
-- 17. Subconsulta com operador relacional (OK)
-- 18. Subconsulta com IN (OK)
-- 19. Subconsulta com ANY (OK)
-- 20. SUBCONSULTA COM ALL (OK)
-- 21. ORDER BY (OK)
-- 22. GROUP BY (OK)
-- 23. HAVING (OK)
-- 24. UNION ou INTERSECT ou MINUS (OK)
-- 25. CREATE VIEW (OK)
-- 26. GRANT / REVOKE

-- Selecionar funcionario com turno de Tarde
SELECT F.SALARIO FROM FUNCIONARIO F
WHERE F.TURNO_DE_TRABALHO = 'Tarde';

-- Selecionar os funcionarios com salarios entre 1000 e 2501N
SELECT F.CPF_FUNCIONARIO FROM FUNCIONARIO F
WHERE F.SALARIO BETWEEN 1000 AND 2501;

-- Selecionar o nome/bairro/cidade das pessoas que moram em recife ou olinda
SELECT P.NOME, P.BAIRRO, P.CIDADE FROM PESSOA P
WHERE P.CIDADE IN ('Recife', 'Olinda');

-- Selecionar o nome dos funcionarios que trabalham de tarde
SELECT P.NOME
FROM PESSOA P, FUNCIONARIO F
WHERE P.CPF = F.CPF_FUNCIONARIO
AND F.TURNO_DE_TRABALHO LIKE 'Tarde';

--Selecionar o cpf e as horas de voo dos pilotos sem co_pilotos
SELECT P.CPF_PILOTO, P.HORAS_DE_VOO 
FROM PILOTO P
WHERE P.CPF_COPILOTO IS NULL;

--Selecionar o id do hangar e o cod da aeronave 
SELECT H.ID_HANGAR, E.COD_AERONAVE
FROM HANGAR H INNER JOIN ESTACIONA E
ON E.COD_HANGAR = H.ID_HANGAR
ORDER BY H.ID_HANGAR;

-- Selecionar o nome e as horas de voo do piloto que tem mais horas 
SELECT P.NOME, PI.HORAS_DE_VOO
FROM PESSOA P, PILOTO PI
WHERE P.CPF = PI.CPF_PILOTO
AND HORAS_DE_VOO IN (SELECT MAX (HORAS_DE_VOO)
FROM PILOTO);

SELECT * FROM ATENDENTE A
WHERE A.CLIENTES_ATENDIDOS IN (SELECT MIN (CLIENTES_ATENDIDOS)
FROM ATENDENTE);

SELECT AVG (CLIENTES_ATENDIDOS) FROM ATENDENTE;

SELECT COUNT (*) FROM PILOTO P
WHERE P.HORAS_DE_VOO > 10000;

SELECT P.NOME, F.CPF_FUNCIONARIO FROM FUNCIONARIO F
LEFT OUTER JOIN PESSOA P
ON F.CPF_FUNCIONARIO = P.CPF;

SELECT F.SALARIO, P.NOME
FROM FUNCIONARIO F, PESSOA P
WHERE F.CPF_FUNCIONARIO = P.CPF
ORDER BY F.SALARIO DESC;

SELECT F.TURNO_DE_TRABALHO, COUNT(*)
FROM FUNCIONARIO F
GROUP BY TURNO_DE_TRABALHO;

SELECT F.TURNO_DE_TRABALHO, COUNT(*)
FROM FUNCIONARIO F
WHERE SALARIO BETWEEN 1000 AND 2500 
GROUP BY F.TURNO_DE_TRABALHO
HAVING COUNT(*) > 1;

--Deletar as passagens que tem destino em Salvador
DELETE FROM passagem
WHERE destino = 'Salvador';

/* Pega o nome/cpf/salario de todos os pilotos que possuem salario maior que
todos os atendentes */
SELECT P.NOME, P.CPF, F.SALARIO
FROM PESSOA P, FUNCIONARIO F, PILOTO PI
WHERE PI.CPF_PILOTO = P.CPF
AND PI.CPF_PILOTO = F.CPF_FUNCIONARIO
AND F.SALARIO > ALL (SELECT SALARIO FROM FUNCIONARIO, ATENDENTE
WHERE CPF_FUNCIONARIO = CPF_ATENDENTE);

/* Pega o nome/cpf/salario de todos os atendentes que possuem salario maior que
algum piloto */ 
SELECT P.NOME, P.CPF, F.SALARIO
FROM PESSOA P, FUNCIONARIO F, ATENDENTE A
WHERE A.CPF_ATENDENTE = P.CPF
AND A.CPF_ATENDENTE = F.CPF_FUNCIONARIO
AND F.SALARIO > ANY (SELECT SALARIO FROM FUNCIONARIO, PILOTO
WHERE CPF_FUNCIONARIO = CPF_PILOTO);

-- Cria uma tabela com o nome de todos os locais de origem e destino
SELECT ORIGEM FROM PASSAGEM 
UNION
SELECT DESTINO FROM PASSAGEM;

CREATE VIEW altas_milhas AS
SELECT P.NOME, P.ESTADO, T.DDD, T.NUMERO, C.NUMERO_DE_MILHAS
FROM PESSOA P, TELEFONE T, CARTAO_DE_MILHAS C
WHERE P.CPF = T.CPF_PESSOA_TELEFONE
AND P.CPF = CPF_CLIENTE_CM
AND C.NUMERO_DE_MILHAS > 2500;

/*
1. USO DE RECORD
2. USO DE ESTRUTURA DE DADOS DO TIPO TABLE
3. BLOCO ANÔNIMO
4. CREATE PROCEDURE                         (OK)
5. CREATE FUNCTION                          (OK)
6. %TYPE                                    (OK)
7. %ROWTYPE
8. IF ELSIF
9. CASE WHEN
10. LOOP EXIT WHEN                          (OK)
11. WHILE LOOP
12. FOR IN LOOP
13. SELECT … INTO                           (OK)
14. CURSOR (OPEN, FETCH e CLOSE)            (OK)
15. EXCEPTION WHEN                          (OK)                      
16. USO DE PARÂMETROS (IN, OUT ou IN OUT)   (OK) 
17. CREATE OR REPLACE PACKAGE
18. CREATE OR REPLACE PACKAGE BODY
19. CREATE OR REPLACE TRIGGER (COMANDO)
20. CREATE OR REPLACE TRIGGER (LINHA)       (OK)
*/

-- Recuperando as informações de copiloto/piloto
CREATE OR REPLACE PROCEDURE info_piloto_copiloto IS
v_cpf_pilot piloto.cpf_piloto%TYPE;
v_cpf_cop piloto.cpf_copiloto%TYPE;

CURSOR c_pilot IS
SELECT cpf_piloto, cpf_copiloto
FROM piloto p;

BEGIN
    OPEN c_pilot;
    LOOP
        FETCH c_pilot INTO v_cpf_pilot, v_cpf_cop;
        EXIT WHEN c_pilot%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Piloto: '|| ' ' ||
        TO_CHAR(v_cpf_pilot) || ' ' || TO_CHAR(v_cpf_cop));
    END LOOP;
    CLOSE c_pilot;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        INSERT INTO log_table (info) VALUES ('Piloto sem Copiloto');
END;

-- Trigger (linha) para verificação de valor dos salarios inseridos em funcionario
CREATE OR REPLACE TRIGGER salario_valor
BEFORE UPDATE ON funcionario 
FOR EACH ROW
BEGIN
    IF :NEW.salario < 0 THEN
        RAISE_APPLICATION_ERROR(-20101, 'SALARIO do funcionario não pode ser menor que 0');
    END IF;
END;
