pragma solidity >=0.8.0;

import {MockStake} from "./MockStake.sol";

contract MockUniSwapV2 is MockStake {
    constructor() MockStake() {}
}
