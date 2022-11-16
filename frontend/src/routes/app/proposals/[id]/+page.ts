import { error } from "@sveltejs/kit";
import { get } from "svelte/store";
import proposals, { type Proposal } from "$lib/stores/proposals";
import strats from "$lib/stores/strats";

export function load({ params: { id } }: { params: { id: string } }) {
  const data = get(proposals).find(
    (item: Proposal) => item.proposal_id === Number(id)
  );

  const strategy = get(strats).find(
    (strat) => Number(strat.id) === data?.strategy_id
  );

  if (data) {
    return {
      proposal: data,
      strategy,
    };
  }

  throw error(404, "Not found");
}
