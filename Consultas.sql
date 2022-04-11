-- Consultas

-- Selecionar salario do funcionario com turno de Tarde
SELECT F.SALARIO FROM FUNCIONARIO F
WHERE F.TURNO_DE_TRABALHO = 'Tarde';

-- Selecionar o nome do atendente que gerou a passagem de 10:00 
SELECT p.nome FROM pessoa p, agendamento a, passagem pa, atendente at
WHERE p.cpf = at.cpf_atendente
AND at.cpf_atendente = a.cpf_atendente_agendamento
AND id_agendamento = id_passagem
AND HORARIO_PASSAGEM = '10:00';

-- Selecionar o nome do cliente que gerou a passagem de 10:00 
SELECT p.nome FROM pessoa p, agendamento a, passagem pa, cliente c
WHERE p.cpf = c.cpf_cliente
AND c.cpf_cliente = a.cpf_cliente_agendamento
AND a.id_agendamento = pa.id_passagem
AND pa.HORARIO_PASSAGEM = '11:30';

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

-- Procedimento para aumentar o salário dos funcionários
CREATE OR REPLACE PROCEDURE aumento_salario 
(turno IN funcionario.turno_de_trabalho%TYPE) IS
BEGIN
    CASE turno
    WHEN 'Noite' THEN
        UPDATE funcionario
        SET salario = 10000
        WHERE turno_de_trabalho = 'Noite';
    WHEN 'Tarde' THEN
        UPDATE funcionario
        SET salario = 6000
        WHERE turno_de_trabalho = 'Tarde';
    WHEN 'Manhã' THEN
        UPDATE funcionario
        SET salario = 4000
        WHERE turno_de_trabalho = 'Manhã';
    END CASE;
END;
