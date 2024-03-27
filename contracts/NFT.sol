// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract NFT is ERC721 {
    // Counter for token IDs
    uint256 private tokenIdCounter;

    constructor() ERC721("R-N-A NFT", "RNA") {
        tokenIdCounter = 0;
    }

    // Function to mint a new NFT
    function mint(address _to) external returns (uint256) {
        uint256 newTokenId = tokenIdCounter++;
        _mint(_to, newTokenId);
        return newTokenId;
    }

    // Add more functions as needed
}
