import type { TypedData } from "starknet/dist/utils/typedData";
import { starknetStore } from "$lib/svark";

export function createTypedMessage(message: string): TypedData {
  return {
    domain: {
      name: "Svarknet",
      chainId:
        starknetStore.networkId() === "mainnet-alpha" ? "SN_MAIN" : "SN_GOERLI",
      version: "0.0.1",
    },
    types: {
      StarkNetDomain: [
        { name: "name", type: "felt" },
        { name: "chainId", type: "felt" },
        { name: "version", type: "felt" },
      ],
      Message: [{ name: "message", type: "felt" }],
    },
    primaryType: "Message",
    message: {
      message,
    },
  };
}
