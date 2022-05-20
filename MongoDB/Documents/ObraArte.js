//criando a colecao de Obra de Arte

db.obraArte.insertMany([
    {
      _id: 1,
      nomeObra: "Flores ao vento",
      dataCriacao: "23/03/1850",
      autor: 1,
      museuExpo:2
    },
    {
      _id: 2,
      nomeObra: "Deserto sombrio",
      dataCriacao: "13/13/1920",
      autor: 4,
      museuExpo:1
    },
    {
      _id: 3,
      nomeObra: "Estacas",
      dataCriacao: "02/10/2010",
      autor: 3,
      museuExpo:3
    },
    {
      _id: 4,
      nomeObra: "Telhado molhado",
      dataCriacao: "23/05/1873",
      autor: 2,
      museuExpo:5
    },
    {
      _id: 5,
      nomeObra: "Ideias no papel",
      dataCriacao: "12/11/1851",
      autor: 4,
      museuExpo:4
    }
  ])
