import { get, writable } from "svelte/store";
import { contracts } from "$lib/svark/";
import { genId } from "$lib/utils/genId";

export const initialState = [
  {
    proposalId: "1",
    strategyId: "3",
    finished: "0",
    voteList: ["0", "0", "0", "0", "0", "0", "0", "0"],
  },
  // {
  //   proposalId: 2,
  //   strategyId: 3,
  //   finished: 0,
  //   voteList: [0, 0, 0, 0, 0, 0, 0, 0],
  // },
  {
    proposalId: "3",
    strategyId: "4",
    finished: "0",
    voteList: ["0", "0", "0", "0", "0", "0", "0", "0"],
  },
  {
    proposalId: "4",
    strategyId: "5",
    finished: "0",
    voteList: ["0", "0", "0", "0", "0", "0", "0", "0"],
  },
];

export type Proposal = typeof initialState[0];

function proposalsStore() {
  const starknetContract = get(contracts).starknet;

  const { subscribe, update } = writable<Proposal[]>(initialState);

  async function vote(propId: string) {
    const { transaction_hash: hash } = await get(starknetContract).vote(
      propId,
      1
    );

    if (hash) {
      update((st) =>
        st.map((proposal) =>
          proposal.proposalId === propId
            ? { ...proposal, vote_list: [...proposal.voteList, 1] }
            : proposal
        )
      );
    }
  }

  async function createProposal(strategyId: string) {
    const tx = await get(starknetContract).create_proposal(strategyId);

    if (!tx) return;

    update((proposals: Proposal[]) => [
      ...proposals,
      {
        proposalId: genId(proposals, "proposalId").toString(),
        strategyId,
        finished: "0",
        voteList: ["0", "0", "0", "0", "0", "0", "0", "0"],
      },
    ]);
  }

  return {
    subscribe,
    vote,
    createProposal,
  };
}

const proposals = proposalsStore();

export default proposals;
