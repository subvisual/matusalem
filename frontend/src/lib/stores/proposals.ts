import { writable } from "svelte/store";

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

const proposals = writable<Proposal[]>(initialState);

export default proposals;
