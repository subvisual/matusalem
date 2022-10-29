<script>
  import { draggable } from "svelte-agnostic-draggable";
  import sliderImg from "$lib/images/slider-bar.png";
  import sliderBtn from "$lib/images/slider-button.png";

  export let value = 0;
  export let mid = false;
  export let progress;

  let container;

  function onDragMove(event) {
    const { height } = container.getBoundingClientRect();
    const { top } = event.detail.position;

    const diff = height - top;

    if (diff < 20 || diff === height) {
      mid = false;
    } else {
      mid = true;
    }

    progress = (diff * 100) / height;

    value = diff;
  }
</script>

<div
  class="relative h-fit slider"
  bind:this={container}
>
  <img
    src={sliderImg}
    alt="old person 1"
  />
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

<style>
  .Slider-Knob {
    cursor: pointer;
    display: block;
    position: absolute;
    left: 0px;
    right: 0px;
    margin: auto;
    width: 100%;
    height: 32px;
  }
</style>
