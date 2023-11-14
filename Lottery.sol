// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract Lottery{
    address public manager;
    address payable[] public participants; // Payable because participants will be payable people

    constructor(){
        // msg.sender: global variable
        manager = msg.sender; // The contract deployer is the manager
    }

    // Called when we transfer ether to the smart contract
    // Receive is a special function that we can use only once
    // We use receive function to transfer ether to out contract
    receive() external payable { 
        require(msg.value == 1 ether); // Lottery ticket cost is 1 ether
        participants.push(payable (msg.sender)); // To note down the address of the participant, to reward the winning participant later
    }

    function getBalance() public view returns(uint){
        require(msg.sender == manager); // Only manager can check the contract's balance
        return address(this).balance;
    }
}
