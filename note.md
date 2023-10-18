source .env  (load all the .env var)

forge script script/Deployment.sol:DeploymentScript --rpc-url $RPC_URL --broadcast --verify -vvvv

uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

PRIVATE_KEY is in .env and must add 0x


EXERCICE 2

forge script script/Deployment.sol:DeploymentScript --rpc-url $RPC_URL --broadcast --verify -vvvv

ERC20 TOKEN: 0x26978400e261cA69Ff8011b997E7DE5F6741588c

cast send --private-key $PRIVATE_KEY 0x5cd93e3B0afBF71C9C84A7574a5023B4998B97BE  "registerStudentToken(address)" 0x26978400e261cA69Ff8011b997E7DE5F6741588c --rpc-url $RPC_URL

cast send --private-key $PRIVATE_KEY 0x5cd93e3B0afBF71C9C84A7574a5023B4998B97BE "ex2_mintStudentToken()" --rpc-url $RPC_URL

// Verify

cast call 0x5cd93e3B0afBF71C9C84A7574a5023B4998B97BE "studentToken(address)(address)" 0xf35a912B55c9e023a17cFc5c717725a29CC55d9E --rpc-url $RPC_URL                                                

cast call 0x5cd93e3B0afBF71C9C84A7574a5023B4998B97BE "hasBeenPaired(address)(bool)" 0x26978400e261cA69Ff8011b997E7DE5F6741588c --rpc-url $RPC_URL      

EXERCICE 3

send 0.00..2 goerli to 0x5cd93e3B0afBF71C9C84A7574a5023B4998B97BE

cast send --private-key $PRIVATE_KEY 0x5cd93e3B0afBF71C9C84A7574a5023B4998B97BE  "ex3_mintEvaluatorToken()" --rpc-url $RPC_URL

EXERCICE 4

call SwapRewardToken() without exact output = 5

cast send --private-key $PRIVATE_KEY 0x5cd93e3B0afBF71C9C84A7574a5023B4998B97BE  "ex4_checkRewardTokenBalance()" --rpc-url $RPC_URL

EXERCICE 5

approve reward token 

cast send --private-key $PRIVATE_KEY 0x56822085cf7C15219f6dC404Ba24749f08f34173  "approve(address, uint256)" 0x5cd93e3B0afBF71C9C84A7574a5023B4998B97BE 10000000000000000000 --rpc-url $RPC_URL

cast send --private-key $PRIVATE_KEY 0x5cd93e3B0afBF71C9C84A7574a5023B4998B97BE  "ex5_checkRewardTokenBalance()" --rpc-url $RPC_URL

EXERCICE 6

https://app.uniswap.org/pools/82125

EXERCICE 7

script deploy ERC721
NFT address: 0x06DAA4776CB71f886De17dfF6474769970ca2ba7

EXERCICE 8

cast send --private-key $PRIVATE_KEY 0x5cd93e3B0afBF71C9C84A7574a5023B4998B97BE  "registerStudentNft(address)" 0x06DAA4776CB71f886De17dfF6474769970ca2ba7 --rpc-url $RPC_URL

cast send --private-key $PRIVATE_KEY 0x5cd93e3B0afBF71C9C84A7574a5023B4998B97BE  "ex8_mintNFT()" --rpc-url $RPC_URL

EXERCICE 9

cast send --private-key $PRIVATE_KEY 0x06DAA4776CB71f886De17dfF6474769970ca2ba7  "mint(uint256)" 2 --rpc-url $RPC_URL

cast send --private-key $PRIVATE_KEY 0x5cd93e3B0afBF71C9C84A7574a5023B4998B97BE  "ex9_burnNft()" --rpc-url $RPC_URL

EXERCICE 10

Contract Verified

https://goerli.etherscan.io/address/0x06daa4776cb71f886de17dff6474769970ca2ba7#code

EXERCICE 11

cast send --private-key $PRIVATE_KEY 0x5cd93e3B0afBF71C9C84A7574a5023B4998B97BE --value 0.001ether --rpc-url $RPC_URL

wait 5 hours

cast send --private-key $PRIVATE_KEY 0x5cd93e3B0afBF71C9C84A7574a5023B4998B97BE  "ex11_unlock_ethers() " --rpc-url $RPC_URL
