<script lang="ts">
  import Button from "$lib/components/Button.svelte";
  import Input from "$lib/components/Input.svelte";
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
  <h4 class="mb-2">Wallet address</h4>
  <Input
    type="text"
    placeholder="Type here..."
  />
  <h4 class="mb-2 mt-6">Amount</h4>
  <Input
    type="number"
    placeholder="Type here..."
  />
  <div class="mt-6" />
  <Button
    color={status === "idle" ? "lightPurple" : "orange"}
    type="submit"
    disabled={status === "error"}
  >
    {status === "idle" ? "Withdraw" : "Nice try. Come back in 5 years."}
  </Button>
</form>
