// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity ^0.8.15;

import {Script} from "forge-std/Script.sol";

import {Treasury} from "src/Treasury.sol";

/// @notice A very simple deployment script
contract Deploy is Script {
    /// @notice The main script entrypoint
    /// @return treasury The deployed contract
    function run() external returns (Treasury treasury) {
        vm.startBroadcast();
        treasury = new Treasury();
        vm.stopBroadcast();
    }
}
