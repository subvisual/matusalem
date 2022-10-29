<script lang="ts">
  import Button from "$lib/components/Button.svelte";
  import NewIcon from "$lib/components/icons/NewIcon.svelte";
  import Card from "$lib/components/Card.svelte";
  import Hand from "$lib/components/icons/Hand.svelte";
  import { proposals } from "./proposalsMock";
  import MetaMaskConnect from "$lib/components/MetaMaskConnect.svelte";

  // move function
  export const handleVote = (ev: MouseEvent, id: string, voted: boolean) => {
    ev.preventDefault();
    const index = proposals.findIndex((proposal) => proposal.id === id);

    if (index < 0) return;

    console.log(voted ? "unvote" : "vote");
    proposals[index].voted = !proposals[index].voted;
  };
</script>

<div class="flex items-start justify-between">
  <h2>Proposals</h2>
  <Button color="lightGreen">
    <NewIcon slot="leftIcon" />
    <h4 class="uppercase">Add Proposal</h4>
  </Button>
</div>

<div class="my-6">
  <MetaMaskConnect />
</div>

<div class="flex flex-col gap-5">
  {#each proposals as { id, author, title, status, voted } (id)}
    <Card color={status === "active" ? "white" : "lightGrey"}>
      <a
        href="/app/proposals/{id}"
        class="w-full"
      >
        <div class="w-full">
          <p>{author}</p>
          <div class="flex justify-between">
            <h3>{title}</h3>
            {#key voted}
              <Button
                disabled={status !== "active"}
                class="py-2 w-32 flex justify-start gap-4"
                color={voted ? "lightGreen" : "white"}
                on:click={(ev) => handleVote(ev, id, voted)}
              >
                <Hand
                  class="w-5 h-8"
                  slot="leftIcon"
                />
                <h4 class="uppercase">{voted ? "Voted" : "Vote"}</h4>
              </Button>
            {/key}
          </div>
          <div class="w-32 bg-{status === 'active' ? 'lightGreen' : 'orange'}">
            <h4 class="text-center">{status}</h4>
          </div>
        </div>
      </a>
    </Card>
  {/each}
</div>
