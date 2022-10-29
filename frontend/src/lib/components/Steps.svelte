<script lang="ts">
  import RightArrow from "./icons/RightArrow.svelte";
  import LeftArrow from "./icons/LeftArrow.svelte";

  const steps = [
    {
      title: "Connect to your Ethereum wallet",
      description:
        "1. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    },
    {
      title: "Vote on strategy",
      description:
        "2. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    },
    {
      title: "Deposit Ethereum",
      description:
        "3. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    },
  ];
  let current = 0;

  function prevStep() {
    current = current === 0 ? 0 : current - 1;
  }

  function nextStep() {
    current = current >= steps.length - 1 ? steps.length - 1 : current + 1;
  }
</script>

<div class="max-w-full mx-auto border-2 border-black">
  <h4 class="bg-orange flex justify-center p-3 border-b-2 border-black"
    >Steps to become rich</h4
  >
  <div class="bg-lightGreen p-5 pt-7 pb-9">
    <div class="border-[5px] border-black p-1">
      <div class="border-2 min-h-[18rem] border-black p-9">
        <h3 class="mb-3">{steps[current].title}</h3>
        <p>{steps[current].description}</p>
      </div>
    </div>

    <div class="flex justify-center mx-auto mt-6">
      <button
        class="bg-white px-1 border border-black"
        on:click={prevStep}><LeftArrow /></button
      >
      <div class="h-8 flex w-4/5 bg-white border-y border-black">
        <div
          class="h-full border-2 border-black bg-orange"
          style={`width: ${100 / steps.length}% ; transform: translateX(${
            100 * current
          }%)`}
        />
      </div>
      <button
        class="bg-white px-1 border border-black"
        on:click={nextStep}><RightArrow /></button
      >
    </div>

    <div class="flex justify-center mt-8">{current + 1} / {steps.length}</div>
  </div>
</div>
