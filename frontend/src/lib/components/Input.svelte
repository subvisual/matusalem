<script lang="ts">
  export let value: any = "";
</script>

<input
  class="border-2 border-black bg-beige px-4 py-3.5"
  {...$$restProps}
  bind:value
/>

<style>
  input::-webkit-outer-spin-button,
  input::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0;
  }

  input[type="number"] {
    -moz-appearance: textfield; /* Firefox */
  }
</style>
