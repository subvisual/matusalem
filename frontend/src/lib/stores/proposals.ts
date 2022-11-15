import { get, writable } from "svelte/store";
import { contracts } from "$lib/svark/";

export const initialState = [
  {
    proposal_id: 1,
    strategy_id: 3,
    finished: 0,
    vote_list: [0],
  },
  {
    proposal_id: 3,
    strategy_id: 4,
    finished: 0,
    vote_list: [0],
  },
];

export type Proposal = typeof initialState[0];

function createProposals() {
  const { subscribe, set } = writable<Proposal[]>(initialState);

  async function vote(propId: number) {
    const starknetContract = get(contracts).starknet;

    await get(starknetContract).vote(propId, 1);
    // {code: 'TRANSACTION_RECEIVED', transaction_hash: '0x7307643282d51a46ea88b561809d0f018f79d8c788cbea9bc53f0c5d12a94c8'}
  }

  return {
    subscribe,
    set,
    vote,
  };
}

const proposals = createProposals();

export default proposals;
