--Selecionar a hora dos agendamentos atravez da tabela realiza
select deref(a.id_agendamento_realiza).hora as agendamento  
from  tb_realiza a;

--Selecionar a velocidade das aeronaves presentes em modelo_aeronave atravez da tabela aeronave
select deref(a.modelo).velocidade as aeronave  
from  tb_aeronave a;

--Selecionar os telefones, o cpf e o salario dos funcionarios que trabalham a noite
SELECT f.telefone, 
f.cpf, 
f.salario
FROM tb_funcionario f 
WHERE turno_de_trabalho = 'Noite';

--Mude a data de agendamento de um cliente expecifico emitido em 08/10/0202 para 12/10/2020.
UPDATE TABLE (SELECT c.data_agendamento 
              FROM tb_agendamento c 
              WHERE c.cpf_cliente_agendamento = (SELECT REF(f) FROM tb_cliente f WHERE f.cpf = '105.210.555.70')) cf
    SET cf.data_agendamento = to_date('12/10/2023', 'dd/mm/yy')
    WHERE cf.data_agendamento = to_date('10/03/2020', 'dd/mm/yy');
