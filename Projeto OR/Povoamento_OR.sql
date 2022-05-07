--telefone

INSERT INTO tb_telefone (cpf_pessoa_telefone, ddd, numero) VALUES ('111.222.333.44', 81, 989898989);
INSERT INTO tb_telefone (cpf_pessoa_telefone, ddd, numero) VALUES ('011.222.333.23', 81, 987878787);
INSERT INTO tb_telefone (cpf_pessoa_telefone, ddd, numero) VALUES ('555.222.333.44', 21, 976767676);
INSERT INTO tb_telefone (cpf_pessoa_telefone, ddd, numero) VALUES ('333.222.333.23', 88, 998967548);
INSERT INTO tb_telefone (cpf_pessoa_telefone, ddd, numero) VALUES ('444.222.333.56', 81, 998345459);
INSERT INTO tb_telefone (cpf_pessoa_telefone, ddd, numero) VALUES ('222.333.444.57', 81, 998735459);
INSERT INTO tb_telefone (cpf_pessoa_telefone, ddd, numero) VALUES ('105.210.555.70', 81, 979055705);
INSERT INTO tb_telefone (cpf_pessoa_telefone, ddd, numero) VALUES ('777.022.333.88', 81, 998305781);
INSERT INTO tb_telefone (cpf_pessoa_telefone, ddd, numero) VALUES ('888.010.111.31', 11, 999900123);
INSERT INTO tb_telefone (cpf_pessoa_telefone, ddd, numero) VALUES ('999.111.434.95', 82, 988057430);
INSERT INTO tb_telefone (cpf_pessoa_telefone, ddd, numero) VALUES ('855.777.032.75', 91, 979568708);

--funcionario

INSERT INTO tb_funcionario (cpf, turno_de_trabalho,salario) VALUES ('111.222.333.44','Manhã',1200);
INSERT INTO tb_funcionario (cpf, turno_de_trabalho,salario) VALUES ('011.222.333.23','Tarde',1500);
INSERT INTO tb_funcionario (cpf, turno_de_trabalho,salario) VALUES ('555.222.333.44','Noite',1700);
INSERT INTO tb_funcionario (cpf, turno_de_trabalho,salario) VALUES ('333.222.333.23','Tarde',3000);
INSERT INTO tb_funcionario (cpf, turno_de_trabalho,salario) VALUES ('888.010.111.31','Noite',3000);
INSERT INTO tb_funcionario (cpf, turno_de_trabalho,salario) VALUES ('999.111.434.95','Tarde',2100);
INSERT INTO tb_funcionario (cpf, turno_de_trabalho,salario) VALUES ('855.777.032.75','Manhã',2100);

--cliente

INSERT INTO tb_cliente (cpf,data_cadastro) VALUES ('222.333.444.57', to_date('05/07/2020', 'dd/mm/yy'));
INSERT INTO tb_cliente (cpf,data_cadastro) VALUES ('105.210.555.70', to_date('15/12/2015', 'dd/mm/yy'));
INSERT INTO tb_cliente (cpf,data_cadastro) VALUES ('777.022.333.88', to_date('20/10/2018', 'dd/mm/yy'));
INSERT INTO tb_cliente (cpf,data_cadastro) VALUES ('444.222.333.56', to_date('18/11/2019', 'dd/mm/yy'));

--cartao_de_milhas

INSERT INTO tb_lista_cartao_de_milhas (data_de_emissao,numero_de_milhas,cpf_cliente_cm) VALUES (to_date('08/07/2020','dd/mm/yy'),3000,'222.333.444.57');
INSERT INTO tb_lista_cartao_de_milhas (data_de_emissao,numero_de_milhas,cpf_cliente_cm) VALUES (to_date('01/01/2016','dd/mm/yy'),2000,'105.210.555.70');
INSERT INTO tb_lista_cartao_de_milhas (data_de_emissao,numero_de_milhas,cpf_cliente_cm) VALUES (to_date('24/10/2018','dd/mm/yy'),1800,'777.022.333.88');
INSERT INTO tb_lista_cartao_de_milhas (data_de_emissao,numero_de_milhas,cpf_cliente_cm) VALUES (to_date('22/11/2019','dd/mm/yy'),2780,'444.222.333.56');

--atendente

INSERT INTO tb_atendente (cpf,clientes_atendidos) VALUES ('111.222.333.44',574);
INSERT INTO tb_atendente (cpf,clientes_atendidos) VALUES ('011.222.333.23',485);
INSERT INTO tb_atendente (cpf,clientes_atendidos) VALUES ('555.222.333.44',574);

--piloto

INSERT INTO tb_piloto (cpf,cpf_copiloto,horas_de_voo) VALUES('333.222.333.23',null ,15000);
INSERT INTO tb_piloto (cpf,cpf_copiloto,horas_de_voo) VALUES('888.010.111.31',null ,20100);
INSERT INTO tb_piloto (cpf,cpf_copiloto,horas_de_voo) VALUES('999.111.434.95',(SELECT REF(f) FROM tb_piloto f WHERE f.cpf = '333.222.333.23'),7100);
INSERT INTO tb_piloto (cpf,cpf_copiloto,horas_de_voo) VALUES('855.777.032.75',(SELECT REF(f) FROM tb_piloto f WHERE f.cpf = '888.010.111.31'),11500);

--modelo_aeronave

INSERT INTO tb_modelo_aeronave (tipo_aeronave,passageiros,carga, velocidade, categoria_Velociade) VALUES ('Gulfstream G500',50,1000,700, null);
INSERT INTO tb_modelo_aeronave (tipo_aeronave,passageiros,carga, velocidade, categoria_Velociade) VALUES ('Bombardier Global',60,1600,850, null);
INSERT INTO tb_modelo_aeronave (tipo_aeronave,passageiros,carga, velocidade, categoria_Velociade) VALUES ('Embraer E-195',150,2000,800, null );
INSERT INTO tb_modelo_aeronave (tipo_aeronave,passageiros,carga, velocidade, categoria_Velociade) VALUES ('Dassault',15,1000,700, null);
INSERT INTO tb_modelo_aeronave (tipo_aeronave,passageiros,carga, velocidade, categoria_Velociade) VALUES ('Pilatus PC-24',10,500,750, null);
INSERT INTO tb_modelo_aeronave (tipo_aeronave,passageiros,carga, velocidade, categoria_Velociade) VALUES ('Phenom 300',50,30000,850, null);

--aeronave


INSERT INTO tb_aeronave (id_aeronave,modelo) VALUES (00010,(SELECT REF(f) FROM tb_modelo_aeronave f WHERE f.tipo_aeronave = 'Embraer E-195'));
INSERT INTO tb_aeronave (id_aeronave,modelo) VALUES (10022,(SELECT REF(f) FROM tb_modelo_aeronave f WHERE f.tipo_aeronave = 'Gulfstream G500'));
INSERT INTO tb_aeronave (id_aeronave,modelo) VALUES (20333,(SELECT REF(f) FROM tb_modelo_aeronave f WHERE f.tipo_aeronave = 'Bombardier Global'));
INSERT INTO tb_aeronave (id_aeronave,modelo) VALUES (30414,(SELECT REF(f) FROM tb_modelo_aeronave f WHERE f.tipo_aeronave = 'Dassault'));
INSERT INTO tb_aeronave (id_aeronave,modelo) VALUES (30421,(SELECT REF(f) FROM tb_modelo_aeronave f WHERE f.tipo_aeronave = 'Dassault'));
INSERT INTO tb_aeronave (id_aeronave,modelo) VALUES (40525,(SELECT REF(f) FROM tb_modelo_aeronave f WHERE f.tipo_aeronave = 'Pilatus PC-24'));
INSERT INTO tb_aeronave (id_aeronave,modelo) VALUES (51434,(SELECT REF(f) FROM tb_modelo_aeronave f WHERE f.tipo_aeronave = 'Phenom 300'));


--hangar

INSERT INTO tb_hangar (id_hangar,capacidade) VALUES (101,4);
INSERT INTO tb_hangar (id_hangar,capacidade) VALUES (202,7);

--promocao

INSERT INTO tb_promocao (codigo_promocional,data_de_termino,desconto) VALUES (000001,to_date('08/05/2022','dd/mm/yy'),20);
INSERT INTO tb_promocao (codigo_promocional,data_de_termino,desconto) VALUES (220002,to_date('27/08/2022','dd/mm/yy'),50);
INSERT INTO tb_promocao (codigo_promocional,data_de_termino,desconto) VALUES (330011,to_date('30/09/2022','dd/mm/yy'),10);

--agendamento

INSERT INTO tb_agendamento (cpf_cliente_agendamento,cpf_atendente_agendamento,hora,id_agendamento,data_agendamento,milhas_geradas) VALUES ((SELECT REF(f) FROM tb_cliente f WHERE f.cpf = '222.333.444.57'),(SELECT REF(f) FROM tb_atendente f WHERE f.cpf = '111.222.333.44'),'10:43',0091,to_date('25/02/2022','dd/mm/yy'),300);
INSERT INTO tb_agendamento (cpf_cliente_agendamento,cpf_atendente_agendamento,hora,id_agendamento,data_agendamento,milhas_geradas) VALUES ((SELECT REF(f) FROM tb_cliente f WHERE f.cpf = '105.210.555.70'),(SELECT REF(f) FROM tb_atendente f WHERE f.cpf = '011.222.333.23'),'13:35',1235,to_date('10/03/2022','dd/mm/yy'),400);
INSERT INTO tb_agendamento (cpf_cliente_agendamento,cpf_atendente_agendamento,hora,id_agendamento,data_agendamento,milhas_geradas) VALUES ((SELECT REF(f) FROM tb_cliente f WHERE f.cpf = '777.022.333.88'),(SELECT REF(f) FROM tb_atendente f WHERE f.cpf = '011.222.333.23'),'16:20',1515,to_date('18/03/2022','dd/mm/yy'),600);
INSERT INTO tb_agendamento (cpf_cliente_agendamento,cpf_atendente_agendamento,hora,id_agendamento,data_agendamento,milhas_geradas) VALUES ((SELECT REF(f) FROM tb_cliente f WHERE f.cpf = '444.222.333.56'),(SELECT REF(f) FROM tb_atendente f WHERE f.cpf = '555.222.333.44'),'19:50',4545,to_date('31/03/2022','dd/mm/yy'),1300);

--passagem

INSERT INTO tb_passagem (id_passagem,origem,destino,data_de_ida,horario_passagem,data_de_volta) VALUES (0091,'Recife','Salvador',to_date('09/04/2022','dd/mm/yy'),'10:00',to_date('12/04/2022','dd/mm/yy'));
INSERT INTO tb_passagem (id_passagem,origem,destino,data_de_ida,horario_passagem,data_de_volta) VALUES (1235,'Recife','Curitiba',to_date('10/05/2022','dd/mm/yy'),'15:00',to_date('15/06/2022','dd/mm/yy'));
INSERT INTO tb_passagem (id_passagem,origem,destino,data_de_ida,horario_passagem,data_de_volta) VALUES (1515,'Recife','Brasilia',to_date('02/06/2022','dd/mm/yy'),'09:30',to_date('04/10/2022','dd/mm/yy'));
INSERT INTO tb_passagem (id_passagem,origem,destino,data_de_ida,horario_passagem,data_de_volta) VALUES (4545,'Recife','Brasilia',to_date('02/06/2022','dd/mm/yy'),'11:30',to_date('16/09/2022','dd/mm/yy'));

--realiza

INSERT INTO tb_realiza (cpf_cliente_realiza_promo,codigo_promocional_realiza,id_agendamento_realiza) VALUES ('222.333.444.57',(SELECT REF(f) FROM tb_promocao f WHERE f.codigo_promocional = 000001),(SELECT REF(f) FROM tb_agendamento f WHERE f.id_agendamento = 0091));
INSERT INTO tb_realiza (cpf_cliente_realiza_promo,codigo_promocional_realiza,id_agendamento_realiza) VALUES ('105.210.555.70',(SELECT REF(f) FROM tb_promocao f WHERE f.codigo_promocional = 330011),(SELECT REF(f) FROM tb_agendamento f WHERE f.id_agendamento = 1235));
INSERT INTO tb_realiza (cpf_cliente_realiza_promo,codigo_promocional_realiza,id_agendamento_realiza) VALUES ('777.022.333.88',(SELECT REF(f) FROM tb_promocao f WHERE f.codigo_promocional = 330011),(SELECT REF(f) FROM tb_agendamento f WHERE f.id_agendamento = 1515));

--gera
INSERT INTO tb_gera (id_gera,data_gera,hora_gera) VALUES (1234,to_date('09/04/2022','dd/mm/yy'),'9:30');
INSERT INTO tb_gera (id_gera,data_gera,hora_gera) VALUES (4321,to_date('10/05/2022','dd/mm/yy'),'14:00');
INSERT INTO tb_gera (id_gera,data_gera,hora_gera) VALUES (5555,to_date('02/06/2022','dd/mm/yy'),'7:30');


--estaciona

INSERT INTO tb_estaciona (cod_aeronave,cod_hangar) VALUES (00010,101);
INSERT INTO tb_estaciona (cod_aeronave,cod_hangar) VALUES (10022,202);
INSERT INTO tb_estaciona (cod_aeronave,cod_hangar) VALUES (20333,202);
INSERT INTO tb_estaciona (cod_aeronave,cod_hangar) VALUES (30414,101);
INSERT INTO tb_estaciona (cod_aeronave,cod_hangar) VALUES (40525,202);
INSERT INTO tb_estaciona (cod_aeronave,cod_hangar) VALUES (51434,202);
