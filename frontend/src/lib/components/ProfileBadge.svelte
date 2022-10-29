<script lang="ts">
  import { account } from "$lib/svark";
  import truncateAddress from "$lib/utils/truncateAddress";

  let range = 2;
  let showControl = false;

  $: max = range + 6;
  $: color = $account.address.substring(range, max);
</script>

{#if $account.address}
  <div class="flex items-center bg-lightGreen py-2 px-4">
    <button
      class="w-10 h-10 bg-black rounded-full avatar"
      style={`background: #${color}`}
      on:click={() => (showControl = !showControl)}
    />
    <div class="ml-4">
      <p class="text-xs font-bold">My profile</p>
      <p class="text-xs">{truncateAddress($account.address)}</p>
    </div>
    {#if showControl}
      <div class="bg-beige mx-2">
        <input
          bind:value={range}
          type="range"
          min="2"
          max="20"
        />
      </div>
    {/if}
  </div>
{/if}

<style>
  .avatar {
    transition: all 0.1s ease;
  }
</style>
