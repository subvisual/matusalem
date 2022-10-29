<script lang="ts">
  import CheckeredBg from "./CheckeredBg.svelte";
  import image1 from "$lib/images/image1b.png";
  import image2 from "$lib/images/image2b.png";
  import image3 from "$lib/images/image3b.png";
  import image4 from "$lib/images/image4.png";
  import image5 from "$lib/images/image5.png";
  import image6 from "$lib/images/image6.png";
  import slider from "$lib/images/slider-bar.png";
  import sliderBtn from "$lib/images/slider-button.png";
  import Hourglass from "./icons/Hourglass.svelte";
  import EthColorful from "./icons/EthColorful.svelte";

  let spinning = true;
  let brightness = 0.1;
  let drop = 0;
  let saturate = 0;
  let overlayOpacity = 0;
  let overlaySize = 0;
  let sx = 0;
  let sliderEl: HTMLDivElement;

  function handleMM(event: MouseEvent) {
    sx = event.clientX;
    const rect = sliderEl.getBoundingClientRect();

    const sliderEnd = rect.y + rect.height;
    const maxY = rect.height - 100;

    const moved = sliderEnd - event.clientY;

    if (moved < 20) {
      sx = 0;
      spinning = false;
    } else if (moved > maxY) {
      sx = maxY;
      spinning = false;
    } else {
      spinning = true;
      sx = moved;
    }

    brightness = (sx * 1.1) / maxY;
    drop = (sx * 30) / maxY;
    saturate = (sx * 1) / maxY;
    overlayOpacity = (sx * 1) / maxY;
    overlaySize = (sx * 300) / maxY;
  }
</script>

<CheckeredBg class="py-10 px-36 mt-14">
  <div class="grid grid-rows-2 grid-cols-4 gap-10 w-fit">
    <div class="relative eth-container">
      <img
        src={image1}
        alt="old person 1"
      />
      <div class="eth-1 absolute icon-wrap">
        <EthColorful
          class="w-full h-full"
          style=" saturate({saturate}); opacity: {overlayOpacity}"
        />
      </div>
      <div
        class="overlay"
        style="opacity: {overlayOpacity}"
      />
    </div>

    <div class="relative eth-container">
      <img
        src={image2}
        alt="old person 2"
      />
      <div class="eth-2 absolute icon-wrap">
        <EthColorful
          class="w-full h-full"
          style="filter: saturate({saturate}); opacity: {overlayOpacity}"
        />
      </div>
      <div
        class="overlay"
        style="opacity: {overlayOpacity}"
      />
    </div>
    <div class="row-span-2 flex justify-between self-center">
      <div class={spinning ? "hourglass-wrapper spin" : "hourglass-wrapper"}>
        <Hourglass />
      </div>

      <div
        class="relative h-fit"
        bind:this={sliderEl}
        on:mousemove={handleMM}
      >
        <img
          src={slider}
          alt="old person 1"
        />
        <button
          type="button"
          class="absolute left-0 right-0 m-auto bottom-14 w-10 h-10"
          style="transform: translateY({sx * -1 + 20}px)"
        >
          <img
            src={sliderBtn}
            alt="old person 1"
          />
        </button>
      </div>
      <div
        class={spinning
          ? "hourglass-wrapper self-end spin"
          : "hourglass-wrapper self-end"}
      >
        <Hourglass />
      </div>
    </div>
    <div class="relative eth-container">
      <img
        src={image3}
        alt="old person 1"
      />
      <div class="eth-3 absolute icon-wrap">
        <EthColorful
          class="w-full h-full"
          style="filter: saturate({saturate}); opacity: {overlayOpacity}"
        />
      </div>
      <div
        class="overlay"
        style="opacity: {overlayOpacity}"
      />
    </div>
    <img
      src={image4}
      alt="old person 1"
    />
    <img
      src={image5}
      alt="old person 1"
    />
    <img
      src={image6}
      alt="old person 1"
    />
  </div>
</CheckeredBg>

<style>
  .eth-1 {
    left: 42%;
    top: 8%;
    margin: auto;
    width: 28px;
    z-index: 100;
  }
  .eth-2 {
    right: 24%;
    bottom: 7%;
    margin: auto;
    width: 38px;
    z-index: 100;
  }
  .eth-3 {
    right: 0;
    left: 0;
    top: 12%;
    margin: auto;
    width: 28px;
    z-index: 100;
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

  .overlay {
    display: block;
    top: 50%;
    left: 50%;
    margin: auto;
    position: absolute;
    width: 400px;
    height: 400px;
    border-radius: 100%;
    background: radial-gradient(#ffffffaa, #ffffff00);
    z-index: 1;
    transform: translate(-50%, -50%);
    animation: overlay-pulse 5s linear alternate-reverse infinite;
    display: none;
  }

  .icon-wrap {
    display: flex;
    align-items: center;
    justify-content: center;
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
