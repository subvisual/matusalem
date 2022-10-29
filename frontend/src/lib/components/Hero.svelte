<script lang="ts">
  import CheckeredBg from "./CheckeredBg.svelte";
  import image1 from "$lib/images/image1.png";
  import image2 from "$lib/images/image2.png";
  import image3 from "$lib/images/image3.png";
  import image4 from "$lib/images/image4.png";
  import image5 from "$lib/images/image5.png";

  const imgs = [image1, image2, image4, image5];
</script>

<CheckeredBg class="py-10 px-36">
  <div class="grid grid-rows-2 grid-cols-2 gap-3 w-fit">
    {#each imgs as img}
      <img
        src={img}
        alt="old person 1"
      />
    {/each}
  </div>
</CheckeredBg>
