import { error } from "@sveltejs/kit";
import { get } from "svelte/store";
import proposals, { type Proposal } from "$lib/stores/proposals";
import strats from "$lib/stores/strats";

export function load({ params: { id } }: { params: { id: string } }) {
  const data = get(proposals).find((item: Proposal) => item.proposalId === id);

  const strategy = get(strats).find((strat) => strat.id === data?.strategyId);

  if (data) {
    return {
      proposal: data,
      strategy,
    };
  }

  throw error(404, "Not found");
}
