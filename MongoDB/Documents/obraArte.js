//criando a colecao de Obra de Arte

db.obraArte.insertMany([
  {
    _id: 1,
    nomeObra: "Flores ao vento",
    dataCriacao: "23/03/1850",
    autor: 1,
    museuExpo:2,
    medidas: [
          {comprimento: 12}, 
          {largura: 9},
      ]
  },
  {
    _id: 2,
    nomeObra: "Deserto sombrio",
    dataCriacao: "13/13/1920",
    autor: 4,
    museuExpo:1,
    medidas: [
          {comprimento: 22}, 
          {largura: 19},
          {altura: 34}
      ],
  },
  {
    _id: 3,
    nomeObra: "Estacas",
    dataCriacao: "02/10/2010",
    autor: 3,
    museuExpo:3,
    medidas: [
          {comprimento: 33}, 
          {largura: 91},
          {altura: 42}
      ],
  },
  {
    _id: 4,
    nomeObra: "Telhado molhado",
    dataCriacao: "23/05/1873",
    autor: 2,
    museuExpo:5,
    medidas: [
          {comprimento: 13}, 
          {largura: 33},
          {altura: 22}
      ],
  },
  {
    _id: 5,
    nomeObra: "Ideias no papel",
    dataCriacao: "12/11/1851",
    autor: 4,
    museuExpo:4,
    medidas: [
          {comprimento: 13}, 
          {largura: 45},
          {altura: 41}
      ],
  }
])
