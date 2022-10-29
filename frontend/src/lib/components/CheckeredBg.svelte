<script lang="ts">
  let className: string;
  export { className as class };
</script>

<div class="bg-checkered {className}">
  <slot />
</div>
