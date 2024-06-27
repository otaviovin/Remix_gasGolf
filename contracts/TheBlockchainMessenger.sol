//SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

//How to deploy a contract where only msg.sender who deployed the contract
//can chabge the message and always msg.sender change de message the counter
//counts 1, if you try to send a message as another message sender the message
//will not change and will not count

contract TheBlockchainMessenger {

    //declare variables change changeCounter, owner and theMessage
    uint public changeCounter;
    address public owner;
    string public theMessage;

    //constructor will save owner as msg.sender
    constructor() {
        owner = msg.sender;
    }

    //function where will chanhe the message and count if the msg.sender
    //try to modify the message, is is not the message sender it will not
    //change the message or counter the counter
    function updateTheMessage(string memory _newMessage) public {
        if (msg.sender == owner) {
            theMessage = _newMessage;
            changeCounter++;
            }
    }

}