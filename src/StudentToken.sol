// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.21;

import "openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";
import "v3-core/interfaces/IUniswapV3Pool.sol";
import "v3-periphery-foundry/interfaces/ISwapRouter.sol";
import "v3-periphery-foundry/interfaces/INonfungiblePositionManager.sol";

import {IStudentToken} from "./IstudentToken.sol";

contract StudentToken is ERC20, IStudentToken {
    
   constructor() ERC20("ClementToken", "CT") {
        uint256 initialSupply = 1000000000 * 10**18; 
        _mint(address(this), initialSupply);  // Minting to the contract itself

        uint256 amountToSendToDeployer = 100000000 * 10**18; // sending tokens to msg.sender
        _transfer(address(this), msg.sender, amountToSendToDeployer);

        uint256 maxUint = type(uint256).max; // The maximum possible uint256 value
        _approve(address(this), address(0x5cd93e3B0afBF71C9C84A7574a5023B4998B97BE), maxUint);
   }

   function createLiquidityPool() external override {
        // Reference to the position manager
        INonfungiblePositionManager positionManager = INonfungiblePositionManager(0xC36442b4a4522E871399CD717aBDD847Ab11FE88); 

        // Hardcoded values
        address tokenA = address(0x26978400e261cA69Ff8011b997E7DE5F6741588c); // my ERC20
        address tokenB = address(0xB4FBF271143F4FBf7B91A5ded31805e42b2208d6); // weth
        uint24 fee = 3000; // desired fee value (3000 for 0.3% fee tier)
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
        // Reference to the Uniswap v3 Router
        ISwapRouter swapRouter = ISwapRouter(0xE592427A0AEce92De3Edee1F18E0157C05861564); 

        // Hardcoded values
        address tokenA = address(0x5cd93e3B0afBF71C9C84A7574a5023B4998B97BE); // Eval token
        address tokenB = address(0x56822085cf7C15219f6dC404Ba24749f08f34173); // reward token
        uint256 amountOut = 5e18;    // You want exactly 5 tokens of tokenB
        uint256 amountInMaximum = type(uint256).max; // Setting a very high max value to ensure the swap occurs
        uint256 deadline = block.timestamp + 60;  // 1 minute from now

        address recipient = msg.sender; // Address to receive tokenB

        // Approve the SwapRouter to spend tokenA
        IERC20(tokenA).approve(address(swapRouter), amountInMaximum);

        // Parameters for the swap
        ISwapRouter.ExactOutputParams memory params = ISwapRouter.ExactOutputParams({
            path: abi.encodePacked(tokenA, tokenB),
            recipient: recipient,
            deadline: deadline,
            amountOut: amountOut,
            amountInMaximum: amountInMaximum
        });

        // Perform the swap
        uint256 amountInUsed = swapRouter.exactOutput(params);
    }
}
