<script lang="ts">
  import Button from "$lib/components/Button.svelte";
  import StratPieChart from "$lib/components/StratPieChart.svelte";
  import { contracts } from "$lib/svark";
  import proposals from "$lib/stores/proposals";
  import truncateAddress from "$lib/utils/truncateAddress";
  import ReturnArrow from "$lib/components/icons/ReturnArrow.svelte";

  export let data: any;

  $: starknetContract = $contracts.starknet;

  const assets = data.data.map((amount: number, idx: number) => ({
    name: ["rocket pool", "euler", "uniswap"][idx],
    val: amount,
  }));
</script>

<Button
  class="w-fit py-1 px-2 gap-3 mb-6"
  href="/app/strategies"
  color="lightGreen"
>
  <ReturnArrow
    class="fill-black w-7 h-5"
    slot="leftIcon"
  />
  Back
</Button>
<h3>Strategy #{data.id}</h3>
<p>by {truncateAddress(data.submittedBy)}</p>
<div class="w-2/6 mx-auto mb-10">
  <StratPieChart {assets} />
</div>
<Button
  class="mx-auto"
  color="lightGreen"
  type="button"
  disabled={!$starknetContract}
  on:click={() => proposals.createProposal(data.id)}
>
  {$starknetContract
    ? "Propose this strategy"
    : "You must be connected to propose strategies"}
</Button>
