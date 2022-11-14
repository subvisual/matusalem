<script lang="ts">
  import Button from "$lib/components/Button.svelte";
  import Card from "$lib/components/Card.svelte";
  import Hand from "$lib/components/icons/Hand.svelte";
  import proposals from "$lib/stores/proposals";
</script>

<div class="flex items-start justify-between">
  <h2>Proposals</h2>
</div>

<div class="flex flex-col gap-5 mt-6">
  {#each $proposals as { strategy_id, finished, vote_list, proposal_id } (proposal_id)}
    <Card color="white">
      <a
        href="/app/proposals/{proposal_id}"
        class="w-full"
      >
        <div class="w-full flex justify-between">
          <div>
            <h3>Proposal #{proposal_id}</h3>
            <p class="mb-3">
              Strategy #{strategy_id}
              <span>by author</span>
            </p>

            <div class="w-32 {finished ? 'bg-orange' : 'bg-lightGreen'}">
              <h4 class="text-center">{finished ? "closed" : "active"}</h4>
            </div>
          </div>

          <div class="flex flex-col items-center justify-center">
            <Button
              class="py-2 w-32 flex justify-start gap-4 mb-3"
              disabled={!!finished}
            >
              <Hand
                class="w-5 h-8"
                slot="leftIcon"
              />
              <h4 class="uppercase">Vote</h4>
            </Button>
            <span>
              {vote_list.reduce((acc, curr) => acc + curr, 0)} / 8
            </span>
          </div>
        </div>
      </a>
    </Card>
  {/each}
</div>
