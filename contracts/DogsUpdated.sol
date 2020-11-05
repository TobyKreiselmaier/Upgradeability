pragma solidity 0.5.16;

import "./Dogs.sol";

contract DogsUpdated is Dogs {//inheriting everything from old contract
                              //only new functionality is added
  //don't define any state variables here. It would corrupt storage.

  constructor() public {
    initialize(msg.sender);
  }

  function initialize(address _owner) public {//this ensures the proxy has the
    require(!_initialized);                   //correct owner through delegatecall.initialize
    owner = _owner;                           //can only run once
    _initialized = true;                      //can't use onlyOwner, bc owner not set yet
  }
}
