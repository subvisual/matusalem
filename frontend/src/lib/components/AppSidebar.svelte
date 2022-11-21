<script lang="ts">
  import Button from "./Button.svelte";
  import CheckeredBg from "./CheckeredBg.svelte";
  import Business from "./icons/Business.svelte";
  import Home from "./icons/Home.svelte";
  import LockKey from "./icons/LockKey.svelte";
  import Mind from "./icons/Mind.svelte";
  import PaperAirplane from "./icons/PaperAirplane.svelte";
  import Proposal from "./icons/Proposal.svelte";
</script>

<nav class="h-full sticky top-0">
  <CheckeredBg class="pt-10 px-20 flex flex-col min-h-screen items-stretch">
    <Button
      color="white"
      class="mb-6 nav-link"
      href="/app"
    >
      <Home
        slot="leftIcon"
        class="fill-black"
      />
      HOME
    </Button>
    <Button
      color="white"
      class="mb-6 nav-link"
      href="/app/strategies"
    >
      <Mind
        slot="leftIcon"
        class="fill-black"
      />
      Strategies
    </Button>
    <Button
      color="white"
      class="mb-6 nav-link"
      href="/app/proposals"
    >
      <Proposal
        slot="leftIcon"
        class="fill-black"
      />
      Proposals
    </Button>
    <Button
      color="white"
      href="/app/deposit"
      class="mb-6 nav-link"
    >
      Deposit
      <LockKey
        slot="leftIcon"
        class="fill-black"
      />
    </Button>
    <Button
      color="white"
      href="/app/withdraw"
      class="mb-6 nav-link"
    >
      <PaperAirplane
        slot="leftIcon"
        class="fill-black"
      />
      Withdraw
    </Button>
    <Button
      color="white"
      href="/app/portfolio"
      class="mb-6 nav-link"
    >
      <Business
        slot="leftIcon"
        class="fill-black"
      />
      Portfolio
    </Button>
  </CheckeredBg>
</nav>
