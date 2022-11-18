<script lang="ts">
  import Button from "$lib/components/Button.svelte";
  import Card from "$lib/components/Card.svelte";
  import Hand from "$lib/components/icons/Hand.svelte";
  import proposals from "$lib/stores/proposals";
  import strats from "$lib/stores/strats";
  import truncateAddress from "$lib/utils/truncateAddress";

  function vote(ev: MouseEvent, propId: string) {
    ev.preventDefault();
    proposals.vote(propId);
  }
</script>

<div class="flex items-start justify-between">
  <h2>Proposals</h2>
</div>

<div class="flex flex-col gap-5 mt-6">
  {#each $proposals as { strategyId, finished, voteList, proposalId } (proposalId)}
    <Card color="white">
      <a
        href="/app/proposals/{proposalId}"
        class="w-full"
      >
        <div class="w-full flex justify-between">
          <div>
            <h3>Proposal #{proposalId}</h3>
            <p class="mb-3">
              Strategy #{strategyId}
              <span
                >by {truncateAddress(
                  strats.getStrategyAuthor(strategyId)
                )}</span
              >
            </p>

            <div
              class="w-32 {Number(finished) ? 'bg-orange' : 'bg-lightGreen'}"
            >
              <h4 class="text-center"
                >{Number(finished) ? "closed" : "active"}</h4
              >
            </div>
          </div>

          <div class="flex flex-col items-center justify-center">
            <Button
              class="py-2 w-32 flex justify-start gap-4 mb-3"
              disabled={!!Number(finished)}
              on:click={(ev) => vote(ev, proposalId)}
            >
              <Hand
                class="w-5 h-8"
                slot="leftIcon"
              />
              <h4 class="uppercase">Vote</h4>
            </Button>
            <span>
              {voteList.reduce((acc, curr) => acc + Number(curr), 0)} / 8
            </span>
          </div>
        </div>
      </a>
    </Card>
  {/each}
</div>
