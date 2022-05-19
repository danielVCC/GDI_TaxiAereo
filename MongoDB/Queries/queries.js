//use ('test');

// Encontre os tickets que pertence ao visitante de id 2
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
              return `Você pagou a encomenda no valor de ${valor}`;
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

// nova ticket de Carlos Manoel CHECKKKKKKK
  db.tickets.save({
    museu: 5,
    data_entrada: "25/06/2021",
    valor: 45,
    visitantes: 3,
    funcionarios: 4
  });
