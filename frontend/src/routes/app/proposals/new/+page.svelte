<script lang="ts">
  import Button from "$lib/components/Button.svelte";
  import sleep from "$lib/utils/sleep";
  import { bestOptions, blank } from "$lib/data/assetProposal";
  import ProposalForm from "$lib/components/ProposalForm.svelte";
  import Hourglass from "$lib/components/icons/Hourglass.svelte";

  let loading = false;
  let proposal = [] as typeof bestOptions;

  async function getOptions() {
    loading = true;

    await sleep(2000);

    loading = false;

    proposal = bestOptions;
  }

  async function blankSlate() {
    proposal = blank;
  }
</script>

<h2>New proposal</h2>

{#if loading}
  <div class="mx-auto mt-10 w-10 h-10 relative">
    <div class="absolute hourglass-wrapper">
      <Hourglass />
    </div>
  </div>
{/if}

{#if proposal.length > 0}
  <ProposalForm assets={proposal} />
{:else if !loading && proposal.length === 0}
  <div class="flex my-8">
    <Button
      type="button"
      color="orange"
      class="mr-4"
      on:click={getOptions}
    >
      Calculate best options
    </Button>
    <Button
      type="button"
      color="orange"
      on:click={blankSlate}
    >
      Start from scratch
    </Button>
  </div>
{/if}

<style>
  @keyframes hourglass {
    0% {
      rotate: 0deg;
      scale: 0.9;
    }
    45% {
      scale: 1.15;
    }
    90% {
      rotate: 360deg;
      scale: 0.95;
    }
    100% {
      rotate: 360deg;
      scale: 1;
    }
  }
  .hourglass-wrapper {
    animation: hourglass 1s;
    animation-timing-function: steps(10, end);
  }
</style>
