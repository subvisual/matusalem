import { writable } from "svelte/store";

export const initialState = [
  {
    id: "1",
    submittedBy:
      "0x054478333586193D177413591900B73AB73dC2F6552e9cD3006f61EC75B2CC2f",
    data: [
      {
        name: "rocket pool",
        val: 60,
      },
      {
        name: "euler",
        val: 22,
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
    ],
  },
];

/* const strats = writable(initialState); */
const strats = writable<typeof initialState[0][]>([]);

export default strats;
