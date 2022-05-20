//use ('test');

// Encontre os tickets que pertence ao visitante de id 3
db.tickets.find({ visitantes: { $exists: true, $all: [3] } }).pretty();

// Encontre os visitantes que possuem 2 endereços
db.visitantes.find({ enderecos: { $size: 2 } }).pretty();

// Listar informações dos endereços de Recife ordenados por numero ascendente
db.enderecos.aggregate([
    { $match: { cidade: "Recife"} },
    { $sort: { numero: 1 } },
    { $project:  { _id: 0, cep : 1, logradouro : 1, bairro : 1, cidade : 1, estado : 1, numero: 1, complemento: 1, referencia: 1}},
  ]).pretty();

// Listar CPF, nome, email do funcionario de CPF "222.333.444-55"
db.funcionarios.findOne({ cpf: "222.333.444-55" }, { _id: 0, nome: 1, cpf: 1, email: 1})

//Função que retorna uma mensagem indicando que a encomenda foi paga
db.tickets.aggregate([
    {
      $addFields: {
        message: {
          $function: {
            body: function (valor) {
              return `Você pagou o ticket no valor de ${valor}`;
            },
            args: ["$valor"],
            lang: "mongodb",
          },
        },
      },
    },
  ]).pretty();

  //Seleciona os funcionarios com salario maior ou igual a 1500
db.funcionarios.find({ salario: { $gte: 1500 } }).pretty();

//Procura todos os funcionarios que são do sexo feminino
db.funcionarios.createIndex({sexo: "text"})

db.funcionarios.find({
    $text: {
      $search: "F",
    },
}).pretty();

//Procura todos os autores que são do sexo masculino
db.autor.createIndex({sexo: "text"})

db.autor.find({
    $text: {
      $search: "M",
    },
}).pretty();

//Aplicar um desconto de 10% no valor do ticket
var map = function () {
    emit(this.valor);
};
var reduce = function (valor) {
    resultadoDesconto = (valor)-valor*0.1
    return resultadoDesconto;
};

db.tickets.mapReduce(map, reduce, { out: "Valor apos desconto:" });

// novo ticket de Carlos Manoel
  db.tickets.save({
    museu: 5,
    data_entrada: "25/06/2021",
    valor: 45,
    visitantes: 3,
    funcionarios: 4
  });

// Atualizar o cargo do autor de nome "Luana vieira"  
db.autor.update({ nomeAutor: "Luana Vieira" }, { $set: { cargo: "Escultora" } });

// Retorna os tickets com valores maiores que 20
db.tickets.find({
    $where: function () {
      return this.valor > 20;
    },
 });

// Pegar os três tickets de maior valor
db.tickets.find().sort({ valor: -1 }).limit(3);

// max
db.funcionarios.aggregate([
    {
        $group: {
            _id: "$sexo", MaxSalario:{$max: "$salario"}
        }
    }
]);

// adicionar altura nas medidas da Obra de arte de id 1
db.obraArte.update(
    { _id: 1 },
    {
        $addToSet: {
            medidas: {altura: 4},
        },
    }
);


/*
CHECKLIST
1. USE ✅
2. FIND ✅
3. SIZE ✅
4. AGGREGATE ✅
5. MATCH ✅
6. PROJECT ✅
7. GTE ✅
8. GROUP ✅
9. SUM
10. COUNT
11. MAX ✅
12. AVG
13. EXISTS ✅
14. SORT ✅
15. LIMIT ✅
16. $WHERE ✅
17. MAPREDUCE ✅
18. FUNCTION ✅
19. PRETTY ✅
20. ALL ✅
21. SET
22. TEXT ✅
23. SEARCH ✅
24. FILTER
25. UPDATE ✅
26. SAVE ✅
27. RENAMECOLLECTION
28. COND
29. LOOKUP
30. FINDONE ✅
31. ADDTOSET
*/
