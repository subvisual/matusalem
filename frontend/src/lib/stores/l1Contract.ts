import { writable } from "svelte/store";
import { Contract, Signer } from "ethers";
import type { ContractInterface } from "ethers";
import type { Provider } from "@ethersproject/abstract-provider";
import type { Writable } from "svelte/store";
import contractsStore from "../svark/contractsStore";

// Contract instance store. Adds the instance to the balances store, allowing the
// contract to be accessed and methods called from anywhere in the app

export type ContractStore = Writable<Contract>;

type ContractProps = {
  addressOrName: string;
  contractInterface: ContractInterface;
  signerOrProvider?: Signer | Provider;
};

export default function contract(
  name: string,
  config: ContractProps
): ContractStore {
  const store = writable<Contract>(
    new Contract(
      config.addressOrName,
      config.contractInterface,
      config.signerOrProvider
    )
  );

  contractsStore.addContract(name, store);

  return store;
}
