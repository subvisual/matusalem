<script>
  import { draggable } from "svelte-agnostic-draggable";
  import hand from "$lib/images/hand.png";
  import sliderBtn from "$lib/images/slider-button.png";

  export let value = 0;
  export let mid = false;
  export let progress;
  export let progressDone;

  let touched = false;
  let onPrize;
  let container;

  function onDragMove(event) {
    if (!touched) touched = true;

    const { height } = container.getBoundingClientRect();
    const { top } = event.detail.position;

    const diff = height - top;

    if (diff === height) {
      mid = false;
      progressDone = true;

      /* setTimeout(() => {
        if (!onPrize) progressDone = false;
      }, 3000); */
    } else if (diff < 20) {
      mid = false;
    } else {
      mid = true;
    }

    progress = (diff * 100) / height;

    value = diff;
  }
</script>

<div
  class="relative "
  bind:this={container}
>
  <div class="slider bg-lightGreen border-4 border-lightGreen" />
  <div
    class="draggable Slider-Knob"
    use:draggable={{ containment: "parent" }}
    on:drag:move={onDragMove}
  >
    <img
      src={sliderBtn}
      alt="old person 1"
    />
  </div>
</div>
<img
  style="display: {touched ? 'none' : 'block'}"
  src={hand}
  class="relative top-3 left-2 pulse pointer-events-none"
  alt="old person 1"
/>

<style>
  .slider {
    height: 500px;
    width: 50px;
    filter: drop-shadow(10px 10px 0 #05535f);
  }
  .Slider-Knob {
    cursor: grab;
    display: block;
    position: absolute;
    left: 0px;
    right: 0px;
    margin: auto;
    width: 100%;
    height: 32px;
  }
  .Slider-Knob img {
    transform: scale(1.3);
  }
  .Slider-Knob img:hover {
    transform: scale(1.2);
  }
  @keyframes pulse {
    from {
      transform: scale(0.9);
    }
    to {
      transform: scale(1);
    }
  }
  .pulse {
    animation: pulse 2s linear infinite alternate;
  }
</style>
