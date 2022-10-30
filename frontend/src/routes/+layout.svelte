<script>
  import "@fontsource/ibm-plex-mono";
  import "@fontsource/ibm-plex-mono/700.css";
  import "@fontsource/ibm-plex-mono/500.css";
  import "@fontsource/ibm-plex-mono/400.css";
  import "src/assets/app.css";

  import image from "$lib/images/Social.png";
</script>

<svelte:head>
  <meta charset="utf-8" />
  <meta
    name="viewport"
    content="width=device-width, initial-scale=1.0"
  />
  <title>Matusalem - Crypto pension fund</title>
  <link
    rel="icon"
    href="/assets/favicon.svg"
  />
  <meta
    name="description"
    content="Crypto pension fund"
  />
  <meta
    name="og:description"
    content="Crypto pension fund"
  />
  <meta
    name="keywords"
    content="crypto, ethereum, metamask, starknet, pension fund"
  />
  <meta
    name="og:image"
    content={image}
  />
  <meta
    name="twitter:image"
    content={image}
  />
</svelte:head>

<div class="bg-beige h-full antialiased">
  <slot />
</div>
