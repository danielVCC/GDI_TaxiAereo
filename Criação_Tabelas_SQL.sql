DROP TABLE pessoa;
DROP TABLE telefone;
DROP TABLE funcionario;
DROP TABLE cliente;
DROP TABLE cartao_de_milhas;
DROP TABLE atendente;
DROP TABLE piloto;
DROP TABLE modelo_aeronave;
DROP TABLE aeronave;
DROP TABLE hangar;
DROP TABLE promoçao;
DROP TABLE agendamento;
DROP TABLE realiza;
DROP TABLE estaciona;
DROP TABLE passagem;


CREATE TABLE pessoa(
    cpf VARCHAR2(15) NOT NULL,
    nome VARCHAR2(15) NOT NULL,
    cep VARCHAR2(12) NOT NULL, 
    logradouro VARCHAR2(40) NOT NULL, 
    numero NUMBER NOT NULL, 
    complemento VARCHAR2(20) NOT NULL,
    bairro VARCHAR2(20) NOT NULL,
    estado VARCHAR2(20) NOT NULL,
    cidade VARCHAR2(20) NOT NULL,
    CONSTRAINT pessoa_pk PRIMARY KEY (cpf)
);

CREATE TABLE telefone(
    cpf_pessoa_telefone VARCHAR(15) NOT NULL,
    ddd NUMBER NOT NULL,
    numero NUMBER NOT NULL,
    CONSTRAINT telefone_pk PRIMARY KEY (cpf_pessoa_telefone),
    CONSTRAINT telefone_cpf_pessoa_fk FOREIGN KEY (cpf_pessoa_telefone) REFERENCES pessoa(cpf)
);

CREATE TABLE funcionario(
    cpf_funcionario VARCHAR2(15) NOT NULL,
    turno_de_trabalho VARCHAR2(14),
    salario NUMBER NOT NULL,
    CONSTRAINT funcionario_pk PRIMARY KEY (cpf_funcionario),
    CONSTRAINT cargo_salario_minimo CHECK (salario >= 1100.00),
    CONSTRAINT funcionario_cpf_pessoa_fk FOREIGN KEY (cpf_funcionario) REFERENCES pessoa(cpf)
);

CREATE TABLE cliente(
    cpf_cliente VARCHAR2(15) NOT NULL,
    data_cadastro DATE NOT NULL,
    CONSTRAINT cliente_pk PRIMARY KEY (cpf_cliente),
    CONSTRAINT cliente_cpf_pessoa_fk FOREIGN KEY (cpf_cliente) REFERENCES pessoa(cpf)
);

CREATE TABLE cartao_de_milhas(
    data_de_emissao DATE NOT NULL,
    numero_de_milhas NUMBER NOT NULL,
    cpf_cliente_cm VARCHAR2(15) NOT NULL, 
    CONSTRAINT cartao_fidelidade_pk PRIMARY KEY (cpf_cliente_cm),
    CONSTRAINT cartao_cpf_cliente_fk FOREIGN KEY (cpf_cliente_cm) REFERENCES cliente(cpf_cliente)
);

CREATE TABLE atendente(
    cpf_atendente VARCHAR2(15) NOT NULL,
    clientes_atendidos NUMBER NOT NULL,
    CONSTRAINT atendente_pk PRIMARY KEY (cpf_atendente),
    CONSTRAINT atendente_cpf_funcionario_fk FOREIGN KEY (cpf_atendente) REFERENCES funcionario(cpf_funcionario)
);

CREATE TABLE piloto(
    cpf_piloto VARCHAR2(15) NOT NULL,
    cpf_copiloto VARCHAR2(15),
    horas_de_voo NUMBER NOT NULL,
    CONSTRAINT piloto_pk PRIMARY KEY (cpf_piloto),
    CONSTRAINT piloto_cpf_atendente_fk FOREIGN KEY (cpf_piloto) REFERENCES funcionario (cpf_funcionario),
    CONSTRAINT piloto_cpf_copiloto_fk FOREIGN KEY (cpf_copiloto) REFERENCES piloto (cpf_piloto)
);

CREATE TABLE modelo_aeronave(
    tipo_aeronave VARCHAR2(20) NOT NULL,
    passageiros NUMBER NOT NULL,
    carga NUMBER NOT NULL,
    velocidade NUMBER NOT NULL,
    Categoria_Velociade VARCHAR2(20),
    CONSTRAINT modelo_aeronave_pk PRIMARY KEY (tipo_aeronave)
);

CREATE TABLE aeronave(
    id_aeronave NUMBER NOT NULL,
    modelo VARCHAR2(20) NOT NULL,
    CONSTRAINT aeronave_pk PRIMARY KEY (id_aeronave),
    CONSTRAINT aeronave_modelo_fk FOREIGN KEY (modelo) REFERENCES modelo_aeronave(tipo_aeronave)
);

CREATE TABLE hangar(
    id_hangar NUMBER NOT NULL,
    capacidade NUMBER NOT NULL,
    CONSTRAINT hangar_pk PRIMARY KEY (id_hangar)
);

CREATE TABLE promocao(
    codigo_promocional NUMBER NOT NULL,
    data_de_termino DATE NOT NULL,
    desconto NUMBER NOT NULL,
    CONSTRAINT promocao_pk PRIMARY KEY (codigo_promocional)
);

CREATE TABLE agendamento(
    cpf_cliente_agendamento VARCHAR2(15) NOT NULL,
    cpf_atendente_agendamento VARCHAR2(15) NOT NULL,
    hora VARCHAR2(10) NOT NULL,
    id_agendamento NUMBER NOT NULL,
    data_agendamento DATE NOT NULL,
    milhas_geradas NUMBER NOT NULL,
    CONSTRAINT agendamento_pk PRIMARY KEY (id_agendamento),
    CONSTRAINT agendamento_cpf_cliente_fk FOREIGN KEY (cpf_cliente_agendamento) REFERENCES cliente(cpf_cliente),
    CONSTRAINT agendamento_cpf_atendete_fk FOREIGN KEY (cpf_atendente_agendamento) REFERENCES atendente(cpf_atendente)
);

CREATE TABLE passagem(
    id_passagem NUMBER NOT NULL,
    origem VARCHAR2(20) NOT NULL,
    destino VARCHAR2(20) NOT NULL,
    data_de_ida DATE NOT NULL,
    horario_passagem VARCHAR2(10) NOT NULL,
    data_de_volta DATE NOT NULL,
    CONSTRAINT passagem_pk PRIMARY KEY (id_passagem)
);

CREATE TABLE realiza(
    cpf_cliente_realiza_promo VARCHAR2(15) NOT NULL,
    codigo_promocional_realiza NUMBER NOT NULL,
    id_agendamento_realiza NUMBER NOT NULL,
    CONSTRAINT realiza_tb1_pk PRIMARY KEY (cpf_cliente_realiza_promo, codigo_promocional_realiza, id_agendamento_realiza),
    CONSTRAINT codigo_pomocional_fk FOREIGN KEY (codigo_promocional_realiza) REFERENCES promocao(codigo_promocional),
    CONSTRAINT id_agendamento_realiza_fk FOREIGN KEY (id_agendamento_realiza) REFERENCES agendamento(id_agendamento),
    CONSTRAINT realiza_cpf_cliente_fk FOREIGN KEY (cpf_cliente_realiza_promo) REFERENCES cliente(cpf_cliente)
);

CREATE TABLE estaciona(
    cod_aeronave NUMBER NOT NULL,
    cod_hangar NUMBER NOT NULL,
    CONSTRAINT estaciona1_pk PRIMARY KEY (cod_aeronave,cod_hangar),
    CONSTRAINT cod_aeronave_fk FOREIGN KEY (cod_aeronave) REFERENCES aeronave(id_aeronave),
    CONSTRAINT cod_hangar_fk FOREIGN KEY (cod_hangar) REFERENCES hangar(id_hangar)
);

ALTER TABLE funcionario ADD (
    CONSTRAINT funcionario_salario_check CHECK (salario >= 1100.00)
);
CREATE INDEX indice_funcionario_salario ON funcionario(salario);
CREATE SEQUENCE seq_id_passagem INCREMENT BY 1 START WITH 1;
