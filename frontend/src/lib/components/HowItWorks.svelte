<script lang="ts">
  import RevSimulator from "./RevSimulator.svelte";
  import img from "$lib/images/old_beard_man_1.png";
</script>

<section class="flex flex-row my-14 px-36">
  <div class="pr-20 w-2/3">
    <img
      alt="Old man with a beard is rich now"
      class="mb-12"
      src={img}
    />
    <h2 class="mb-4">How it works</h2>
    <p class="mb-4">
      You deposit ETH. As you grow old, the ETH pile grows ever larger.
    </p>
    <p class="mb-4">
      All around you, the short sighted fools of this world will throw away
      their money on shitcoins and ugly NFTs. But you - you'll sit tight and
      wait for that sweet sweet retirement.
    </p>
    <p class="mb-4">
      On that day, that's when you withdraw, and get rewarded for your patience
      and wisdom.
    </p>
  </div>
  <div class="w-1/3">
    <RevSimulator />
  </div>
</section>
