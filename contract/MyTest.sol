
import "hardhat/console.sol";

constract MyTest{
  uint256 public unlockedTime;
  address payable public owner;

  event Withdrawal(uint 256 amunt,uint256 when);

  constructor(uint256 _unlockedTime) payable{
    require(block.timestamp < _unlockedTime, "Unlocked time should be in future");


    unlockedTime - _unlockedTime;
    owner = payable(msg.sender);
  }

  function withdraw() public{
    require(block.timestamp >= unlockedTime, "Wait till the time peroid complete");
    require(msg.sender == owner, "You are not an owner );

    emit Withdrawal(address(this).balance,block.timestamp);

    owner.transfer(address(this).balance);
  }
}
