# Flash Swaps

Flash Swaps are a core feature of the changes that came with Uniswap V2. To understand flash swaps, we need to revisit our knowledge of how swaps work under the hood. 

We learned earlier that Uniswap pair contracts are programmed quite differently than other smart contracts written in Solidity. They send output tokens to the recipient before enforcing that enough input tokens have been received. This, for many reasons, could be unintuitive for some as our real-world transactions always expect that we pay for something before we receive it. 

However, Ethereum transactions are atomic, which means that if any transactions don’t work in a set of transactions, the network can roll back the entire swap. 

*An atomic transaction is an indivisible and irreducible series of transactions, so all of them either occur or revert.*

Let’s remind ourselves of the interface we use to swap one token for another.

```javascript
function swap(uint amount0Out, uint amount1Out, address to, bytes calldata data);
```

When we are doing a swap, we don’t have the guarantee that the tokens that we are swapping are in the pair contract. Therefore, it is the duty of the msg.caller to check whether the pair actually has the right amount of tokens. Good practice suggests to use the Router contract (that we learned earlier), as the case mentioned above is already taken care of by the logic. 

In the case of a flash swap, tokens do not need to be sent to the contract before calling the swap function.

## Implementing a Flash Swap

To implement a flash swap, we need to use the swap function in a different way. For that, we need to differentiate between a typical trading swap and a flash swap. We could do that by using the data parameter. 

Previously, we haven’t touched the data parameter for a token swap. We can build a logic around this parameter such that for those calls whose data has a zero-length, we would assume that this is a trading swap and that the contract already received the money. We can assume that we will perform a flash swap for anything else. 

Since flash swaps will perform cross-contract calls, we need the Uniswap contract to call other contracts. We could leverage another function in Uniswap to implement this functionality, namely the uniswapV2Call in the Router contract.

```javascript
function uniswapV2Call(address sender, uint amount0, uint amount1, bytes calldata data);
```

We can then pack all the information for our cross-contract call in the data parameter. Examples of parameters that could go into the data parameter include parameters and addresses that could be leveraged during a flash swap. 

More specifically, a Uniswap pair could call uniswapV2Call with the sender argument sent to the msg.sender because the msg.sender, in this case, is the transaction caller of the swap function. The other parameters above are similar when we are doing a token swap. 

Let’s look at the uniswapV2Call to see how we could implement this.

```javascript
function uniswapV2Call(address sender, uint amount0, uint amount1, bytes calldata data) {
    address token0 = IUniswapV2Pair(msg.sender).token0();
    address token1 = IUniswapV2Pair(msg.sender).token1();
    assert(msg.sender == IUniswapV2Factory(factoryV2).getPair(token0, token1));
}
```

As we have seen before, the first two lines of the code get the addresses of the first two tokens, and the asset statement makes sure that the call is actually coming from the pair that has a pool between the desired tokens.

## Repayment in Multi-token

An important part of the puzzle is to ensure that after the flash swap is done, the payment that goes back to the contract must be greater than before. This mechanism is called repayment. More specifically, this means that the product of the pair reserves, the formula we defined in the first chapter, must be greater than before we take out the 0.3% of fees that we distribute to the LPs.

There is a case involved with the repayment: the token withdrawn is not the token returned. A good example would be that the user requested $UNI in the flash swap, but instead, $WETH was returned. This means that the getAmountIn pricing function should be able to calculate the $WETH that must be returned for the amount of $UNI that was requested.

This fee gives the caller a slight advantage, as the fee from the repayment in the corresponding token would be slightly less than the fees driven from the direct token payment (e.g. the amount withdrawn and then directly returned). 