//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";


// This a contract for minting a crypto coin. only the creator will be able to create new coins
// anyone can send coins to each other without creating a username or password, just with 
// thier ethr address key pair

contract Coin{
    // var needed , an address and a ballances
    address public minter;
    mapping(address => uint) public ballances;
    
    event Sent(address from, address to, uint amount);
    
    constructor() {
        minter = msg.sender; // call address
    }
    
    // next we create a function to mint the coins and what does it do.
    // make new coins and send to the owner
    // ensures only the owner can send coins
    
    function mint (address reciever, uint amount) public{
        require(msg.sender == minter); // only the minter can do This
        ballances[reciever] += amount ;// update everytime
        
    }
    // function to send amount to any address
    error insufficientBalance (uint requested, uint available);
    function send(address reciever, uint amount ) public{
        if (amount > ballances[msg.sender])
        revert insufficientBalance({
            requested:amount,
            available:ballances[msg.sender]
        });
        ballances[msg.sender] -= amount;
        ballances[reciever] += amount;
        emit Sent(msg.sender, reciever,amount);
    }
}
