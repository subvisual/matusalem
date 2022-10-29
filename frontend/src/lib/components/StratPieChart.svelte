<script lang="ts">
  import { Pie } from "svelte-chartjs";
  import {
    Chart,
    Title,
    Tooltip,
    Legend,
    ArcElement,
    CategoryScale,
  } from "chart.js";
  import type { bestOptions } from "$lib/data/assetProposal";

  export let assets: typeof bestOptions;

  console.log(assets)

  $: pieData = {
    labels: assets.map((item) => item.name),
    datasets: [
      {
        data: assets.map((item) => item.val),
        borderWidth: 2,
        backgroundColor: [
          "#F7464A",
          "#46BFBD",
          "#FDB45C",
          "#949FB1",
          "#4D5360",
          "#AC64AD",
        ],
      },
    ],
    color: "#e65",
  };

  Chart.register(Title, Tooltip, Legend, ArcElement, CategoryScale);
</script>

<Pie
  data={pieData}
  options={{ responsive: true, animation: false }}
/>
