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
  let timeout: ReturnType<typeof setTimeout>;
  let progress = 0;
</script>

<CheckeredBg class="mx-6">
  <div
    class="py-10 my-4 relative border-4 border-orange"
    style="background: #262525ee"
  >
    <div
      class="grid lg:grid-rows-2 lg:grid-cols-4 gap-10 w-fit max-w-screen-xl mx-10 lg:mx-auto"
    >
      <div class="relative img-wrap">
        <img
          src={image1}
          alt="old person 1"
          style="filter: drop-shadow(0px 0px {progress}px #ffeacf)"
        />
      </div>
      <div class="relative img-wrap">
        <img
          src={image2}
          alt="old person 2"
          style="filter: drop-shadow(0px 0px {progress}px #b6e8b6)"
        />
      </div>
      <div class="hidden lg:flex row-span-2 justify-between self-center">
        <div class={spinning ? "hourglass-wrapper spin" : "hourglass-wrapper"}>
          <Hourglass />
        </div>
        <div>
          <SlideThing
            bind:value={sx}
            bind:mid={spinning}
            bind:progress
            bind:progressDone
          />
        </div>

        <div
          class={spinning
            ? "hourglass-wrapper self-end spin"
            : "hourglass-wrapper self-end"}
        >
          <Hourglass />
        </div>
      </div>
      <div class="relative img-wrap">
        <img
          class="hidden lg:block"
          src={image3}
          alt="old person 1"
          style="filter: drop-shadow(0px 0px {progress}px #ffeacf)"
        />
      </div>
      <div class="relative img-wrap">
        <img
          src={image4}
          alt="old person 1"
          class="hidden lg:block"
          style="filter: drop-shadow(0px 0px {progress}px #ffeacf)"
        />
      </div>
      <div class="relative img-wrap">
        <img
          src={image5}
          alt="old person 1"
          class="hidden lg:block"
          style="filter: drop-shadow(0px 0px {progress}px #b6e8b6)"
        />
      </div>
      <div class="relative img-wrap">
        <img
          src={image6}
          alt="old person 1"
          class="hidden lg:block"
          style="filter: drop-shadow(0px 0px {progress}px #b6e8b6)"
        />
      </div>
    </div>

    {#if spinning}
      <h2
        class="absolute inset-0 m-auto text-center pointer-events-none text-lightGreen h-fit flicker tracking-wide"
      >
        Investing {Math.round(progress)}% ...
      </h2>
    {/if}

    {#if progressDone}
      <div
        class="absolute inset-0 m-auto w-fit h-fit bg-white p-10 px-20 prize aspect-square z-10"
        on:mouseenter={() => {
          clearTimeout(timeout);
          progressDone = true;
        }}
        on:mouseleave={() => {
          progressDone = false;
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
  </div>
</CheckeredBg>

<!-- 
  #ffeacf
  #b6e8b6
 -->
<style>
  .img-wrap {
    filter: drop-shadow(4px 4px 0px #fa9579ee);
  }

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
    filter: drop-shadow(4px 4px 0px #232323);
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
