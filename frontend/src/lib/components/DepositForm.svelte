<script lang="ts">
  import Button from "$lib/components/Button.svelte";
  import Input from "$lib/components/Input.svelte";
  import { account } from "$lib/svark";
  import balance from "$lib/stores/balance";

  let amount: any;
  $: valid = !!amount;

  async function deposit() {
    await account.sign(`Deposit ${amount} ETH`);

    balance.set(amount);
  }
</script>

<h2 class="mb-10">Deposit</h2>
{#if !$balance}
  <p class="mb-4">Looks like you haven't made any deposits yet.</p>
{/if}
<form
  class="bg-white px-16 py-10 pb-14"
  on:submit|preventDefault={deposit}
>
  <h4 class="mb-2">How much</h4>
  <Input
    type="number"
    placeholder="Type here..."
    bind:value={amount}
  />
  <div class="mt-6" />
  <Button
    disabled={!valid}
    color="lightGreen"
    type="submit"
  >
    Deposit
  </Button>
</form>
