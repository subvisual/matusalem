<script lang="ts">
  export let color:
    | "white"
    | "orange"
    | "beige"
    | "black"
    | "lightGreen"
    | "lightGrey"
    | "lightPurple" = "white";

  const classStr = `h-fit border-[4px] border-black p-3 bg-${color}  ${$$restProps?.class}`;
</script>

<div class={classStr}>
  <div class="border-2 border-black flex py-4 px-8">
    <slot />
  </div>
</div>
