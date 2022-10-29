import { error } from "@sveltejs/kit";
import { proposals } from "../proposalsMock";

export function load({ params: { id } }: { params: { id: string } }) {
  const proposal = proposals.find((item) => item.id === id);

  if (proposal) {
    return {
      proposal,
    };
  }

  throw error(404, "Not found");
}
