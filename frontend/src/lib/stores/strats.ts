import { get, writable } from "svelte/store";
import { BigNumber } from "ethers";
import { contracts } from "$lib/svark";
import { reduceStrategy } from "$lib/utils/strategyTuple";
import { genId } from "$lib/utils/genId";

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
  {
    id: "7",
    submittedBy: "0xAf4f3BDe74e49dDF63Dee2a5Df05687e67553D3f",
    data: [68, 14, 18],
  },
  {
    id: "8",
    submittedBy: "0xAf4f3BDe74e49dDF63Dee2a5Df05687e67553D3f",
    data: [68, 14, 18],
    assets: [
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
    ],
  },
];

export type Strategy = {
  id: string;
  submittedBy: string;
  data: number[];
  assets?: { name: string; val: number }[];
};

function strategiesStore() {
  const treasuryContract = get(contracts).treasury;

  const { subscribe, update } = writable<Strategy[]>(initialState);

  async function createStrategy(
    assets: {
      name: string;
      val: number;
    }[]
  ) {
    const strategy = reduceStrategy(assets);

    const tuple = strategy.map(BigNumber.from);

    const { from } = await get(treasuryContract).createStrategy(tuple);

    if (!from) return;

    update((strategies: Strategy[]) => [
      ...strategies,
      {
        id: genId(strategies, "id").toString(),
        submittedBy: from,
        data: strategy,
        assets,
      },
    ]);
  }

  function getStrategyAuthor(id: string) {
    let strategy: Strategy | undefined;

    subscribe((strategies) => {
      strategy = strategies.find((strat) => strat.id === id);
    });

    if (!strategy) return "unknown";

    return strategy.submittedBy;
  }

  return {
    subscribe,
    createStrategy,
    getStrategyAuthor,
  };
}

const strats = strategiesStore();

export default strats;
