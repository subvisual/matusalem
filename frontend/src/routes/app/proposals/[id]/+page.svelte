<script lang="ts">
  import Card from "$lib/components/Card.svelte";
  import Button from "$lib/components/Button.svelte";
  import ReturnArrow from "$lib/components/icons/ReturnArrow.svelte";
  import Hand from "$lib/components/icons/Hand.svelte";
  import { account } from "$lib/svark";
  import type { Proposal } from "$lib/stores/proposals";
  import proposals from "$lib/stores/proposals";
  import type { Strategy } from "$lib/stores/strats";
  import StratPieChart from "$lib/components/StratPieChart.svelte";

  export let data: any;

  const { proposal, strategy }: { proposal: Proposal; strategy: Strategy } =
    data;

  const assets = strategy.data.map((amount: number, idx: number) => ({
    name: ["rocket pool", "euler", "uniswap"][idx],
    val: amount,
  }));
</script>

<Button
  class="w-fit py-1 px-2 gap-3 mb-6"
  href="/app/proposals"
  color="lightGreen"
>
  <ReturnArrow
    class="fill-black w-7 h-5"
    slot="leftIcon"
  />
  Back
</Button>
<div class="flex justify-between gap-8">
  <article>
    <h2 class="mb-2">Proposal #{proposal.proposal_id}</h2>
    <div class="flex justify-between mb-14">
      <p>by author</p>
      <div class="w-32 bg-lightGreen">
        <h4 class="text-center">active</h4>
      </div>
    </div>
    <div class="mb-10">
      <h3>Strategy #{strategy.id}</h3>
    </div>
    <StratPieChart {assets} />
  </article>
  <Card color="lightGreen">
    <div class="flex flex-col gap-4 items-center">
      <Button
        class="py-2 w-32 flex justify-start gap-4 mb-3"
        color="white"
        on:click={vote}
      >
        <Hand
          class="w-5 h-8"
          slot="leftIcon"
        />
        <h4 class="uppercase">Vote</h4>
      </Button>
      <span>
        {proposal.vote_list.reduce((acc, curr) => acc + curr, 0)} / 8
      </span>
    </div>
  </Card>
</div>
