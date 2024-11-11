# Impermanent Loss

At its core, impermanent loss is a temporary financial loss that occurs when you provide liquidity. It’s often explained as the difference between holding an asset and providing liquidity for that asset. In a regular liquidity pool, where the liquidity provider (LP) must supply both assets in an exact ratio, and one of them is volatile in relation to the other, for example, a Uniswap DAI/ETH 50/50 liquidity pool, impermanent loss is typical.

If the value of ETH increases, then the pool has to depend on individuals who will ensure that the price of tokens in the pool reflects what it’s actually worth. When the token’s value goes up, the liquidity provider loses profit. If the LP decides to withdraw its liquidity, the temporary loss becomes permanent. To get a complete understanding of impermanent loss, let’s go through an example.

Let’s say an LP provides liquidity to a 50/50 DAI/ETH Uniswap pool. The LP must give an equal value of both tokens to the pool in order to provide liquidity to a 50/50 pool.


The price of ETH rises on an external exchange such as Coinbase so that the current ETH price on Coinbase is $550. This is when arbitrageurs, other market participants, enter the game. An arbitrageur is an individual who seeks to profit from price differences in markets. In this particular instance, the arbitrageur notices the price difference between Coinbase and Uniswap and sees that as an opportunity for arbitration.

Uniswap regulates the pool’s token levels by using a constant product market maker. In other words, as people buy more ETH from the Uniswap pool, the price of ETH will rise.

Until there is no longer a price difference between the exchanges, the arbitrageur buys cheaper ETH on Uniswap (and sells it on Coinbase to make profit).

## Liquidity Providers profits

Impermanent loss decreases an LP’s profits when the value of one held asset rises in comparison to the other.

What’s the incentive for liquidity providers to give liquidity if impermanent loss can so severely reduce revenue? Let’s look at how LPs may profit from their funds to understand this.

If there were no impermanent loss, LPs would simply be gaining revenue from trading fees. For example, Uniswap charges a 0.3% fee per trade that goes through a liquidity pool – this fee is then distributed to the LPs of that pool in proportion.

This means that the LP can still make money even when experiencing impermanent loss under the condition that impermanent loss < collected fees.

Not only that, but many liquidity pools offer extra motivation for LPs through liquidity mining programs. Liquidity mining allows LPs to earn extra tokens by providing liquidity to pools or using a protocol. The value of the extra tokens in certain circumstances can totally nullify the value of impermanent loss costs, making liquidity providing highly profitable. 

## Other Pools

Would providing liquidity to other pools outside of Uniswap also result in impermanent loss?

Let’s see a few examples.




Curve pools, for example, just contain assets with a value that should be comparable or equivalent. These may be various stable coins such as USDC and DAI or different flavours of the same token such as sBTC, renBTC and wBTC. As a result, such pools provide considerably reduced danger of impermanent loss since there is no asset in the pool that varies in value with respect to the others. This is also why Curve’s liquidity pools, or to be more generic, all the liquidity pools that hold stable assets usually attract significantly more capital than the pools with non-stable assets. 

Another example is Balancer, which offers pools that don’t follow the 50/50 weighted model. This implies that, for example, a large LP may participate in a pool with one token having a much higher weight than the other, such as 80/20 or even 98/2. This can also reduce the impact of impermanent loss depending on the weights in the pool. The larger the weight of a token in the pool, the less significant the difference between holding and providing liquidity in the pool becomes.

Bancor introduced another approach to battle with impermanent loss. Bancor pools may automatically modify their weights according to the external oracles’ prices. This can completely prevent loss due to market fluctuations, even when the pool contains volatile assets.

## Conclusion

It’s evident that there are a variety of methods liquidity providers can use to reduce the impact of impermanent loss. By understanding how these systems work, LPs can better assess whether or not providing liquidity is worth the risk. In some cases, like with stable coins or pools that follow a weighted model, the risks may be minimal and provide considerable benefits through trading fees and liquidity mining programs.