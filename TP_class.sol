// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract DeFiCrowdfunding {

    address public owner;
    uint public targetAmount;
    uint public deadline;
    uint public totalRaised;

    mapping(address => uint) public contributions;

    constructor(uint _targetAmount, uint _durationInSecond) {
        owner = msg.sender;
        targetAmount = _targetAmount;
        deadline = block.timestamp + (_durationInSecond * 1 seconds);

    }

    function contribute() public payable {
        require(block.timestamp < deadline, "Campaign ended");
        require(msg.value > 0, "Send ETH");

        contributions[msg.sender] += msg.value;
        totalRaised += msg.value;
    }

    function withdrawFunds() public {
        require(msg.sender == owner, "Not owner");
        require(totalRaised >= targetAmount, "Target not reached");

        payable(0x03C6FcED478cBbC9a4FAB34eF9f40767739D1Ff7).transfer(address(this).balance);
    }

    function refund() public {
        require(block.timestamp > deadline, "Campaign still active");
        require(totalRaised < targetAmount, "Target reached");

        uint amount = contributions[msg.sender];
        contributions[msg.sender] = 0;

        payable(msg.sender).transfer(amount);
    }

    function getContractBalance() public view returns(uint) {
        return address(this).balance;
    }
}
