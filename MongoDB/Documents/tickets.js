//criando a colecao de Tickets

db.tickets.insertMany([
  {
    _id: 1,
    museu: [1],
    data_entrada: "15/07/2012",
    valor: 15,
    visitantes: [3],
    funcionarios: [5]
  },
  {
    _id: 2,
    museu: [1],
    data_entrada: "27/08/2012",
    valor: 15,
    visitantes: [1, 3],
    funcionarios: [2]
  },
  {
    _id: 3,
    museu: [2],
    data_entrada: "09/12/2000",
    valor: 20,
    visitantes: [2],
    funcionarios: [1]
  },
  {
    _id: 4,
    museu: [2],
    data_entrada: "12/09/2001",
    valor: 25,
    visitantes: [4],
    funcionarios: [1]
  },
  {
    _id: 5,
    museu: [3],
    data_entrada: "21/01/2021",
    valor: 30,
    visitantes: [4, 5],
    funcionarios: [3]
  },
  {
    _id: 6,
    museu: [4],
    data_entrada: "23/03/2022",
    valor: 30,
    visitantes: [5],
    funcionarios: [4]
  },
  {
    _id: 7,
    museu: [5],
    data_entrada: "15/05/2022",
    valor: 45,
    visitantes: [3],
    funcionarios: [4]
  }
])
