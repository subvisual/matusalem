pragma solidity >=0.8.0;

import {MockStake} from "./MockStake.sol";

contract MockLido is MockStake {
    constructor() MockStake() {}
}
