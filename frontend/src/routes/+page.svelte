<script>
  import Button from "$lib/components/Button.svelte";
  import CheckeredBg from "$lib/components/CheckeredBg.svelte";
  import Hero from "$lib/components/Hero.svelte";
  import HowItWorks from "$lib/components/HowItWorks.svelte";
  import Steps from "$lib/components/Steps.svelte";
  import Finiam from "$lib/components/Finiam.svelte";
  import Lever from "$lib/components/icons/Lever.svelte";
  import Github from "$lib/components/icons/Github.svelte";
  import Twitter from "$lib/components/icons/Twitter.svelte";
  import LinkedIn from "$lib/components/icons/LinkedIn.svelte";
  import image3 from "$lib/images/image3.png";
  import image5 from "$lib/images/image5.png";
</script>

<header class="px-36 text-black pt-8 pb-20">
  <nav class="flex justify-end">
    <Button color="orange"><h4><a href="/app">Go to app</a></h4></Button>
  </nav>
  <h1 class="mb-8 mt-8">MATUSALEM...</h1>
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

<section class="bg-orange px-36 py-20 text-beige">
  <h2 class="px-32 text-center">
    "Retirement: world's longest coffee break." Enjoy quality coffee.
  </h2>
</section>

<HowItWorks />

<CheckeredBg class="px-36 py-20 text-black">
  <div class="flex items-center">
    <img
      class="h-52 w-52 self-end mb-4 -mr-2 z-10"
      src={image3}
      alt="old person 3"
    />
    <Steps />
    <img
      class="h-52 w-52 self-start mt-4 -ml-2 z-10"
      src={image5}
      alt="old person 5"
    />
  </div>
  <Button
    color="orange"
    class="mt-12 mx-auto bg-lightPurple"
    ><h4><a href="/app">Try it</a></h4></Button
  >
</CheckeredBg>

<footer class="px-36 py-12 text-black flex justify-around gap-16">
  <div class="inline-flex p-6 items-end gap-4">
    <Lever height="40px" />
    <p
      >Made by <a
        href="https://finiam.com/"
        target="_blank"
        rel="noreferrer"
      >
        <Finiam class="fill-black" />
      </a>
    </p>
  </div>
  <div class="bg-white border w-72 border-black flex flex-col gap-[0.05rem]">
    <h4 class="p-3 border-b border-black">Contact us</h4>
    <div
      class="flex py-5 gap-3 border-t border-black items-center justify-center"
    >
      <a
        href="https://www.linkedin.com/company/finiam/"
        target="_blank"
        rel="noreferrer"
      >
        <LinkedIn class="fill-black" />
      </a>
      <a
        href="https://twitter.com/wearefiniam"
        target="_blank"
        rel="noreferrer"
      >
        <Twitter class="fill-black" />
      </a>
      <a
        href="https://github.com/finiam"
        target="_blank"
        rel="noreferrer"
      >
        <Github class="fill-black" />
      </a>
    </div>
  </div>
</footer>
