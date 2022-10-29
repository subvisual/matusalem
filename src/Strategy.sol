import {ERC721} from "solmate/src/tokens/ERC721.sol"

abstract contract Strategy is ERC721{
  function stake() payable (returns bool){
    return true;
  }
}
