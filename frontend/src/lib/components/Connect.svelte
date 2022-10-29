<script lang="ts">
  import { connect, account } from "$lib/svark";
  import Button from "./Button.svelte";
</script>

<div class="w-v h-screen bg-beige flex items-center justify-center">
  {$account.address}
  {#if !$connect.success}
    <Button
      color="orange"
      on:click={() => connect.connectWallet()}
      disabled={$connect.loading}
    >
      Connect
    </Button>
  {:else if $account.connected}
    <p>hello, {$account.address}</p>
  {/if}
</div>
