--Selecionar a hora dos agendamentos atravez da tabela realiza
select deref(a.id_agendamento_realiza).hora as agendamento  
from  tb_realiza a;

--Selecionar a velocidade das aeronaves presentes em modelo_aeronave atravez da tabela aeronave
select deref(a.modelo).velocidade as aeronave  
from  tb_aeronave a;
