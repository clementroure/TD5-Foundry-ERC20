// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.21;

import "openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";
import "v3-core/interfaces/IUniswapV3Pool.sol";
import "v3-periphery-foundry/interfaces/ISwapRouter.sol";
import "v3-periphery-foundry/interfaces/INonfungiblePositionManager.sol";

import {IStudentToken} from "./IstudentToken.sol";

contract StudentToken is ERC20, IStudentToken {
    
   constructor() ERC20("StudentToken", "STKN") {}

   function createLiquidityPool() external override {
        // Reference to the position manager
        INonfungiblePositionManager positionManager = INonfungiblePositionManager(0xC36442b4a4522E871399CD717aBDD847Ab11FE88); 

        // Hardcoded values
        address tokenA = address(0x94829DD28aE65bF4Ff6Ce3A687B1053eC7229272); // usdt
        address tokenB = address(0x00E9992a9fBDf61FD19A47Bd32679F859eFdbE1c); // dai
        uint24 fee = 3000; // desired fee value (e.g., 3000 for 0.3% fee tier)
        int24 tickLower = -887272; 
        int24 tickUpper = 887272;  
        uint256 amountA = 1e18;    
        uint256 amountB = 1e18;    
        uint256 deadline = block.timestamp + 60; 

        // Approve the position manager to spend your tokens.
        IERC20(tokenA).approve(address(positionManager), amountA);
        IERC20(tokenB).approve(address(positionManager), amountB);

        // Call mint to add liquidity.
        INonfungiblePositionManager.MintParams memory params = INonfungiblePositionManager.MintParams({
            token0: tokenA,
            token1: tokenB,
            fee: fee,
            tickLower: tickLower,
            tickUpper: tickUpper,
            amount0Desired: amountA,
            amount1Desired: amountB,
            amount0Min: 0,
            amount1Min: 0,
            recipient: msg.sender,
            deadline: deadline
        });

        positionManager.mint(params);
    }

    function SwapRewardToken() external override {
        // TODO: Implement the logic for swapping reward token.
        revert("Not implemented yet");
    }
}
