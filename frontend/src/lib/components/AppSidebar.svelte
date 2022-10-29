<script lang="ts">
  import Button from "./Button.svelte";
  import CheckeredBg from "./CheckeredBg.svelte";
  import Business from "./icons/Business.svelte";
  import Home from "./icons/Home.svelte";
  import LockKey from "./icons/LockKey.svelte";
  import Mind from "./icons/Mind.svelte";
  import PaperAirplane from "./icons/PaperAirplane.svelte";
</script>

<nav class="h-full">
  <CheckeredBg class="pt-10 px-20 flex flex-col items-start min-h-screen">
    <Button
      color="white"
      class="mb-6 nav-link"
      href="/app"
    >
      <Home slot="leftIcon" />
      HOME
    </Button>
    <Button
      color="white"
      class="mb-6 nav-link"
      href="/app/proposals"
    >
      <Mind slot="leftIcon" />
      Proposals
    </Button>
    <Button
      color="white"
      href="/app/deposit"
      class="mb-6 nav-link"
    >
      Deposit
      <LockKey slot="leftIcon" />
    </Button>
    <Button
      color="white"
      href="/app/withdraw"
      class="mb-6 nav-link"
    >
      <PaperAirplane slot="leftIcon" />
      Withdraw
    </Button>
    <Button
      color="white"
      href="/app/portfolio"
      class="mb-6 nav-link"
    >
      <Business slot="leftIcon" />
      Portfolio
    </Button>
  </CheckeredBg>
</nav>
