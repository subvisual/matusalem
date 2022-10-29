import { writable } from "svelte/store";
import type { initialState } from "./strats";

type Proposal = typeof initialState[0];

const proposals = writable<any[]>([]);

export default proposals;
