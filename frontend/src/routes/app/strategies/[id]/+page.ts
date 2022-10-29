import { error } from "@sveltejs/kit";
import { get } from "svelte/store";
import strats from "$lib/stores/strats";

export function load({ params: { id } }: { params: { id: string } }) {
  const data = get(strats)?.find((item) => item.id === id);

  if (data) {
    return {
      data: data.data,
      id,
    };
  }

  throw error(404, "Not found");
}
