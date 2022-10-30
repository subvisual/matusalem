<script lang="ts">
  import { ethers } from "ethers";
  import MetaMask from "$lib/components/icons/MetaMask.svelte";
  import truncateAddress from "$lib/utils/truncateAddress";
  import metamask from "$lib/stores/metamask";

  let userAddress: string | null = null;

  async function connectWallet() {
    if (window.ethereum) {
      const provider = new ethers.providers.Web3Provider(window.ethereum);

      await provider.send("eth_requestAccounts", []);
      const signer = provider.getSigner();

      userAddress = await signer.getAddress();

      metamask.set(signer);
    } else {
      alert("No ethereum Wallet found");
    }
  }
</script>

<button
  class="bg-white text-black flex items-center gap-2 p-2 border border-black"
  on:click={connectWallet}
  disabled={!!userAddress}
>
  <MetaMask
    class="w-10 h-10"
    slot="leftIcon"
  />
  <span class="text-14"
    >{userAddress ? truncateAddress(userAddress) : "Connect to vote"}</span
  >
</button>
