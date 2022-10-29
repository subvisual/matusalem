<script lang="ts">
  export let color:
    | "white"
    | "orange"
    | "beige"
    | "black"
    | "lightGreen"
    | "lightGrey"
    | "lightPurple" = "white";
  export let labels: string[];
  export let rows: string[][];
</script>

<table class="bg-white text-center">
  <thead class="bg-{color}">
    <tr>
      {#each labels as label}
        <th class="px-5 py-4">{label}</th>
      {/each}
    </tr>
  </thead>
  <tbody>
    {#each rows as row}
      <tr>
        {#each row as data}
          <td class="px-4 py-3">{data}</td>
        {/each}
      </tr>
    {/each}
  </tbody>
</table>
