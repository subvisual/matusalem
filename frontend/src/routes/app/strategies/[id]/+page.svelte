<script lang="ts">
  import Button from "$lib/components/Button.svelte";
  import StratPieChart from "$lib/components/StratPieChart.svelte";
  import proposals from "$lib/stores/proposals";
  import strats from "$lib/stores/strats";
  import { account } from "$lib/svark";

  export let data: any;

  console.log(data)

  async function handleClick() {
    await account.sign(`Propose strategy ${data.id}`);

    proposals.update((st) => [
      ...st,
      $strats.find((item) => item.id === data.id),
    ]);
  }
</script>

<h3>Strategy #{data.id}</h3>
<div class="w-2/4 mx-auto mb-8">
  <StratPieChart assets={data.data} />
</div>
<Button
  color="lightGreen"
  type="button"
  on:click={handleClick}
>
  Propose this strategy
</Button>
