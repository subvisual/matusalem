<script lang="ts">
  import Card from "$lib/components/Card.svelte";
  import Button from "$lib/components/Button.svelte";
  import ReturnArrow from "$lib/components/icons/ReturnArrow.svelte";
  import Hand from "$lib/components/icons/Hand.svelte";

  export let data;
  const {
    proposal: {
      author,
      title,
      status,
      voted,
      createdAt,
      endsAt,
      totalVotes,
      summary,
      abstract,
    },
  } = data;
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
    <h2 class="mb-2">{title}</h2>
    <div class="flex justify-between mb-14">
      <p>{author}</p>
      <div class="w-32 bg-{status === 'active' ? 'lightGreen' : 'orange'}">
        <h4 class="text-center">{status}</h4>
      </div>
    </div>
    <div class="mb-10">
      <h4>Summary</h4>
      <p>{summary}</p>
    </div>
    <div>
      <h4>Abstract</h4>
      <p>{abstract}</p>
    </div>
  </article>
  <Card color={status === "active" ? "white" : "lightGrey"}>
    <div class="flex flex-col gap-4 items-center">
      <Button
        disabled={status !== "active"}
        class="py-2 w-32 flex justify-start gap-4 mb-3"
        color={voted ? "lightGreen" : "white"}
        on:click={() => console.log("click")}
      >
        <Hand
          class="w-5 h-8"
          slot="leftIcon"
        />
        <h4 class="uppercase">{voted ? "Voted" : "Vote"}</h4>
      </Button>
      <!-- {/key} -->
      <p class="text-14 font-bold whitespace-nowrap">Created at: {createdAt}</p>
      <p class="text-14 font-bold whitespace-nowrap">Ends at: {endsAt}</p>
      <p class="text-14 font-bold whitespace-nowrap"
        >Total votes: {totalVotes}</p
      >
    </div>
  </Card>
</div>
