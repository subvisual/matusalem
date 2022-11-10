<script lang="ts">
  import { BigNumber } from "ethers";
  import Button from "$lib/components/Button.svelte";
  import StratPieChart from "$lib/components/StratPieChart.svelte";
  import { contracts } from "$lib/svark";
  import { strategyTuple } from "$lib/utils/strategyTuple";

  export let data: any;

  const strategy = strategyTuple(data.data);

  $: treasuryContract = $contracts.treasury;

  async function handleClick() {
    const tuple = strategy.map((amount) => BigNumber.from(amount));

    const { hash } = await $treasuryContract.createStrategy(tuple);

    console.log(hash);
  }
</script>

<h3>Strategy #{data.id}</h3>
<div
  class="w-2/4 mx-auto mb-10
"
>
  <StratPieChart assets={data.data} />
</div>
<Button
  class="mx-auto"
  color="lightGreen"
  type="button"
  disabled={!$treasuryContract}
  on:click={handleClick}
>
  {$treasuryContract
    ? "Propose this strategy"
    : "You must be connected to propose strategies"}
</Button>
