-- 1. ALTER TABLE

-- 2. CREATE INDEX
CREATE INDEX INDICE_SAL
ON FUNCIONARIO(SALARIO);

-- 3. INSERT INTO

-- 4. UPDATE

-- 5. DELETE

-- 6. SELECT FROM WHERE
SELECT F.SALARIO FROM FUNCIONARIO F
WHERE F.TURNO_DE_TRABALHO = 'Tarde';

-- 7. BETWEEN
SELECT F.CPF_FUNCIONARIO FROM FUNCIONARIO F
WHERE F.SALARIO BETWEEN 1499 AND 2501;

-- 8. IN
SELECT P.NOME, P.BAIRRO, P.CIDADE FROM PESSOA P
WHERE P.CIDADE IN ('Recife', 'Olinda');


-- 9. LIKE
SELECT P.NOME
FROM PESSOA P, FUNCIONARIO F
WHERE P.CPF = F.CPF_FUNCIONARIO
AND F.TURNO_DE_TRABALHO LIKE 'Tarde';

-- 10. IS NULL / IS NOT NULL
SELECT P.CPF_PILOTO, P.HORAS_DE_VOO FROM PILOTO P
WHERE P.CPF_COPILOTO IS NULL;

-- 11. INNER JOIN
SELECT H.ID_HANGAR, E.COD_AERONAVE
FROM HANGAR H INNER JOIN ESTACIONA E
ON E.COD_HANGAR = H.ID_HANGAR
ORDER BY H.ID_HANGAR;

-- 12. MAX
SELECT P.NOME, PI.HORAS_DE_VOO
FROM PESSOA P, PILOTO PI
WHERE P.CPF = PI.CPF_PILOTO
AND HORAS_DE_VOO IN (SELECT MAX (HORAS_DE_VOO)
FROM PILOTO);

-- 13. MIN
SELECT * FROM ATENDENTE A
WHERE A.CLIENTES_ATENDIDOS IN (SELECT MIN (CLIENTES_ATENDIDOS)
FROM ATENDENTE);

-- 14. AVG
SELECT AVG (CLIENTES_ATENDIDOS) FROM ATENDENTE;

-- 15. COUNT
SELECT COUNT (*) FROM PILOTO P
WHERE P.HORAS_DE_VOO > 10000;

-- 16. LEFT / RIGHT / FULL OUTER JOIN
SELECT P.NOME, F.CPF_FUNCIONARIO FROM FUNCIONARIO F
LEFT OUTER JOIN PESSOA P
ON F.CPF_FUNCIONARIO = P.CPF;

-- 17. Subconsulta com operador relacional

-- 18. Subconsulta com IN

-- 19. Subconsulta com ANY

-- 20. SUBCONSULTA COM ALL

-- 21. ORDER BY
SELECT F.SALARIO, P.NOME
FROM FUNCIONARIO F, PESSOA P
WHERE F.CPF_FUNCIONARIO = P.CPF
ORDER BY F.SALARIO DESC;

-- 22. GROUP BY
SELECT F.TURNO_DE_TRABALHO, COUNT(*)
FROM FUNCIONARIO F
GROUP BY TURNO_DE_TRABALHO;

-- 23. HAVING
SELECT F.TURNO_DE_TRABALHO, COUNT(*)
FROM FUNCIONARIO F
WHERE SALARIO BETWEEN 1000 AND 2500 
GROUP BY F.TURNO_DE_TRABALHO
HAVING COUNT(*) > 1;

-- 24. UNION ou INTERSECT ou MINUS

-- 25. CREATE VIEW

-- 26. GRANT / REVOKE