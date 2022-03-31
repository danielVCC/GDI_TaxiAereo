--pessoa

INSERT INTO pessoa (cpf,nome,cep,logradouro,numero,complemento,bairro,estado,cidade) VALUES ('111.222.333.44','Henrique Sakane','00000-105','Rua da esquina',705,'apto 701','Tamarineira','Pernambuco','Recife');
INSERT INTO pessoa (cpf,nome,cep,logradouro,numero,complemento,bairro,estado,cidade) VALUES ('011.222.333.23','Daniel Victor','02200-123','Rua vicente',523,'apto 102','Baixo','Pernambuco','Olinda');
INSERT INTO pessoa (cpf,nome,cep,logradouro,numero,complemento,bairro,estado,cidade) VALUES ('555.222.333.44','José Da Silva','45600-105','Rua agrestina',90,'apto 28','Casa forte','Rio de Janeiro','Xelti');
INSERT INTO pessoa (cpf,nome,cep,logradouro,numero,complemento,bairro,estado,cidade) VALUES ('333.222.333.23','Arthur Santos','026768-123','Rua manto',230,'apto 378','Inter','Ceara','Olvi');
INSERT INTO pessoa (cpf,nome,cep,logradouro,numero,complemento,bairro,estado,cidade) VALUES ('444.222.333.56','Victor Relo','045668-123','Rua Alfa',34,'apto 46','Boa vista','Pernambuco','Filo');
INSERT INTO pessoa (cpf,nome,cep,logradouro,numero,complemento,bairro,estado,cidade) VALUES ('222.333.444.57','João Almeida','745760-134','Rua Alcântara',127,'apto 87','Madalena','Pernambuco','Recife');
INSERT INTO pessoa (cpf,nome,cep,logradouro,numero,complemento,bairro,estado,cidade) VALUES ('105.210.555.70','Fabio Carvalho','502788-013','Rua Benfica',108,'apto 40','Derby','Pernambuco','Recife');
INSERT INTO pessoa (cpf,nome,cep,logradouro,numero,complemento,bairro,estado,cidade) VALUES ('777.022.333.88','André Souza','905878-145','Rua América',35,'apto 63','Bela Vista','Pernambuco','Caruaru');
INSERT INTO pessoa (cpf,nome,cep,logradouro,numero,complemento,bairro,estado,cidade) VALUES ('888.010.111.31','Carlos Costa','301067-301','Rua Colombo',107,'apto 80','Carajas','Sao Paulo','Campinas');
INSERT INTO pessoa (cpf,nome,cep,logradouro,numero,complemento,bairro,estado,cidade) VALUES ('999.111.434.95','Bruno Goes','578003-403','Rua Omega',205,'apto 50','Nova Asa','Alagoas','Arapiraca');
INSERT INTO pessoa (cpf,nome,cep,logradouro,numero,complemento,bairro,estado,cidade) VALUES ('855.777.032.75','Paulo Lima','487503-362','Rua Beta',302,'apto 13','Pombos','Pará','Belém');

--telefone

INSERT INTO telefone (cpf_pessoa_telefone, ddd, numero) VALUES ('111.222.333.44', 81, 989898989);
INSERT INTO telefone (cpf_pessoa_telefone, ddd, numero) VALUES ('011.222.333.23', 81, 987878787);
INSERT INTO telefone (cpf_pessoa_telefone, ddd, numero) VALUES ('555.222.333.44', 21, 976767676);
INSERT INTO telefone (cpf_pessoa_telefone, ddd, numero) VALUES ('333.222.333.23', 88, 998967548);
INSERT INTO telefone (cpf_pessoa_telefone, ddd, numero) VALUES ('444.222.333.56', 81, 998345459);
INSERT INTO telefone (cpf_pessoa_telefone, ddd, numero) VALUES ('222.333.444.57', 81, 998735459);
INSERT INTO telefone (cpf_pessoa_telefone, ddd, numero) VALUES ('105.210.555.70', 81, 979055705);
INSERT INTO telefone (cpf_pessoa_telefone, ddd, numero) VALUES ('777.022.333.88', 81, 998305781);
INSERT INTO telefone (cpf_pessoa_telefone, ddd, numero) VALUES ('888.010.111.31', 11, 999900123);
INSERT INTO telefone (cpf_pessoa_telefone, ddd, numero) VALUES ('999.111.434.95', 82, 988057430);
INSERT INTO telefone (cpf_pessoa_telefone, ddd, numero) VALUES ('855.777.032.75', 91, 979568708);

--funcionario

INSERT INTO funcionario (cpf_funcionario, turno_de_trabalho,salario) VALUES ('111.222.333.44','Manhã',1200);
INSERT INTO funcionario (cpf_funcionario, turno_de_trabalho,salario) VALUES ('011.222.333.23','Tarde',1500);
INSERT INTO funcionario (cpf_funcionario, turno_de_trabalho,salario) VALUES ('555.222.333.44','Noite',1700);
INSERT INTO funcionario (cpf_funcionario, turno_de_trabalho,salario) VALUES ('333.222.333.23','Tarde',3000);
INSERT INTO funcionario (cpf_funcionario, turno_de_trabalho,salario) VALUES ('888.010.111.31','Noite',3000);
INSERT INTO funcionario (cpf_funcionario, turno_de_trabalho,salario) VALUES ('999.111.434.95','Tarde',2100);
INSERT INTO funcionario (cpf_funcionario, turno_de_trabalho,salario) VALUES ('855.777.032.75','Manhã',2100);

--cliente

INSERT INTO cliente (cpf_cliente,data_cadastro) VALUES ('222.333.444.57', to_date('05/07/2020', 'dd/mm/yy'));
INSERT INTO cliente (cpf_cliente,data_cadastro) VALUES ('105.210.555.70', to_date('15/12/2015', 'dd/mm/yy'));
INSERT INTO cliente (cpf_cliente,data_cadastro) VALUES ('777.022.333.88', to_date('20/10/2018', 'dd/mm/yy'));
INSERT INTO cliente (cpf_cliente,data_cadastro) VALUES ('444.222.333.56', to_date('18/11/2019', 'dd/mm/yy'));

--cartao_de_milhas

INSERT INTO cartao_de_milhas (data_de_emissao,numero_de_milhas,cpf_cliente_cm) VALUES (to_date('08/07/2020','dd/mm/yy'),3000,'222.333.444.57');
INSERT INTO cartao_de_milhas (data_de_emissao,numero_de_milhas,cpf_cliente_cm) VALUES (to_date('01/01/2016','dd/mm/yy'),2000,'105.210.555.70');
INSERT INTO cartao_de_milhas (data_de_emissao,numero_de_milhas,cpf_cliente_cm) VALUES (to_date('24/10/2018','dd/mm/yy'),1800,'777.022.333.88');
INSERT INTO cartao_de_milhas (data_de_emissao,numero_de_milhas,cpf_cliente_cm) VALUES (to_date('22/11/2019','dd/mm/yy'),2780,'444.222.333.56');

--atendente

INSERT INTO atendente (cpf_atendente,clientes_atendidos) VALUES ('111.222.333.44',574);
INSERT INTO atendente (cpf_atendente,clientes_atendidos) VALUES ('011.222.333.23',485);
INSERT INTO atendente (cpf_atendente,clientes_atendidos) VALUES ('555.222.333.44',574);

--piloto

INSERT INTO piloto (cpf_piloto,cpf_copiloto,horas_de_voo) VALUES('333.222.333.23',null ,15000);
INSERT INTO piloto (cpf_piloto,cpf_copiloto,horas_de_voo) VALUES('888.010.111.31',null ,20100);
INSERT INTO piloto (cpf_piloto,cpf_copiloto,horas_de_voo) VALUES('999.111.434.95','333.222.333.23',7100);
INSERT INTO piloto (cpf_piloto,cpf_copiloto,horas_de_voo) VALUES('855.777.032.75','888.010.111.31',11500);

--modelo_aeronave

INSERT INTO modelo_aeronave (tipo_aeronave,passageiros,carga, velocidade) VALUES ('Gulfstream G500',50,1000,700);
INSERT INTO modelo_aeronave (tipo_aeronave,passageiros,carga, velocidade) VALUES ('Bombardier Global',60,1600,850);
INSERT INTO modelo_aeronave (tipo_aeronave,passageiros,carga, velocidade) VALUES ('Embraer E-195',150,2000,800 );
INSERT INTO modelo_aeronave (tipo_aeronave,passageiros,carga, velocidade) VALUES ('Dassault',15,1000,700);
INSERT INTO modelo_aeronave (tipo_aeronave,passageiros,carga, velocidade) VALUES ('Pilatus PC-24',10,500,750);
INSERT INTO modelo_aeronave (tipo_aeronave,passageiros,carga, velocidade) VALUES ('Phenom 300',50,30000,850);

--aeronave

INSERT INTO aeronave (id_aeronave,modelo) VALUES (00010,'Embraer E-195');
INSERT INTO aeronave (id_aeronave,modelo) VALUES (10022,'Gulfstream G500');
INSERT INTO aeronave (id_aeronave,modelo) VALUES (20333,'Bombardier Global');
INSERT INTO aeronave (id_aeronave,modelo) VALUES (30414,'Dassault');
INSERT INTO aeronave (id_aeronave,modelo) VALUES (40525,'Pilatus PC-24');
INSERT INTO aeronave (id_aeronave,modelo) VALUES (51434,'Phenom 300');

--hangar

INSERT INTO hangar (id_hangar,capacidade) VALUES (101,4);
INSERT INTO hangar (id_hangar,capacidade) VALUES (202,7);

--promocao

INSERT INTO promocao (codigo_promocional,data_de_termino,desconto) VALUES (000001,to_date('08/05/2022','dd/mm/yy'),20);
INSERT INTO promocao (codigo_promocional,data_de_termino,desconto) VALUES (220002,to_date('27/08/2022','dd/mm/yy'),50);
INSERT INTO promocao (codigo_promocional,data_de_termino,desconto) VALUES (330011,to_date('30/09/2022','dd/mm/yy'),10);

--agendamento

INSERT INTO agendamento (cpf_cliente_agendamento,cpf_atendente_agendamento,hora,id_agendamento,data_agendamento,milhas_geradas) VALUES ('222.333.444.57','111.222.333.44','10:43',0103,to_date('25/02/2022','dd/mm/yy'),300);
INSERT INTO agendamento (cpf_cliente_agendamento,cpf_atendente_agendamento,hora,id_agendamento,data_agendamento,milhas_geradas) VALUES ('105.210.555.70','011.222.333.23','13:35',0121,to_date('10/03/2022','dd/mm/yy'),400);
INSERT INTO agendamento (cpf_cliente_agendamento,cpf_atendente_agendamento,hora,id_agendamento,data_agendamento,milhas_geradas) VALUES ('777.022.333.88','011.222.333.23','16:20',0139,to_date('18/03/2022','dd/mm/yy'),600);
INSERT INTO agendamento (cpf_cliente_agendamento,cpf_atendente_agendamento,hora,id_agendamento,data_agendamento,milhas_geradas) VALUES ('444.222.333.56','555.222.333.44','19:50',0217,to_date('31/03/2022','dd/mm/yy'),1300);

--passagem

INSERT INTO passagem (id_passagem,origem,destino,data_de_ida,horario_passagem,data_de_volta) VALUES (seq_id_passagem.nextval,'Recife','Salvador',to_date('09/04/2022','dd/mm/yy'),'10:00',to_date('12/04/2022','dd/mm/yy'));
INSERT INTO passagem (id_passagem,origem,destino,data_de_ida,horario_passagem,data_de_volta) VALUES (seq_id_passagem.nextval,'Recife','Curitiba',to_date('10/05/2022','dd/mm/yy'),'15:00',to_date('15/06/2022','dd/mm/yy'));
INSERT INTO passagem (id_passagem,origem,destino,data_de_ida,horario_passagem,data_de_volta) VALUES (seq_id_passagem.nextval,'Recife','Brasilia',to_date('02/06/2022','dd/mm/yy'),'09:30',to_date('04/06/2022','dd/mm/yy'));

--realiza

INSERT INTO realiza (cpf_cliente_realiza_promo,codigo_promocional_realiza,id_agendamento_realiza) VALUES ('222.333.444.57',000001,0103);
INSERT INTO realiza (cpf_cliente_realiza_promo,codigo_promocional_realiza,id_agendamento_realiza) VALUES ('105.210.555.70',330011,0121);
INSERT INTO realiza (cpf_cliente_realiza_promo,codigo_promocional_realiza,id_agendamento_realiza) VALUES ('777.022.333.88',330011,0139);

--estaciona

INSERT INTO estaciona (cod_aeronave,cod_hangar) VALUES (00010,101);
INSERT INTO estaciona (cod_aeronave,cod_hangar) VALUES (10022,202);
INSERT INTO estaciona (cod_aeronave,cod_hangar) VALUES (20333,202);
INSERT INTO estaciona (cod_aeronave,cod_hangar) VALUES (30414,101);
INSERT INTO estaciona (cod_aeronave,cod_hangar) VALUES (40525,202);
INSERT INTO estaciona (cod_aeronave,cod_hangar) VALUES (51434,202);
