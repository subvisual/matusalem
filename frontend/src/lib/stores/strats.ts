import { writable } from "svelte/store";

export const initialState = [
  {
    id: "1",
    submittedBy: "0xB7E98Ae8928047E2D90dE3686Ea8D34c031935D1",
    data: [60, 10, 30],
  },
  {
    id: "2",
    submittedBy: "0xB7E98Ae8928047E2D90dE3686Ea8D34c031935D1",
    data: [60, 10, 30],
  },
  {
    id: "3",
    submittedBy: "0xAf4f3BDe74e49dDF63Dee2a5Df05687e67553D3f",
    data: [60, 20, 20],
  },
  {
    id: "4",
    submittedBy: "0xAf4f3BDe74e49dDF63Dee2a5Df05687e67553D3f",
    data: [60, 22, 18],
  },
  {
    id: "5",
    submittedBy: "0xD75004941Dd01B737f04D2C5c94AE16AC32032eF",
    data: [70, 12, 18],
  },
  {
    id: "6",
    submittedBy: "0xD75004941Dd01B737f04D2C5c94AE16AC32032eF",
    data: [90, 5, 5],
  },
  // {
  //   id: "1",
  //   submittedBy:
  //     "0x054478333586193D177413591900B73AB73dC2F6552e9cD3006f61EC75B2CC2f",
  //   data: [
  //     {
  //       name: "rocket pool",
  //       val: 60,
  //     },
  //     {
  //       name: "euler",
  //       val: 22,
  //     },
  //     {
  //       name: "uniswap",
  //       val: 2,
  //     },
  //     {
  //       name: "wrapped-bitcoin",
  //       val: 2,
  //     },
  //     {
  //       name: "maker",
  //       val: 2,
  //     },
  //     {
  //       name: "filecoin",
  //       val: 2,
  //     },
  //     {
  //       name: "aave",
  //       val: 2,
  //     },
  //     {
  //       name: "curve-dao-token",
  //       val: 2,
  //     },
  //     {
  //       name: "nexo",
  //       val: 2,
  //     },
  //     {
  //       name: "the-graph",
  //       val: 2,
  //     },
  //     {
  //       name: "sandclock",
  //       val: 2,
  //     },
  //   ],
  // },
];

export type Strategy = typeof initialState[0];

const strats = writable<Strategy[]>(initialState);

export default strats;
