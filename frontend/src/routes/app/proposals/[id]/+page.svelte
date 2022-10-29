<script lang="ts">
  import Card from "$lib/components/Card.svelte";
  import Button from "$lib/components/Button.svelte";
  import ReturnArrow from "$lib/components/icons/ReturnArrow.svelte";
  import Hand from "$lib/components/icons/Hand.svelte";
  import { account } from "$lib/svark";
  import truncateAddress from "$lib/utils/truncateAddress";

  export let data: any;

  const { proposal } = data;

  async function vote() {
    await account.sign("Vote for this");
  }
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
    <h2 class="mb-2">Proposal #{proposal.id}</h2>
    <div class="flex justify-between mb-14">
      <p>{truncateAddress(proposal.submittedBy)}</p>
      <div class="w-32 bg-lightGreen">
        <h4 class="text-center">active</h4>
      </div>
    </div>
    <div class="mb-10">
      <h4>Summary</h4>
      <p>A really good proposal</p>
    </div>
    <div>
      <h4>Abstract</h4>
      <p>Yes</p>
    </div>
  </article>
  <Card color="black">
    <div class="flex flex-col gap-4 items-center">
      <Button
        class="py-2 w-32 flex justify-start gap-4 mb-3"
        color="white"
        on:click={vote}
      >
        <Hand
          class="w-5 h-8"
          slot="leftIcon"
        />
        <h4 class="uppercase">Vote</h4>
      </Button>

      <!-- <p class="text-14 font-bold whitespace-nowrap">Created at: {createdAt}</p>
      <p class="text-14 font-bold whitespace-nowrap">Ends at: {endsAt}</p>
      <p class="text-14 font-bold whitespace-nowrap"
        >Total votes: {totalVotes}</p
      > -->
    </div>
  </Card>
</div>
