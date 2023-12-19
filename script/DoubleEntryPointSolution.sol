// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/DoubleEntryPoint.sol";
import "forge-std/Script.sol";
import "forge-std/console.sol";

contract AlertBot is IDetectionBot {
    address private cryptoVault;

    constructor(address _cryptoVault) public {
        cryptoVault = _cryptoVault;
    }

    function handleTransaction(
        address user,
        bytes calldata msgData
    ) external override {
        address origSender;
        assembly {
            origSender := calldataload(0xa8)
        }

        if (origSender == cryptoVault) {
            IForta(msg.sender).raiseAlert(user);
        }
    }
}

contract DoubleEntryPointSolution is Script {
    DoubleEntryPoint constant doubleEntryPointInstance =
        DoubleEntryPoint(0x87EF0ee62CB3Ccc4982cAa01B7716Bd4Baef12bD);

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        AlertBot alertBot = new AlertBot(
            doubleEntryPointInstance.cryptoVault()
        );
        Forta forta = doubleEntryPointInstance.forta();
        forta.setDetectionBot(address(alertBot));
        vm.stopBroadcast();
    }
}
