pragma solidity 0.5.16;

contract Storage {//must remain ummutable.
  mapping (string => uint256) _uintStorage;// new variable can be declared like this: _uintStorage["number"] = 4;
  mapping (string => address) _addressStorage;// new variable can be declared like this: _addressStorage["player1"];
  mapping (string => bool) _boolStorage;// new variable can be declared like this: _boolStorage["success"] = true;
  mapping (string => string) _stringStorage;// new variable can be declared like this: _stringStorage["name"] = "Paul";
  mapping (string => bytes4) _bytesStorage;// new variable can be declared like this: _bytesStorage["code"];
  mapping (string => mapping (string => uint256)) _uintMappingStorage;//new mapping can be declared like this: _uintMappingStorage["name"];
  mapping (string => mapping (string => address)) _addressMappingStorage;// new variable can be declared like this: _addressStorage["player1"];
  mapping (string => mapping (string => bool)) _boolMappingStorage;// new variable can be declared like this: _boolStorage["success"] = true;
  mapping (string => mapping (string => string)) _stringMappingStorage;// new variable can be declared like this: _stringStorage["name"] = "Paul";
  mapping (string => mapping (string => bytes4)) _bytesMappingStorage;
  address public owner;
  bool public _initialized;
}
