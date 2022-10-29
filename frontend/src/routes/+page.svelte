<script>
  import Button from "$lib/components/Button.svelte";
  import CheckeredBg from "$lib/components/CheckeredBg.svelte";
  import Hero from "$lib/components/Hero.svelte";
  import HowItWorks from "$lib/components/HowItWorks.svelte";
  import Steps from "$lib/components/Steps.svelte";
  import Finiam from "$lib/components/Finiam.svelte";
  import Lever from "$lib/components/icons/Lever.svelte";
</script>

<header class="px-36 py-9 text-black">
  <nav />
  <h1 class="">MATUSALEM...</h1>
  <div
    class="inline-flex items-center gap-10 p-4 bg-white border-4 border-black shadow-black shadow-[6px_6px]"
  >
    <h3 class="bg-white">Crypto pension fund</h3>
    <div class="w-36 flex flex-col gap-2">
      <div class="h-[0.375rem] w-full bg-black" />
      <div class="h-[0.375rem] bg-black" />
      <div class="h-[0.375rem] bg-black" />
    </div>
  </div>
</header>

<Hero />

<section class="bg-orange px-36 py-12 text-beige">
  <h2 class=" ">
    "Retirement: world's longest coffee break." Enjoy quality coffee.
  </h2>
</section>

<HowItWorks />

<CheckeredBg class="px-36 py-20 text-black">
  <Steps />
  <Button
    color="orange"
    class="mt-12 mx-auto bg-lightPurple"><h4>Try it</h4></Button
  >
</CheckeredBg>

<footer class="px-36 py-12 text-black flex justify-around gap-16">
  <div class="inline-flex p-6 items-end gap-4">
    <Lever height="40px" />
    <p>Made by <Finiam class="fill-black" /> </p>
  </div>
  <div class="bg-white border w-72 border-black flex flex-col gap-[0.05rem]">
    <h4 class="p-3 border-b border-black">Contact us</h4>
    <div class="flex border-t border-black">add socials</div>
  </div>
</footer>
