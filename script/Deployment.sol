// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.21;

import "forge-std/console.sol";

import {Script} from "forge-std/Script.sol";
import {Evaluator} from "../src/EvaluatorToken.sol";
import {RewardToken} from "../src/RewardToken.sol";
import {StudentToken} from "../src/StudentToken.sol";
import {StudentNft} from "../src/StudentNft.sol";

contract DeploymentScript is Script {
    function setUp() public {}

    function run() external {
        uint256 privateKey = vm.envUint("PRIVATE_KEY");
        // uint256 anvilPrivateKey = vm.envUint("ANVIL_PRIVATE_KEY");

        // address account = vm.addr(privateKey);
        // console.log("Account", account);

        vm.startBroadcast(privateKey);

        // RewardToken rewardToken = new RewardToken();
        // new Evaluator(rewardToken);
        //new StudentToken();
        new StudentNft();

        vm.stopBroadcast();
    }
}
