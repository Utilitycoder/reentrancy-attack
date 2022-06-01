// SPDX-License-Identifier: MIT

pragma solidity ^0.8.6;

import './GoodContract.sol';

contract BadContract {
    GoodContract public goodContract; 

    constructor(address _goodContractAddress) {
        goodContract = GoodContract(_goodContractAddress);
    }


}