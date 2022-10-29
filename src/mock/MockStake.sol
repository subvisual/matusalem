abstract contract MockStake {
  public uint256 balance;
  public uint256 multiplier;

  function stake() payable (returns bool){
    return true;
  }

  function unstake() (returns bool){
    return true;
  }

  function value() payable (return uint256) {
    return multiplier * balance;
  }
}
