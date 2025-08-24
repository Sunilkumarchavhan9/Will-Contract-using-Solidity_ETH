// SPDX-License-Identifier: MIT
pragma solidity  ^0.8.13;


contract VegitoCoin  {
    address public owner;
    uint public totalSupply;
    mapping(address => uint) public balance; // mapping of addresses to balances

    mapping(address => mapping (address => uint)) public allowance; // mapping of addresses to balances
    string public name = "VENGENS";
    string public symbol = "V0";
    uint decimals = 6;//how much we can break dow into decimals of vegitoCoins ex-10.111111

    constructor(){
        owner = msg.sender;
    }
    
    function  approve(address spender, uint256 value) public returns(bool success){
        allowance[msg.sender][spender]  = value;
        return true;

    }
    function  transferFrom(address from , address to, uint value) public returns(bool success) {
        uint allowed = allowance[from][msg.sender];
        require(allowed >= value);

        uint ownerBalance = balance[from];
        require(ownerBalance >= value); // checking if the sender has enough balance to transfer

        balance[from] -= value;
        balance[to] += value;
        allowance[from][msg.sender] -= value;

        return true;
    }

    function mint(uint amount) public{

        require(owner == msg.sender); // can be minted when minter should be owner
        balance[owner] += amount; // updating the the owner has balance
        totalSupply += amount; // how many token owner has minted full  history of minting
    }

    function  transfer(uint amount , address to) public returns(bool success){

        uint exsistingBalance  =  balance[msg.sender]; // getting the balance of the sender
        require(exsistingBalance  >= amount); // checking if the sender has enough balance to transfer
        balance[msg.sender] -= amount;
        balance[to] += amount; // updating the balance of the receiver

        return true;
    }

}