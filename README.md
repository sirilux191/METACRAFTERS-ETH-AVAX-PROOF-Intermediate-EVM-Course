# DEGEN Token Contract

DegenToken is a Solidity smart contract that implements an ERC20-compliant token with additional functionalities. It allows users to mint new tokens, transfer and burn tokens, and redeem tokens for specific items. The contract is built using the OpenZeppelin library for enhanced security and standard compliance.

## Description

### Features

- ERC20 Standard: The contract follows the ERC20 standard, which ensures compatibility with various wallets, exchanges, and decentralized applications (dApps).
- Minting Tokens: The contract owner can mint new Degen tokens and assign them to specific addresses.
- Burning Tokens: Token holders can burn their own tokens, reducing the total token supply.
- Token Transfer: Users can transfer Degen tokens from their address to other addresses.
- Redeeming Tokens: Users can redeem Degen tokens for specific items available for purchase.
- Store Items: The contract provides a function to display the available store items for purchase.

### Contract Functions

- mint(address to, uint256 amount): Allows the contract owner to mint new Degen tokens and assign them to the specified address.
- burnTokens(uint256 \_value): Enables token holders to burn a specific amount of their own Degen tokens, reducing the total token supply.
- transferTokens(address \_receiver, uint256 \_value): Allows users to transfer Degen tokens from their address to the specified receiver's address.
- redeemTokens(uint8 \_userChoice): Allows users to redeem Degen tokens for specific items based on their choice.
- showStoreItems(): Displays the available store items for purchase.

## Getting Started

To use the DegenToken contract, you need to follow these steps:

1. Deploy the contract to an AVAX network by compiling and deploying the DegenToken.sol file.
2. Interact with the deployed contract using a tool like Remix, Truffle, or web3.js.

## Executing program

To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g., DegenToken.sol). Copy and paste the following code into the file:

```javascript
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

```

To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.18" (or another compatible version), and then click on the "Compile DegenToken.sol" button.

Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the "DegenToken" contract from the dropdown menu, and then click on the "Deploy" button.

After deploying the contract, you can perform the following actions:

- The Contract Owner Can mint new Degen tokens using the mint function and assign them to specific addresses.
- Token holders can transfer their tokens to other addresses using the transferTokens function.
- Token holders can burn their own tokens using the burnTokens function.
- Users can redeem their Degen tokens for specific items by calling the redeemTokens function and providing the desired item's selection number.
- Users can view the available store items by calling the showStoreItems function.

## Authors

Metacrafter Sirilux
[@AadityaChandankar](https://twitter.com/aadityachandan1)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
