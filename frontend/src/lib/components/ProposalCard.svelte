<script lang="ts">
  export let color:
    | "white"
    | "orange"
    | "beige"
    | "black"
    | "lightGreen"
    | "lightGrey"
    | "lightPurple" = "white";

  const classStr = `border-2 border-black p-3 bg-${color}  ${$$restProps?.class}`;
</script>

<div class={classStr}>
  <div class="border border-black flex py-4 px-8">
    <slot />
  </div>
</div>
