pragma solidity >=0.8.0;

interface IMockStake {
    function stake() external payable returns (bool);

    function unstake(uint256 amount) external returns (bool);
}
