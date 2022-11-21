<script lang="ts">
  import { ethers } from "ethers";
  import MetaMask from "$lib/components/icons/MetaMask.svelte";
  import truncateAddress from "$lib/utils/truncateAddress";
  import metamask from "$lib/stores/metamask";
  import contract from "$lib/stores/l1Contract";
  import contractABI from "$lib/data/treasuryAbi.json";

  let userAddress: string | null = null;

  $: $metamask?.getAddress().then((address) => (userAddress = address));

  async function connectWallet() {
    if (window.ethereum) {
      const provider = new ethers.providers.Web3Provider(window.ethereum);

      await provider.send("eth_requestAccounts", []);
      const signer = provider.getSigner();

      metamask.set(signer);

      // Create treasury contract with wallet signer
      if (signer) {
        contract("treasury", {
          addressOrName: "0x727caaeaEfa73D57ffF4Bbf180968210Ace73BF1",
          contractInterface: contractABI,
          signerOrProvider: signer,
        });
      }
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
  <span class="text-14">
    {userAddress ? truncateAddress(userAddress) : "Connect"}
  </span>
</button>
