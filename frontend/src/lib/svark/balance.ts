/* eslint-disable no-underscore-dangle */
import type { Abi, AccountInterface } from "starknet";
import type { Subscriber, Unsubscriber } from "svelte/store";
import { get, writable } from "svelte/store";
/* import ERC20 from "$lib/data/ERC20.json"; */
import type { ContractStore } from "./contract";
import contract from "./contract";
import _baseStore from "./_baseStore";
import accountStore from "./accountStore";
import parseUint256 from "$lib/utils/parseUint256";
import balancesStore from "./balancesStore";

const ERC20 = {};

type BalanceWritableStore = {
  loading: boolean;
  success: boolean;
  error: boolean;
  balance: number;
  data: any;
};

export type BalanceStore = {
  getBalance: () => Promise<void>;
  subscribe: (run: Subscriber<BalanceWritableStore>) => Unsubscriber;
};

// Balance store. Receives either a contract or a contract address and a name.
// Creates a store function and adds it to the balances store, so the value
// and current status can be acccessed anywhere in the app by it's name

type ContractProps = {
  address?: string;
  contract?: ContractStore;
};

export default function balance(
  name: string,
  props: ContractProps
): BalanceStore {
  const { address, contract: receivedContract } = props;

  const store = writable({
    loading: false,
    success: false,
    error: false,
    balance: 0,
    data: null,
  });

  const storeActions = _baseStore(store, ({ subscribe, _set }) => {
    const _contract =
      receivedContract ||
      contract("test", {
        contractAddress: address as string,
        abi: ERC20 as Abi,
        providerOrAccount: get(accountStore).account as AccountInterface,
      });

    async function getBalance() {
      _set({
        loading: true,
        error: false,
        success: false,
      });

      try {
        const bal = await get(_contract).balanceOf(get(accountStore).address);

        _set({
          success: true,
          balance: parseUint256(bal.balance),
          data: bal,
        });
      } catch (err) {
        _set({ error: true });
      } finally {
        _set({ loading: false });
      }
    }

    accountStore.subscribe(() => getBalance());

    return {
      subscribe,
      getBalance,
    };
  });

  balancesStore.addBalance(name, storeActions);

  return storeActions;
}
