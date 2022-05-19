//criando a colecao de Autores(pintores/escultores/colecionadores)

db.autor.insertMany([
  {
    _id: 1,
    nomeAutor: "Joao Kleber",
    sexo: "M",
    cargo: "Pintor"
  },
  {
    _id: 2,
    nomeAutor: "Luana Vieira",
    sexo: "F",
    cargo: "Pintora"
  },{
    _id: 3,
    nomeAutor: "Luis Braga",
    sexo: "M",
    cargo: "Colecionador"
  },{
    _id: 4,
    nomeAutor: "Helena Oliveira",
    sexo: "F",
    cargo: "Escultora"
  }
])
