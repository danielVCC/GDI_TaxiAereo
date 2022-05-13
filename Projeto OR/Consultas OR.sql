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
