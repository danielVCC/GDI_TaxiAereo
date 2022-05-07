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

-- ⚠️ nao passou kk --
 CREATE TABLE tb_telefone OF tp_telefone(
     cpf PRIMARY KEY,
     ddd NOT NULL,
     numero NOT NULL
);

/

-- ✅ --
CREATE TABLE tb_funcionario OF tp_funcionario(
    cpf PRIMARY KEY,
    turno_de_trabalho NOT NULL,
    salario NOT NULL CHECK (salario >= 1100.00)
);
/
-- ✅ --
CREATE TABLE tb_cliente of tp_cliente(
    cpf PRIMARY KEY,
    data_cadastro NOT NULL
);
/
-- ⚠️ nao passou --
CREATE TABLE tb_cartao_de_milhas OF tp_cartao_de_milhas(
    cpf PRIMARY KEY, 
    data_de_emissao NOT NULL,
    numero_de_milhas NOT NULL
);
/
-- ✅ --
CREATE TABLE tb_atendente OF tp_atendente(
    cpf PRIMARY KEY,
    clientes_atendidos NOT NULL
);
/
-- ✅ --
CREATE TABLE tb_piloto OF tp_piloto(
    cpf PRIMARY KEY,
    cpf_copiloto WITH ROWID REFERENCES tb_piloto,
    horas_de_voo NOT NULL
);
/
-- ✅ --
CREATE TABLE tb_modelo_aeronave OF tp_modelo_aeronave(
    tipo_aeronave PRIMARY KEY,
    passageiros NOT NULL,
    carga NOT NULL,
    velocidade NOT NULL,
    categoria_Velociade NOT NULL
);
/
-- ✅ --
CREATE TABLE tb_aeronave OF tp_aeronave(
    id_aeronave PRIMARY KEY,
    modelo WITH ROWID REFERENCES tb_modelo_aeronave NOT NULL
);
/
-- ✅ --
CREATE TABLE tb_hangar OF tp_hangar(
    id_hangar PRIMARY KEY,
    capacidade NOT NULL
);
/
-- ✅ --
CREATE TABLE tb_promocao OF tp_promocao(
    codigo_promocional PRIMARY KEY,
    data_de_termino NOT NULL,
    desconto NOT NULL
);
/
-- ✅ --
CREATE TABLE tb_agendamento OF tp_agendamento(
    cpf_cliente_agendamento SCOPE IS tb_cliente NOT NULL,
    cpf_atendente_agendamento SCOPE IS tb_atendente NOT NULL,
    hora NOT NULL,
    id_agendamento PRIMARY KEY,
    data_agendamento NOT NULL,
    milhas_geradas NOT NULL
);
/
-- ✅ --
CREATE TABLE tb_passagem OF tp_passagem(
    id_passagem PRIMARY KEY,
    origem NOT NULL,
    destino NOT NULL,
    data_de_ida NOT NULL,
    horario_passagem NOT NULL,
    data_de_volta NOT NULL
);
/
--⚠️ nao passou --
CREATE TABLE tb_realiza OF tp_realiza(
    cpf_cliente_realiza_promo PRIMARY KEY,
    codigo_promocional_realiza SCOPE IS tb_promocao,
    id_agendamento_realiza SCOPE IS tb_agendamento NOT NULL
);
/
-- ✅ --
CREATE TABLE tb_estaciona OF tp_estaciona(
    cod_aeronave PRIMARY KEY,
    cod_hangar SCOPE IS tb_hangar NOT NULL
);
/
-- ✅ --
CREATE TABLE tb_gera OF tp_gera(
  id_gera PRIMARY KEY,
  data_gera NOT NULL,
  hora_gera NOT NULL
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
13. CREATE TABLE OF ✅
14. WITH ROWID REFERENCES ✅
15. REF ✅
16. SCOPE IS ✅
17. INSERT INTO 
18. VALUE 
19. VARRAY ✅
20. NESTED TABLE 

*/
