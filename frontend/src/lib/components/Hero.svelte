<script lang="ts">
  import CheckeredBg from "./CheckeredBg.svelte";
  import image1 from "$lib/images/image1.png";
  import image2 from "$lib/images/image2.png";
  import image3 from "$lib/images/image3.png";
  import image4 from "$lib/images/image4.png";
  import image5 from "$lib/images/image5.png";
  import image6 from "$lib/images/image6.png";
  import Hourglass from "./icons/Hourglass.svelte";
  import EthColorful from "./icons/EthColorful.svelte";
  import Button from "./Button.svelte";
  import SlideThing from "./SlideThing.svelte";

  let spinning = false;
  let sx = 0;
  let progressDone = false;
  let onPrize = false;
  let timeout: ReturnType<typeof setTimeout>;
  let progress = 0;

  /* function handleMM(event: MouseEvent) {
    sx = event.clientX;
    const rect = sliderEl.getBoundingClientRect();

    const sliderEnd = rect.y + rect.height;
    const maxY = rect.height - 120;

    const moved = sliderEnd - event.clientY - 56;

    if (moved < 20) {
      sx = 0;
      spinning = false;
    } else if (moved > maxY) {
      sx = maxY;
      spinning = false;
      progressDone = true;

      timeout = setTimeout(() => {
        if (!onPrize) progressDone = false;
      }, 3000);
    } else {
      spinning = true;
      progressDone = false;
      sx = moved;
    }

    saturate = (sx * 1) / maxY;
    overlayOpacity = (sx * 1) / maxY;
  } */
</script>

<div >
  <CheckeredBg class="py-10 mt-4 relative">
    <div
      class="grid lg:grid-rows-2 lg:grid-cols-4 gap-10 w-fit max-w-screen-xl mx-10 lg:mx-auto"
    >
      <div class="relative eth-container">
        <img
          src={image1}
          alt="old person 1"
        />
      </div>
      <div class="relative eth-container">
        <img
          src={image2}
          alt="old person 2"
        />
      </div>
      <div class="hidden lg:flex row-span-2 justify-between self-center">
        <div class={spinning ? "hourglass-wrapper spin" : "hourglass-wrapper"}>
          <Hourglass />
        </div>
        <SlideThing
          bind:value={sx}
          bind:mid={spinning}
          bind:progress
        />

        <div
          class={spinning
            ? "hourglass-wrapper self-end spin"
            : "hourglass-wrapper self-end"}
        >
          <Hourglass />
        </div>
      </div>

      <img
        class="hidden lg:block"
        src={image3}
        alt="old person 1"
      />
      <img
        src={image4}
        alt="old person 1"
        class="hidden lg:block"
      />
      <img
        src={image5}
        alt="old person 1"
        class="hidden lg:block"
      />
      <img
        src={image6}
        alt="old person 1"
        class="hidden lg:block"
      />
    </div>

    {#if spinning}
      <h2
        class="absolute inset-0 m-auto text-center pointer-events-none text-black h-fit flicker tracking-wide"
      >
        Investing...
      </h2>
    {/if}

    {#if progressDone}
      <div
        class="absolute inset-0 m-auto w-fit h-fit bg-white p-10 px-20 prize aspect-square z-10"
        on:mouseenter={() => {
          clearTimeout(timeout);
          progressDone = true;
          onPrize = true;
        }}
        on:mouseleave={() => {
          progressDone = false;
          onPrize = false;
        }}
      >
        <div class="prize-flicker">
          <EthColorful class="h-20 w-20 mx-auto" />
        </div>
        <Button
          color="orange"
          class="mt-12 mx-auto bg-lightPurple"
        >
          <h4><a href="/app">Try it</a></h4>
        </Button>
      </div>
    {/if}
  </CheckeredBg>
</div>

<style>
  @keyframes pulse {
    from {
      transform: scale(0.9);
    }
    to {
      transform: scale(1.05);
    }
  }

  @keyframes overlay-pulse {
    from {
      width: 300px;
      height: 300px;
    }
    to {
      width: 350px;
      height: 350px;
    }
  }

  @keyframes rotate {
    from {
      transform: rotate(0deg);
    }
    to {
      transform: rotate(360deg);
    }
  }

  @keyframes flicker {
    0% {
      opacity: 0;
    }
    50% {
      opacity: 0;
    }
    51% {
      opacity: 1;
    }
    100% {
      opacity: 1;
    }
  }

  .flicker {
    animation: flicker 0.8s infinite;
    filter: drop-shadow(4px 4px 0px #d8fbd7);
  }
  .prize {
    filter: drop-shadow(4px 4px 0px #eac0e9);
  }
  .prize-flicker {
    animation: flicker 0.4s infinite;
  }
  .hourglass-wrapper {
    width: fit-content;
    height: fit-content;
  }
  .spin {
    animation: rotate 1s infinite linear;
    animation-timing-function: steps(10, end);
  }
</style>
