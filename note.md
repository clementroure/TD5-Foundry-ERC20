source .env  (load all the .env var)

forge script script/Deployment.sol:DeploymentScript --rpc-url $RPC_URL --broadcast --verify -vvvv


uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

PRIVATE_KEY is in .env and must add 0x


forge script script/Deployment.sol:DeploymentScript --rpc-url $RPC_URL --broadcast --verify -vvvv

0x1F0aA22B3339Faab23565f8DcADa316aEe56707D