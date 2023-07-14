// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

contract DegenToken is ERC20, Ownable, ERC20Burnable {
    // Constructor to initialize the token with name "Degen" and symbol "DGN"
    constructor() ERC20("Degen", "DGN") {}

    // Mint new tokens and assign them to the specified address
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    // Override the decimals function to return 0
    function decimals() override public pure returns (uint8){
        return 0;
    }

    // Get the balance of the caller
    function getBalance() external view returns (uint256){
        return this.balanceOf(msg.sender);
    }
    
    // Transfer tokens from the caller's address to the specified receiver address
    function transferTokens(address _receiver, uint256 _value) external {
        // Check if the caller has enough tokens
        require(balanceOf(msg.sender) >= _value, "You don't have enough Degen Tokens");
        
        // Approve the transfer of tokens from the caller's address
        approve(msg.sender, _value);
        
        // Transfer tokens from the caller to the receiver
        transferFrom(msg.sender, _receiver, _value);
    }

    // Burn tokens from the caller's address
    function burnTokens(uint256 _value) external {
        // Check if the caller has enough tokens
        require(balanceOf(msg.sender) >= _value, "You don't have enough Degen Tokens");
        
        // Burn the specified amount of tokens
        burn(_value);
    }

    // Function to show the available store items for purchase
    function showStoreItems() external pure returns(string memory){
        return ("The following items are available to purchase: Selection 1. Official Degen Gold NFT, Selection 2. Official Degen Silver NFT, Selection 3. Official Degen Bronze NFT , Selection 4. Official Degen Common NFT");
    }

    // Redeem tokens based on the user's choice
    function redeemTokens(uint8 _userChoice) external payable returns (bool) {
        if (_userChoice == 1) {
            // Check if the caller has enough tokens
            require(this.balanceOf(msg.sender) >= 100, "You do not have enough Degen Tokens");
            
            // Approve the transfer of tokens from the caller's address to the contract owner
            approve(msg.sender, 100);
            
            // Transfer tokens from the caller to the contract owner
            transferFrom(msg.sender, owner(), 100);
            
            return true;
        }
        else if (_userChoice == 2) {
            require(this.balanceOf(msg.sender) >= 75, "You do not have enough Degen Tokens");
            approve(msg.sender, 75);
            transferFrom(msg.sender, owner(), 75);
            return true;
        }
        else if (_userChoice == 3) {
            require(this.balanceOf(msg.sender) >= 50, "You do not have enough Degen Tokens");
            approve(msg.sender, 50);
            transferFrom(msg.sender, owner(), 50);
            return true;
        }
        else if (_userChoice == 4) {
            require(this.balanceOf(msg.sender) >= 25, "You do not have enough Degen Tokens");
            approve(msg.sender, 25);
            transferFrom(msg.sender, owner(), 25);
            return true;
        }
        else {
            return false;
        }
    }
}
