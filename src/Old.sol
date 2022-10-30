pragma solidity >=0.8.0;

import {ERC20} from "lib/solmate/src/tokens/ERC20.sol";

contract Old is ERC20 {
    uint256 public currentSupply;

    constructor() ERC20("Strats", "STRT", 18) {}

    function mint(address to, uint256 value) public {
        currentSupply++;
        _mint(to, value);
    }

    function burn(address from, uint256 value) public {
        _burn(from, value);
    }
}
