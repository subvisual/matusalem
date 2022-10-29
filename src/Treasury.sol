pragma solidity ^0.8.15;

   enum ChickenState{ In, Out, Egg}
contract Treasury  is Strategy, Old{
  public uint256 lockedBucket;
  //public uint256 currentInvestment;
  public uint256 recurrentAmount;
  public uint256 reserveBucket;
  public uint256 FundVirtualOldBalance;
  public uint256 StrategistVirtualOldBalance;
  public uint256 StrategistReserveClaim;
  public ChickenState StrategistChickenState;
  public uint256 chosenStrategy;
  public mapping(uint256 =>uint256) strategyPledge;
  public bool StrategyPledgeLocked;
  public uint256 lockPeriod;
  public uint256 endPeriod;

  function createStrategy() payable (return uint256) {
    require(msg.amount > 0.02);
    uint256 id = mint();
    strategyPledge[id] = msg.amount;

  }

  function submitStrategy(uint256 id) (return uint256) {


  }
  function depositFundsFromL2(uint256 amount) (returns bool) {
    lockedBucket += amount;
    recurrentAmount = amount;

    // update FundVirtualOldBalancce += amount
  }
  function setStrategyFromL2(uint256 strategyId) (returns bool) {
    chosenStrategy = strategyId;
    reserveBucket = strategyPledge[id];
    StrategistReserveClaim = strategyPledge[id];
    StrategistVirtualOldBalancce += strategyPledge[id]
    strategyPledge[id] = 0 ;
    StrategyPledgeLocked = false;

  }

  function applyStrategyFromL2() (returns bool) {

    //currentInvestment = lockedBucket;
    //get erc721 strategy array
    // stake() foreach asset

  }

  function applyStrategyFromBackend() (returns bool) {

  }

  function rebalance(uint256[3] sell,uint256[3] buy, uint256 yieldAmount) {

    //sell for first array amounts
    //buy for secund array amounts  + erc721 strategy array with recurrentAmount
    //transfer yieldAmount to reserve
    // update FundVirtualOldBalancce += 0.8 * yieldAmount
    // update StrategistVirtualOldBalancce += 0.2 * yieldAmount
  }

  function chickenIn(){
    require(block.timestamp > lockPeriod);
    require(msg.sender == ownerOf[strategyId]);
    StrategistReserveClaim  = 0;
    uint balance = StrategistVirtualOldBalance;
    old.mint(balance);
    StrategistVirtualOldBalance = 0;

  }

  function chickenOut(){
    require(block.timestamp > lockPeriod);
    require(msg.sender == ownerOf[strategyId]);
    transfer(StrategistReserveClaim, ownerOf[strategyId]);
    StrategistReserveClaim  = 0;
    StrategistVirtualOldBalance = 0;
  }

  function claimOld(uint256 amount ) {

    uint256 virtualOld = FundVirtualOldBalance + StrategistVirtualOldBalance;
    uint old = Old.totalSupply ;

    //confirmar que nao vai para valores negativos
    uint256 etherToTransfer = (reserveBucket / virtualOld + old) *amount ;

    reserveBucket -= etherToTransfer;

    old.transfer(amount, msg.sender, address(this));
    transfer(etherToTransfer, msg.sender);

  }

  function retire(){
  require(block.timestamp > endPeriod);
  //vende assets todos
  uint256 totalSaleETHAmount = 100;//sell();

  transfer(StrategistReserveClaim, ownerOf[strategyId]);

  totalSaleETHAmount  -= StrategistReserveClaim

  StrategistReserveClaim = 0 ;
  //bridge locked to l2  transfer(lockedBucket)

  totalSaleETHAmount  -= lockedBucket;

  reserveBucket += totalSaleETHAmount;

  // update FundVirtualOldBalancce += 0.8 * totalSaleETHAmount
  // update StrategistVirtualOldBalancce += 0.2 * totalSaleETHAmount


    uint256 virtualOld = FundVirtualOldBalance + StrategistVirtualOldBalance;
    uint old = Old.totalSupply ;

    //confirmar que nao vai para valores negativos
    uint256 etherToTransferFund = (reserveBucket / virtualOld + old) *FundVirtualOldBalance;
    uint256 etherToTransferStrategist = (reserveBucket / virtualOld + old) *StrategistVirtualOldBalance;

    reserveBucket -= etherToTransferFund;
    reserveBucket -= etherToTransferStrategist;

//bridge para l2 etherToTransferFund
    transfer(etherToTransferStrategist, ownerof[StrategyId]);

    FundVirtualOldBalance = 0;
    StrategistVirtualOldBalance = 0;

  }

}
