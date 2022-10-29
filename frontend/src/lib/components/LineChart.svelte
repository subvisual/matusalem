<script lang="ts">
  import { Chart, registerables } from "chart.js";
  import { onMount } from "svelte";
  import { browser } from "$app/environment";

  export let title: string;
  export let chartData: number[];
  export let labels: string[];
  export let color: string;

  Chart.register(...registerables);

  const data = {
    labels,
    datasets: [
      {
        label: title,
        data: chartData,
        fill: false,
        borderColor: color,
        tension: 0.1,
      },
    ],
  };

  const config = {
    type: "line",
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
