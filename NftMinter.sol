// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract NftMinter is ERC721 {
  // --- State Variables ---
    uint256 public constant MINT_PRICE = 0.01 ether;
    address public owner;
    uint256 private _tokenIds;

    // --- Constructor ---
    constructor() ERC721("MyHackathonNFT", "MHN") {
        owner = msg.sender;
    }

// --- Mint Function ---
    function mint() public payable {
        require(msg.value == MINT_PRICE, "Incorrect ETH amount sent.");
        
        _tokenIds++;
        uint256 newItemId = _tokenIds;
        
        _safeMint(msg.sender, newItemId);
    }

    // --- Owner-Only Functions ---
    modifier onlyOwner() {
        require(msg.sender == owner, "You are not the owner.");
        _;
    }

    function withdraw() public onlyOwner {
        uint256 balance = address(this).balance;
        (bool success, ) = owner.call{value: balance}("");
        require(success, "Transfer failed.");
    }
}



    

  
