<script lang="ts">
  import { Chart, registerables } from "chart.js";
  import { onMount } from "svelte";
  import { browser } from "$app/environment";

  export let title: string;
  export let chartData: number[];
  export let labels: string[];
  export let colors: string[];

  Chart.register(...registerables);

  const data = {
    labels,
    datasets: [
      {
        label: title,
        data: chartData,
        backgroundColor: colors,
        hoverOffset: 4,
      },
    ],
  };
  const config = {
    type: "doughnut",
    data,
  };

  let chartElement: HTMLCanvasElement;
  onMount(() => {
    if (browser) {
      const chart = new Chart(chartElement, config);
    }
  });
</script>

<canvas bind:this={chartElement} />
