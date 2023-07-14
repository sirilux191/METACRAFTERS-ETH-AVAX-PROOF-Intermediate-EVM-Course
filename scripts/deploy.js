const hre = require("hardhat");

async function main() {
  // Get the DegenToken smart contract
  const DegenToken = await hre.ethers.getContractFactory("DegenToken");

  // Deploy it
  const degentoken = await DegenToken.deploy();
  await degentoken.waitForDeployment();

  // Display the contract address
  const address = await degentoken.getAddress();
  console.log(`DegenToken deployed to ${address}`);
}

// Hardhat recommends this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
