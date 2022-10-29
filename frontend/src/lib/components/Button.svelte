<script lang="ts">
  export let color:
    | "white"
    | "orange"
    | "beige"
    | "black"
    | "lightGreen"
    | "lightGrey"
    | "lightPurple" = "white";
  export let disabled = false;
  export let href: string | null = null;

  const classStr = `flex items-center gap-4 justify-center bg-${color} p-4 border-4 border-black shadow-black shadow-[4px_4px] active:translate-y-1 active:translate-x-1 active:shadow-none transition-all ${$$restProps?.class}`;
</script>

{#if !href}
  <button
    {disabled}
    {...$$restProps}
    class={classStr}
    on:click
  >
    {#if $$slots.leftIcon}
      <div>
        <slot name="leftIcon" />
      </div>
    {/if}<slot />
  </button>
{:else}
  <a
    {href}
    class={classStr}
  >
    {#if $$slots.leftIcon}
      <div>
        <slot name="leftIcon" />
      </div>
    {/if}<slot />
  </a>
{/if}
