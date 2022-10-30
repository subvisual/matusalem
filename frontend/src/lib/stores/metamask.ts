import type { ethers } from "ethers";
import { writable } from "svelte/store";

const metamask = writable<ethers.providers.JsonRpcSigner>();

export default metamask;
