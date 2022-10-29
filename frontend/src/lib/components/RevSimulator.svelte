<script lang="ts">
  import Button from "./Button.svelte";
  import Hourglass from "./icons/Hourglass.svelte";
  import Input from "./Input.svelte";
  import img1 from "$lib/images/dolorean.png";
  import img2 from "$lib/images/treasure.png";

  let submitted = false;
  let hourglassSpinning = true;
  let calculated = false;
  let activeQuote = 0;
  let activeImage = 0;

  const quotes = [
    "I guess you guys aren’t ready for that yet. But your kids are gonna love it.",
    "If my calculations are correct, when this baby hits 88 miles per hour, you're gonna see some serious sh*t",
    "Roads? Where we’re going, we don’t need roads.",
    "It’s your kids, Marty! Something’s gotta be done about your kids!",
    "Great Scott!",
  ];
  const images = [img1, img2];

  function getRandomInt(maxN: number) {
    const max = Math.floor(maxN);

    return Math.floor(Math.random() * (max - 0 + 1)) + 0;
  }

  const sleep = async (time: number) =>
    // eslint-disable-next-line no-promise-executor-return
    new Promise((res) => setTimeout(res, time));

  async function handleSubmit() {
    calculated = false;
    hourglassSpinning = true;
    submitted = true;
    activeQuote = getRandomInt(4);
    activeImage = getRandomInt(1);

    await sleep(1000);

    hourglassSpinning = false;

    await sleep(300);

    calculated = true;
  }
</script>

<form
  class="bg-lightGreen border-2 border-black py-8 px-10"
  on:submit|preventDefault={handleSubmit}
>
  <div class="mb-6">
    <p class="mb-2">Monthly payment</p>
    <Input
      type="number"
      placeholder="0.1 ETH"
    />
  </div>
  <div class="mb-8">
    <p class="mb-2">Withdraw in</p>
    <Input
      type="number"
      placeholder="30 years"
    />
  </div>

  <Button
    type="submit"
    color="orange"
    class="w-full"
  >
    {submitted ? "Re calculate" : "Calculate"}
  </Button>
</form>

{#if submitted && !calculated}
  <div class="mx-auto mt-10 w-10 h-10 relative">
    <div class="absolute {hourglassSpinning && 'hourglass-wrapper'}">
      <Hourglass />
    </div>
  </div>
{/if}

{#if calculated}
  <div
    class="flex items-center justify-center py-8 px-10 bg-lightGrey border-2 border-black border-t-0"
  >
    <div>
      <p class="text-sm text-center mb-4">
        {quotes[activeQuote]}
      </p>
      <img
        src={images[activeImage]}
        alt="delorean"
      />
    </div>
  </div>
{/if}

<style>
  @keyframes hourglass {
    0% {
      rotate: 0deg;
      scale: 0.9;
    }
    45% {
      scale: 1.15;
    }
    90% {
      rotate: 360deg;
      scale: 0.95;
    }
    100% {
      rotate: 360deg;
      scale: 1;
    }
  }
  .hourglass-wrapper {
    animation: hourglass 1s;
    animation-timing-function: steps(10, end);
  }
</style>
