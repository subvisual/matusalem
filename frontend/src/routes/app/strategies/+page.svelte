<script lang="ts">
  import Button from "$lib/components/Button.svelte";
  import strats from "$lib/stores/strats";
  import NewIcon from "$lib/components/icons/NewIcon.svelte";
  import Card from "$lib/components/Card.svelte";
  import metamask from "$lib/stores/metamask";
  import truncateAddress from "$lib/utils/truncateAddress";
</script>

<div>
  <h2 class="mb-10">Strategies</h2>

  {#if $metamask}
    <Button
      class="w-max"
      color="lightGreen"
      href="/app/strategies/new"
    >
      <NewIcon slot="leftIcon" />
      <h4 class="uppercase">Create Strategy</h4>
    </Button>
  {:else}
    <p class="w-full">Connect to your metamask wallet to create new strategy</p>
  {/if}
</div>

<div class="flex flex-col gap-5 mt-6">
  {#each $strats as strat}
    <Card color="white">
      <a
        href="/app/strategies/{strat.id}"
        class="w-full"
      >
        <h3>Strategy {strat.id}</h3>
        <p class="text-sm">by: {truncateAddress(strat.submittedBy)}</p>
      </a>
    </Card>
  {/each}
</div>
