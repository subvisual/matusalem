<script lang="ts">
  import Button from "$lib/components/Button.svelte";
  import Input from "$lib/components/Input.svelte";

  let amount: number;
</script>

<h2 class="mb-10">Deposit</h2>
<form
  class="bg-white px-16 py-10 pb-14"
  on:submit|preventDefault={() => null}
>
  <h4 class="mb-2">How much</h4>
  <Input
    type="number"
    placeholder="Type here..."
    bind:value={amount}
  />
  <div class="mt-6" />
  <Button
    color="lightPurple"
    type="submit"
  >
    Deposit
  </Button>
</form>
