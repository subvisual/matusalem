<script lang="ts">
  import { onMount } from "svelte";
  import { goto } from "$app/navigation";
  import Button from "$lib/components/Button.svelte";
  import type { bestOptions } from "$lib/data/assetStrategy";
  import StratPieChart from "./StratPieChart.svelte";
  import { account } from "$lib/svark";
  import strats from "$lib/stores/strats";
  import metamask from "$lib/stores/metamask";

  export let assets: typeof bestOptions;

  $: total = assets.reduce((acc, item) => item.val + acc, 0);
  $: valid = total === 100;

  let assetData: any[] = [];

  onMount(async () => {
    const data = await Promise.all(
      [
        "uniswap",
        "wrapped-bitcoin",
        "maker",
        "filecoin",
        "aave",
        "curve-dao-token",
        "nexo",
        "the-graph",
        "sandclock",
      ].map(async (id) => {
        const req = await fetch(`https://api.coingecko.com/api/v3/coins/${id}`);

        return req.json();
      })
    );

    assetData = data;
  });

  function genId() {
    return Number($strats[$strats.length - 1]?.id || 0) + 1;
  }

  async function handleSubmit() {
    await $metamask.signMessage("Create new strategy");

    strats.update((st) => [
      ...st,
      {
        id: genId().toString(),
        submittedBy: $account.address,
        data: assets,
      },
    ]);

    goto("/app/strategies");
  }
</script>

<form
  class="bg-white p-8 mt-8 flex"
  on:submit|preventDefault={handleSubmit}
>
  <div class="w-2/3">
    {#each assets as target}
      {@const data = assetData?.find((item) => item.id === target.name)}

      <div class="mb-8">
        <div class="flex items-center">
          <div class="flex flex-wrap w-1/3">
            {#if data}
              <img
                class="w-6 h-6 mr-2"
                src={data.image.small}
                alt=""
              />
            {/if}
            <p class=" w-1/4 mr-2 flex-1">{target.name}</p>
            {#if data}
              <p class="w-full">
                <span class="text-green-500">
                  &uarr{data.sentiment_votes_up_percentage}
                </span>
                <span class="text-red-500">
                  &darr{data.sentiment_votes_down_percentage}
                </span>
              </p>
            {/if}
          </div>
          <input
            type="number"
            class="mr-4 w-16 text-center p-2 border-2 border-black"
            placeholder="70%"
            bind:value={target.val}
          />
          <input
            type="range"
            min="0"
            max="100"
            step="1"
            bind:value={target.val}
          />
        </div>
      </div>
    {/each}
  </div>

  <div class="sticky top-2 h-fit">
    <StratPieChart {assets} />
    <div
      class="w-fit mx-auto flex flex-col gap-5
     mt-6"
    >
      {#if valid}
        <p>Looks good</p>
      {:else}
        <p class="text-red-600"
          >The total should be 100%. Right now it's {total}</p
        >
      {/if}
      <Button
        type="submit"
        color="lightGreen">Submit</Button
      >
    </div>
  </div>
</form>

<style>
  input::-webkit-outer-spin-button,
  input::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0;
  }

  input[type="number"] {
    -moz-appearance: textfield; /* Firefox */
  }
</style>
