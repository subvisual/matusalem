<script lang="ts">
  import Button from "$lib/components/Button.svelte";
  import strats from "$lib/stores/strats";
  import NewIcon from "$lib/components/icons/NewIcon.svelte";
  import Card from "$lib/components/Card.svelte";
</script>

<div class="flex items-start justify-between mb-6">
  <h2>Strategies</h2>
  <Button
    color="lightGreen"
    href="/app/strategies/new"
  >
    <NewIcon slot="leftIcon" />
    <h4 class="uppercase">Add Strategy</h4>
  </Button>
</div>

<div class="flex flex-col gap-5">
  {#each $strats as strat}
    <Card color="white">
      <a
        href="/app/strategies/{strat.id}"
        class="w-full"
      >
        <h3>Strategy {strat.id}</h3>
        <p class="text-sm">by: {strat.submittedBy}</p>
      </a>
    </Card>
  {/each}
</div>
