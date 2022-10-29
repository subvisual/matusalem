import { ExternalProvider } from "@ethersproject/providers";

declare global {
  interface Window {
    ethereum?: ExternalProvider;
  }
}

type Colors =
  | "white"
  | "orange"
  | "beige"
  | "black"
  | "lightGreen"
  | "lightGrey"
  | "lightPurple";
