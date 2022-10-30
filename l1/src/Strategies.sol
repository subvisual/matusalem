pragma solidity >=0.8.0;

import {ERC721} from "lib/solmate/src/tokens/ERC721.sol";

import "openzeppelin-contracts/utils/Strings.sol";

contract Strategies is ERC721 {
    using Strings for uint256;

    struct Strategy {
        uint256 amount1;
        uint256 amount2;
        uint256 amount3;
    }

    mapping(uint256 => Strategy) public strategies;
    string public baseURI;
    uint256 tokenId;

    constructor() ERC721("Strats", "STRT") {
        baseURI = "https://ipfs.io/ipfs/bafybeichnqc4nsgq632q4lzkw7niefhhlkx6uyunjpqfipibuqk6fivuoe/";
    }

    function mint(address to, Strategy memory strategy) public returns (uint256) {
        _mint(to, ++tokenId);
        strategies[tokenId] = strategy;
        return tokenId;
    }

    function burn(uint256 _tokenId) public {
        _burn(_tokenId);
    }

    function tokenURI(uint256 _tokenId) public view override returns (string memory) {
        return string(abi.encodePacked(baseURI, _tokenId.toString()));
    }

    function getStrategy(uint256 chosenStrategy) public view returns (uint256[3] memory) {
        Strategy memory strategy;
        strategy = strategies[chosenStrategy];
        return [strategy.amount1, strategy.amount2, strategy.amount3];
    }
}
