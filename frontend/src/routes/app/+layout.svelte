<script lang="ts">
  import { goto, afterNavigate } from "$app/navigation";
  import { page } from "$app/stores";
  import AppHeader from "$lib/components/AppHeader.svelte";
  import AppSidebar from "$lib/components/AppSidebar.svelte";
  import Connect from "$lib/components/Connect.svelte";
  import { account } from "$lib/svark";

  afterNavigate(() => {
    if (!$account.connected && $page.routeId !== "/app") {
      goto("/app");
    }
  });
</script>

{#if $account.connected}
  <AppHeader />
  <div class="flex flex-row h-full">
    <AppSidebar />
    <main class="px-10 py-5">
      <slot />
    </main>
  </div>
{:else}
  <Connect />
{/if}
