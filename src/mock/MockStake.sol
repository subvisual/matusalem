pragma solidity >=0.8.0;

abstract contract MockStake {
    uint256 public balance;
    uint256 public multiplier;

    constructor() {}

    function stake() public payable returns (bool) {
        balance = msg.value;
        return true;
    }

    function unstake(uint256 amount) public returns (bool) {
        balance -= amount;

        address payable spender = payable(msg.sender);
        spender.transfer(amount);
        return true;
    }

    function entropy(uint256 value) public payable returns (uint256) {
        balance = value * balance;
    }
}
