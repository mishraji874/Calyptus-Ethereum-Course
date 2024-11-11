# Liquidity Pools

## What are Liquidity Pools?

In a nutshell, liquidity pools are groups of tokens that are locked in a smart contract. They provide liquidity and are used to facilitate trading by many decentralised exchanges (DEXs).

One of the first projects that introduced liquidity pools was Bancor, but they became widely popularised by Uniswap.

Let’s understand why we need liquidity pools and automated market making before delving into how they work.

## Why Liquidity Pools Are Needed

The order book is the standard on which most cryptocurrency exchanges, like Coinbase and Binance, are based. This is also the way traditional stock exchanges such as NYSE or Nasdaq work.


Buyers and sellers come together in this order book model to submit their orders. Buyers, also known as “bidders,” attempt to acquire a certain asset for the lowest price feasible, whereas sellers aim to sell the same asset for the maximum price possible.

Both buyers and sellers must agree on the price for a trade to take place. This might be accomplished by either a buyer bidding higher or a seller lowering their asking price.

However, what happens if no one is willing to pay a fair price for the goods? What if there aren’t enough of the coins that you want to acquire? This is when market makers come in handy.

Market makers are entities that make it easy to trade an asset by always being willing to buy or sell it. By providing liquidity, they allow users to trade without waiting for another counterparty.

So, why can’t we recreate this same system in decentralised finance?

We can do it, but it would be slow, expensive, and not very user-friendly.

The primary issue with this design is that it requires one or more market makers to always be available to “make the market” in a particular asset. Without market makers, an exchange becomes completely illiquid and is essentially unusable for normal people. 

Moreover, market makers frequently monitor the present value of an asset by perpetually altering their prices, resulting in a large number of orders and order cancellations delivered to an exchange.


The order book exchange cannot survive on Ethereum with a current transaction rate of around 12-15 transactions per second and a block time of 10-19 seconds. Furthermore, every time a smart contract is interacted with, a gas fee is required. Thus, market makers would go broke simply by updating their orders.

## What about layer2 solutions?

Some of the layer2 scaling initiatives, such as Loopring, appear to be promising, but even they are reliant on market makers who might have liquidity difficulties. On top of that, if a user wants to make only a single trade they would have to move their funds in and out of the 2nd layer which adds 2 extra steps to their process.

There had to be an invention that would work well in a decentralised world, and liquidity pools are what fill this need.

## How Do Liquidity Pools Work?

Now that we understand why liquidity pools are essential for decentralised finance, let’s explore how they function.


A single liquidity pool, in its most basic form, contains only two tokens, and each pool generates a new market for that particular pair of tokens. Uniswap’s DAI/ETH is an excellent example of a popular liquidity pool.

When a new pool is established, the first liquidity provider sets the initial price of the assets in the pool. The liquidity provider is incentivised to supply an equal value of both tokens to the pool. 

If the original token price in the pool is different from the current global market price, it creates an opportunity for people to buy low and sell high for a quick profit, which can result in a loss of capital for the person who supplied those tokens originally. This means that providing tokens in the right ratio is vital for all liquidity providers who want to add more money to the pool.

After supplying liquidity to a pool, the liquidity provider (LP) receives tokens called LP in accordance with how much liquidity they supplied. When a trade is facilitated by the pool a certain fee percentage is paid and it is proportionally distributed amongst all the LP token holders. If the liquidity provider wants their initial investment back plus any fees earned, they must “burn” their LP tokens.

According to a deterministic pricing algorithm, each token swap that a liquidity pool executes results in a price change. This algorithm is an automated market maker (AMM), it is a mechanism that enables trading between two or more exchanges. The algorithm used by liquidity pools on different networks may vary somewhat.

Simple liquidity pools, like Uniswap’s, use a constant product market maker algorithm to keep the ratio of quantities for the two supplied tokens consistent. Furthermore, because of the algorithm, a pool can always provide liquidity, regardless of how big a trade is. The main reason for this is that as the required quantity approaches, the algorithm asymptotically raises the price of the token.

The most important thing to remember is that the price of a token is based on the number of tokens in the pool. 

So, for example, if somebody buys ETH from a DAI/ETH pool, they’re reducing the supply of ETH and increasing the supply of DAI. That would cause the price of ETH to go up and the price of DAI to go down. The price fluctuates depending on the trade’s size in relation to the pool’s overall size. If the pool is large in comparison to a trade, then the price impact (a.k.a slippage) will be less. This means that large pools can accommodate bigger trades without moving the price too much.

Larger liquidities create less slippage and result in a better trading experience. So some protocols, such as Balancer, incentivise liquidity providers with extra tokens for supplying liquidity to certain pools. This process is called liquidity mining and we’ll talk about it further in our Yield Farming lesson coming up later in this module.

The ideas behind liquidity pools and automated market making are quite basic, yet they are very powerful because we don’t need a centralised order book or external market makers to provide liquidity to an exchange.

## Different Types of Liquidity Pools

The liquidity pools that we just described are used by Uniswap, and they are perhaps the most simple form of liquidity pools. However, other projects have iterated upon this concept and come up with a few interesting ideas.

For example, Curve realised that the automated market-making mechanism behind Uniswap wasn’t ideal for assets that should have a similar price, such as stable coins or different flavours of the same coin like wETH and sETH. Curve pools, by using a slightly modified algorithm, are able to provide lower costs and less slippage when exchanging these tokens.

Balancer came up with the idea of different liquidity pools, which allow for more than 2 assets in a pool. In fact, Balancer allows for as many as 8 tokens in a single liquidity pool.