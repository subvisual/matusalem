<script>
  import Table from "$lib/components/Table.svelte";
  import { deposits } from "$lib/data/deposits";
</script>

<h2 class="mb-8">Activity</h2>

<div class="w-fit mx-auto mb-10">
  <h3 class="text-center mb-4">My Deposits</h3>
  <Table
    color="lightPurple"
    labels={["Timestamp", "Transaction Hash", "Amount"]}
    rows={deposits.map(({ timestamp, transaction_hash: hash, amount }) => [
      new Date(timestamp).toLocaleDateString("en-UK", {
        day: "numeric",
        month: "numeric",
        year: "numeric",
      }),
      hash,
      String(amount).concat(" ETH"),
    ])}
  />
</div>
