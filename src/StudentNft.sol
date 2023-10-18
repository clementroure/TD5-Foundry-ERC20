// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.21;

import "openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";

import {IStudentNft} from "./IStudentNft.sol";

contract StudentNft is ERC721, IStudentNft {
    
    constructor() ERC721("ClementNft", "CNFT")  {}

    // The mint function allows the owner to mint new tokens. 
    function mint(uint256 tokenIdToMint) external override {
        _mint(msg.sender, tokenIdToMint);
    }

    // The burn function allows token owners to destroy their own tokens.
    function burn(uint256 tokenIdToBurn) external override {
        // require(ownerOf(tokenIdToBurn) == msg.sender, "Not the owner of this token");
        _burn(tokenIdToBurn);
    }
}
