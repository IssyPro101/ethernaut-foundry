// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/Level0.sol";
import "forge-std/Script.sol";
import "forge-std/console.sol";

contract Level0Solution is Script {
    Level0 public level0 = Level0(0x6B885858bD3cA164096a211fC25E05C87f187E00);

    function run() external {
        string memory password = level0.password();
        console.log("Password: ", password);
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        level0.authenticate(password);
        vm.stopBroadcast();
    }
}
