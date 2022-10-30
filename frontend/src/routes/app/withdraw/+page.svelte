<script lang="ts">
  import Button from "$lib/components/Button.svelte";
  import { account } from "$lib/svark";

  let status: "idle" | "error" = "idle";

  async function withdraw() {
    await account.sign("Withdraw funds");

    status = "error";
  }
</script>

<h2 class="mb-10">Withdraw</h2>

<form
  class="bg-white px-16 py-10 pb-14"
  on:submit|preventDefault={withdraw}
>
  <p class="mb-4">Withdraw all my funds</p>
  <Button
    color={status === "idle" ? "lightPurple" : "orange"}
    type="submit"
    disabled={status === "error"}
  >
    {status === "idle" ? "Withdraw" : "Nice try. Come back in 5 years."}
  </Button>
</form>
