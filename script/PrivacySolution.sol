// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/Privacy.sol";
import "forge-std/Script.sol";
import "forge-std/console.sol";

contract PrivacySolution is Script {
    Privacy constant privacyInstance =
        Privacy(0x37f4f6f591Ea5f523cb566363B85512063FE92b5);

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        privacyInstance.unlock(
            bytes16(
                bytes32(
                    0xfe2efa2bd9986054e08c873ca7aa2696daa9ad503d24ed81bee396c6bc01331d
                )
            )
        );
        require(privacyInstance.locked() == false);
        vm.stopBroadcast();
    }
}
