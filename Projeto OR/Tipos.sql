-- TIPO PESSOA --
-- TIPO NOT FINAL (PERMITE CRIAÇÃO DE SUBTIPO E NÃO É POSSÍVEL INSERIR DADOS, POIS É APENAS UM MOLDE) -- 
-- E NOT INSTANTIABLE (TIPOS ABSTRADOS: NÃO PODEM TER INSTÂNCIAS DE OBJETOS CRIADAS EM TABELAS) --
-- CLIENTE E FUNCIONÁRIO HERDAM DE PESSOA --
CREATE OR REPLACE TYPE tp_pessoa AS OBJECT (
    
    cpf VARCHAR2(15),
    nome VARCHAR2(40),
    telefone tp_telefone,
    endereco tp_endereco,
    MEMBER PROCEDURE print_info
    
) NOT FINAL NOT INSTANTIABLE;

/

-- TELEFONE (USANDO VARRAY) --
-- TIPO VARRAY QUE POSSIBILITA INSERÇÃO E ARMAZENAMENTO DE MÚLTIPLOS TELEFONES --
CREATE OR REPLACE TYPE tp_telefone AS OBJECT (
    
    ddd NUMBER,
    numero NUMBER

);

/

-- CRIANDO TIPO ARRAY DE TELEFONES --
CREATE OR REPLACE TYPE tp_arr_telefone AS VARRAY (5) OF tp_telefone;

/
   
-- ENDEREÇO --
-- TIPO QUE ESTARÁ EM PESSOA (QUE CLIENTE E FUNCIONARIO HERDAM) --
CREATE OR REPLACE TYPE tp_endereco AS OBJECT (

    cep VARCHAR2 (12), 
    logradouro VARCHAR2 (40), 
    numero NUMBER, 
    complemento VARCHAR2 (20),
    bairro VARCHAR2 (20),
    estado VARCHAR2 (20),
    cidade VARCHAR2 (20)

);


/

-- CLIENTE --
-- HERDA DE PESSOA --
CREATE OR REPLACE TYPE tp_cliente UNDER tp_pessoa (

    data_cadastro DATE

);

/

-- FUNCIONÁRIO --
-- HERDA DE PESSOA --
CREATE OR REPLACE TYPE tp_funcionario UNDER tp_pessoa (

    turno_de_trabalho VARCHAR2(14),
    salario NUMBER,
    MEMBER FUNCTION renda_anual RETURN NUMBER,
    OVERRIDING MEMBER PROCEDURE print_info,
    CONSTRUCTOR FUNCTION tp_funcionario (x1 tp_funcionario) RETURN SELF AS RESULT

) NOT FINAL;

/

-- RENDA_ANUAL: MEMBER FUNCTION QUE CALCULA A RENDA ANUAL DO ENTREGADOR --
-- PRINT_INFO: OVERRIDING MEMBER FUNCTION QUE IMPRIME AS INFORMAÇÕES DO ENTREGADOR --
-- CONSTRUCTOR: PADRÃO --
CREATE OR REPLACE TYPE BODY tp_funcionario AS
MEMBER FUNCTION renda_anual RETURN NUMBER IS
    BEGIN
        RETURN salario*12;
    END;
OVERRIDING MEMBER PROCEDURE print_info IS
    BEGIN 
        DBMS_OUTPUT.PUT_LINE(nome);
        DBMS_OUTPUT.PUT_LINE(cpf);
        DBMS_OUTPUT.PUT_LINE(salario);
        DBMS_OUTPUT.PUT_LINE(turno_de_trabalho);
    END;
CONSTRUCTOR FUNCTION tp_funcionario (x1 tp_funcionario) RETURN SELF AS RESULT IS
    BEGIN
        cpf := x1.cpf; 
        nome := x1.nome; 
        telefone := x1.telefone;
        endereco := x1.endereco;
        salario := x1.salario; 
        turno_de_trabalho := x1.turno_de_trabalho; 
        RETURN; 
    END;
END;


/

-- ATENDENTE --
-- HERDA DE FUNCIONÁRIO --
CREATE OR REPLACE TYPE tp_atendente UNDER tp_funcionario (

    clientes_atendidos NUMBER,
    FINAL MAP MEMBER FUNCTION qntd_clientes_atendidos RETURN NUMBER
);

/

/

-- QNTD_CLIENTES_ATENDIDOS: FINAL MAP MEMBER QUE RETORNA A QUANTIDADE DE TELEFONES CADASTRADOS DE UM CLIENTE --
CREATE OR REPLACE TYPE BODY tp_atendente AS 
FINAL MAP MEMBER FUNCTION qntd_clientes_atendidos RETURN NUMBER IS
selfCnt NUMBER;
    BEGIN
        SELECT COUNT(*) INTO selfCnt
        FROM TABLE(SELF.clientes_atendidos);
        RETURN selfCnt;
    END;
END;

/

-- PILOTO --
-- HERDA DE FUNCIONÁRIO --
CREATE OR REPLACE TYPE tp_piloto UNDER tp_funcionario (

    horas_de_voo NUMBER

);

/

-- ADICIONANDO DATA DE NASCIMENTO EM PESSOA --
-- CASCADE: PROPAGA A MUDANÇA PARA TIPOS DEPENDENTES -- 
ALTER TYPE tp_pessoa ADD ATTRIBUTE (data_nascimento DATE) CASCADE;

/

-- CUPOM --
-- PODE OU NÃO PERTENCER (REFERENCIAR) A UM CLIENTE --
CREATE OR REPLACE TYPE tp_promocao AS OBJECT (
    
    codigo_promocional NUMBER,
    data_de_termino DATE,
    desconto NUMBER

    cliente REF tp_cliente,

    ORDER MEMBER FUNCTION comparaDesconto (SELF IN OUT NOCOPY tp_promocao, c tp_promocao) RETURN NUMBER

);

/

-- COMPARA_DESCONTO: ORDER MEMBER FUNCTION QUE COMPARA DESCONTOS E RETORNA UM TEXTINHO --
CREATE OR REPLACE TYPE BODY tp_promocao AS
ORDER MEMBER FUNCTION comparaDesconto (SELF IN OUT NOCOPY tp_promocao, c tp_promocao) RETURN NUMBER IS
    BEGIN
        IF SELF.desconto < c.desconto THEN 
            RETURN -1;
        ELSIF SELF.desconto > c.desconto THEN 
            RETURN 1;
        ELSE 
            RETURN 0;
        END IF;
    END;
END;

/

-- AUXILIA --
-- AUTORELACIONAMENTO QUE REFERENCIA PILOTOS --
-- REF: REFERENCIA OBJETOS ARMAZENADOS EM TABELAS -- 
CREATE OR REPLACE TYPE tp_auxilia AS OBJECT (

    auxiliador REF tp_piloto,
    auxiliado REF tp_piloto

);

/

-- HANGAR --
-- TERÁ APENAS SEU TIPO CRIADO, POIS É UMA NESTED TABLE DE RESTAURANTE --
CREATE OR REPLACE TYPE tp_prato AS OBJECT (

    nome_prato VARCHAR2 (50),
    preco NUMBER,
    categoria VARCHAR2 (30),
    codigo NUMBER

);






/* CHECKLIST

1. CREATE OR REPLACE TYPE ✅
2. CREATE OR REPLACE TYPE BODY ✅
3. MEMBER PROCEDURE ✅
4. MEMBER FUNCTION ✅
5. ORDER MEMBER FUNCTION ✅
6. MAP MEMBER FUNCTION ✅
7. CONSTRUCTOR FUNCTION ✅
8. OVERRIDING MEMBER ✅
9. FINAL MEMBER ⚠️ (acho que ja foi no final map member)
10. NOT INSTANTIABLE TYPE/MEMBER ✅
11. HERANÇA DE TIPOS (UNDER/NOT FINAL) ✅
12. ALTER TYPE ✅
13. CREATE TABLE OF 
14. WITH ROWID REFERENCES 
15. REF ✅
16. SCOPE IS 
17. INSERT INTO 
18. VALUE 
19. VARRAY ✅
20. NESTED TABLE 

*/







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
DROP TABLE gera;

-- ✅ --
CREATE TABLE pessoa(
    cpf VARCHAR2(15) NOT NULL,
    nome VARCHAR2(15) NOT NULL,
    cep VARCHAR2(12) NOT NULL, 
    logradouro VARCHAR2(40) NOT NULL, 
    numero NUMBER NOT NULL, 
    complemento VARCHAR2(20) NOT NULL,
    bairro VARCHAR2(20) NOT NULL,
    estado VARCHAR2(20) NOT NULL,
    cidade VARCHAR2(20) NOT NULL
);

-- ✅ --
CREATE TABLE telefone(
    cpf_pessoa_telefone VARCHAR(15) NOT NULL,
    ddd NUMBER NOT NULL,
    numero NUMBER NOT NULL,
    CONSTRAINT telefone_pk PRIMARY KEY (cpf_pessoa_telefone),
    CONSTRAINT telefone_cpf_pessoa_fk FOREIGN KEY (cpf_pessoa_telefone) REFERENCES pessoa(cpf)
);

-- ✅ --
CREATE TABLE tb_funcionario OF tp_funcionario(
    cpf PRIMARY KEY,
    turno_de_trabalho NOT NULL,
    salario NOT NULL,
);

-- ✅ --
CREATE TABLE tb_cliente of tp_cliente(
    cpf PRIMARY KEY,
    data_cadastro NOT NULL
);

CREATE TABLE cartao_de_milhas(
    data_de_emissao DATE NOT NULL,
    numero_de_milhas NUMBER NOT NULL,
    cpf_cliente_cm VARCHAR2(15) NOT NULL, 
    CONSTRAINT cartao_fidelidade_pk PRIMARY KEY (cpf_cliente_cm),
    CONSTRAINT cartao_cpf_cliente_fk FOREIGN KEY (cpf_cliente_cm) REFERENCES cliente(cpf_cliente)
);

-- ✅ --
CREATE TABLE atendente(
    cpf_atendente VARCHAR2(15) NOT NULL,
    clientes_atendidos NUMBER NOT NULL,
    CONSTRAINT atendente_pk PRIMARY KEY (cpf_atendente),
    CONSTRAINT atendente_cpf_funcionario_fk FOREIGN KEY (cpf_atendente) REFERENCES funcionario(cpf_funcionario)
);

-- ✅ --
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
    categoria_Velociade VARCHAR2(20),
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

-- ✅ --
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

CREATE TABLE gera (
  id_gera NUMBER NOT NULL,
  data_gera DATE NOT NULL,
  hora_gera VARCHAR2(15) NOT NULL,
  CONSTRAINT gera_pk PRIMARY KEY (id_gera)
);

ALTER TABLE funcionario ADD (
    CONSTRAINT funcionario_salario_check CHECK (salario >= 1100.00)
);

CREATE TABLE log_table (
    info VARCHAR2(40)
);
CREATE INDEX indice_funcionario_salario ON funcionario(salario);
CREATE SEQUENCE seq_id_passagem INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE seq_id_agendamento INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE seq_id_realiza INCREMENT BY 1 START WITH 1;
