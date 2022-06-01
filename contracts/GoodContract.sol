// SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;

contract GoodContract {
    mapping(address => uint) public balances;

    // update the balances of the caller
    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }

    // send the eth worth of the caller balance back to the caller
    function withdraw() public {
        require(balances[msg.sender] > 0, "You have insufficient balance");
        (bool sent, ) = msg.sender.call{value: balances[msg.sender]}("");
        require(sent, "Failed to send Ether");
        // This code won't be executed since the contract balance would have been
        // drained by the attacker
        balances[msg.sender] = 0;
    }


}