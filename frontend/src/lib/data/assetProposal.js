const bestOptions = [
  {
    name: "rocket pool",
    val: 70,
  },
  {
    name: "euler",
    val: 12,
  },
  {
    name: "uniswap",
    val: 2,
  },
  {
    name: "wrapped-bitcoin",
    val: 2,
  },
  {
    name: "maker",
    val: 2,
  },
  {
    name: "filecoin",
    val: 2,
  },
  {
    name: "aave",
    val: 2,
  },
  {
    name: "curve-dao-token",
    val: 2,
  },
  {
    name: "nexo",
    val: 2,
  },
  {
    name: "the-graph",
    val: 2,
  },
  {
    name: "sandclock",
    val: 2,
  },
];

const blank = bestOptions.map((item) => ({ val: 0, name: item.name }));

export { blank, bestOptions };
