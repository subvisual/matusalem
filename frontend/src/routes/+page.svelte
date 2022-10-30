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

<div class="max-w-screen-xl mx-10 lg:mx-auto">
  <header class=" text-black pt-10 pb-10 flex flex-col lg:block">
    <nav class="flex lg:justify-end order-2 lg:order-1 my-4 lg:my-0">
      <Button
        href="/app"
        color="orange"><h4>Go to app</h4></Button
      >
    </nav>
    <h1 class="mb-4 mt-2 order-1 lg:order-2">MATUSALEM...</h1>
    <div
      class="inline-flex items-center gap-10 p-4 bg-white border-4 border-black shadow-black shadow-[6px_6px] order-3"
    >
      <h3 class="bg-white">Crypto pension fund</h3>
      <div class="lg:w-36 w-2 flex flex-col gap-2">
        <div class="h-[0.375rem] w-full bg-black" />
        <div class="h-[0.375rem] bg-black" />
        <div class="h-[0.375rem] bg-black" />
      </div>
    </div>
  </header>

  <Hero />
</div>

<section class="bg-orange py-20 text-beige mt-10">
  <h2 class="lg:max-w-2xl lg:mx-auto text-center">
    "Retirement: world's longest coffee break." Enjoy quality coffee.
  </h2>
</section>

<div class="max-w-screen-xl mx-10 lg:mx-auto">
  <HowItWorks />
</div>
<CheckeredBg class="py-20 text-black">
  <div class="flex items-center mx-4 lg:mx-20">
    <img
      class="hidden lg:block h-52 w-52 self-end mb-4 -mr-2 z-10"
      src={image3}
      alt="old person 3"
    />
    <Steps />
    <img
      class="hidden lg:block h-52 w-52 self-start mt-4 -ml-2 z-10"
      src={image5}
      alt="old person 5"
    />
  </div>
  <Button
    href="/app"
    color="orange"
    class="mt-12 mx-auto bg-lightPurple w-64"><h4>Try it</h4></Button
  >
</CheckeredBg>

<footer class="py-12 text-black ">
  <div
    class="max-w-screen-lg mx-10 lg:mx-auto flex flex-col lg:flex-row justify-around gap-16"
  >
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
  </div>
</footer>
