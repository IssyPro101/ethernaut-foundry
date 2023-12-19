// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

pragma solidity ^0.8.0;
import "../src/MagicNum.sol";
import "forge-std/Script.sol";
import "forge-std/console.sol";

contract DeployBytecode {
    function deployContract() public returns (address) {
        bytes
            memory bytecode = hex"600a600c600039600a6000f3602a60005260206000f3";

        address deployedAddress;
        assembly {
            deployedAddress := create(0, add(bytecode, 0x20), mload(bytecode))
        }

        return deployedAddress;
    }
}

contract MagicNumberSolution is Script {
    MagicNum constant magicNumInstance =
        MagicNum(0xA56C970Ab41C53A95a4CBF8Dedb2cD5cE3C5B30F);

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        DeployBytecode deployByteCode = new DeployBytecode();
        magicNumInstance.setSolver(deployByteCode.deployContract());
        vm.stopBroadcast();
    }
}
