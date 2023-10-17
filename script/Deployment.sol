// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.21;

import {Script} from "forge-std/Script.sol";
import {StudentToken} from "../src/StudentToken.sol";

contract DeploymentScript is Script {
    function run() external {
        uint256 deployerPrivateKey = vm.envUint("7ee3653524b95b713788b1118e70b12b653829a7d7");
        vm.startBroadcast(deployerPrivateKey);

        // RewardToken rewardToken = new RewardToken();
        // new Evaluator(rewardToken);

        StudentToken studentToken = new StudentToken();

        vm.stopBroadcast();
    }
}
