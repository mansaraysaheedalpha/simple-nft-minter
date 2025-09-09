// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract NftMinter is ERC721 {
  // --- State Variables ---
    uint256 public constant MINT_PRICE = 0.01 ether;
    address public owner;
    uint256 private _tokenIds;



    

  
