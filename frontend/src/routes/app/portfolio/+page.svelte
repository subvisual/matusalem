<script lang="ts">
  import DoughnutChart from "$lib/components/DoughnutChart.svelte";
  import LineChart from "$lib/components/LineChart.svelte";
  import Table from "$lib/components/Table.svelte";
  import portfolioData from "$lib/data/portfolio.json";

  const assets = {
    title: "Asset allocation",
    chartData: Object.values(portfolioData.assets),
    labels: Object.keys(portfolioData.assets),
    colors: [
      "#F6815B",
      "#AF2B1E",
      "#2C5545",
      "#E4A010",
      "#898176",
      "#6F8EE6",
      "#B62F1F",
      "#485780",
      "#81A9D5",
      "#D0B314",
      "#D68137",
    ],
  };

  const timeline = {
    title: "Timeline",
    chartData: portfolioData.historical_data.map(({ amount }) => amount),
    labels: portfolioData.historical_data.map(({ timestamp }) =>
      new Date(timestamp).toLocaleDateString("en-UK", {
        day: "numeric",
        month: "numeric",
      })
    ),
    color: "#3F888F",
  };
</script>

<h2 class="mb-5">Portfolio</h2>

<div class="w-[30rem] mx-auto mb-10">
  <h3 class="text-center mb-4">Asset allocation</h3>
  <DoughnutChart {...assets} />
</div>

<div class="w-fit mx-auto mb-10">
  <h3 class="text-center mb-4">Deposits</h3>
  <Table
    color="lightPurple"
    labels={["Timestamp", "Transaction Hash", "Amount"]}
    rows={portfolioData.deposits
      .map(({ timestamp, transaction_hash: hash, amount }) => [
        new Date(timestamp).toLocaleDateString("en-UK", {
          day: "numeric",
          month: "numeric",
          year: "numeric",
        }),
        hash,
        String(amount).concat(" ETH"),
      ])
      .reverse()}
  />
</div>

<div class="w-[30rem] mx-auto mb-10">
  <h3 class="text-center mb-4">Timeline</h3>
  <LineChart {...timeline} />
</div>
