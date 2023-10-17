// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.21;

import "openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";
import "openzeppelin-contracts/contracts/access/Ownable.sol";

import {IStudentNft} from "./IStudentNft.sol";

contract StudentNft is ERC721, IStudentNft, Ownable {
    
    constructor() ERC721("StudentNft", "STNFT") Ownable(msg.sender) {}

    // The mint function allows the owner to mint new tokens. 
    function mint(uint256 tokenIdToMint) external override onlyOwner {
        _mint(msg.sender, tokenIdToMint);
    }

    // The burn function allows token owners to destroy their own tokens.
    function burn(uint256 tokenIdToBurn) external override {
        require(ownerOf(tokenIdToBurn) == msg.sender, "Not the owner of this token");
        _burn(tokenIdToBurn);
    }
}
