// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract WillContract {
    address public Owner;
    address public recepient;
    uint public Lastping;

    constructor(address _recepient) payable {
        Owner = msg.sender;
        recepient = _recepient;
        Lastping = block.timestamp;
    }

    modifier onlyOwner() {
        require(msg.sender == Owner);
        _;
    }

    modifier onlyRecipient() {
        require(msg.sender == recepient);
        _;
    }

    function setRecepient(address _recepient) external onlyOwner {
        recepient = _recepient;
    }

    function Last_visited() external onlyOwner { 
        // to own should prove they are alive or not
        Lastping = block.timestamp;
    }

    function Claim() external onlyRecipient {
        require(block.timestamp > Lastping + 12 months);
        payable(recepient).transfer(address(this).balance);
    }

    function deposite() external payable {}
}
