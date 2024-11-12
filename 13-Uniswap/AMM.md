# Automated Market Makers (AMMs)

## A Traditional Introduction to Market Making

Traditional markets have depended on intermediaries for centuries. Market makers that control the flow of one good to another, or one currency to another allowed markets to operate sub-optimally and take profits out of the exchange between two parties. 

Smart contracts allow markets to operate optimally without an extraction by a third party in the exchange process. 

In a more technical fashion, a market maker is a participant in quote-driven financial instrument trading environments (e.g. currency, stocks & shares or bond markets) that fulfil the function of generating bids and offers. Their role is to ensure that there is liquidity in the market by consistently quoting, buying, and selling prices, therefore ensuring that there exists a marketplace with two sides. 

As you can imagine, market liquidity tends to be asymmetrical over time. It is usually very high during bull markets as many parties get into the buy-and-sell activity. Nonetheless, it tends to be very thin in a bear market as there is significantly less buy-and-sell activity. For that reason, market makers in traditional markets are usually large banks or financial institutions that can provide that liquidity regardless of bad or good times.

It is the market maker’s duty to provide stability, liquidity, and transparency (through a price discovery mechanism) to the financial markets, and therefore they are a very important participant in global markets. 

As we have mentioned earlier, there is a single point of failure in such a market setup. The market maker, who is the most important facilitator in this process, could be corrupted. Therefore, we need a mechanism that preserves stability, liquidity, and transparency while removing the need for a mediator/middle-man. 

It’s for this reason, we have automated market makers (AMMs).

## Uniswap: The Ultimate AMM

Traditional finance relies on orderbooks. An orderbook is a traditional exchange model, where parties trade against other parties. There is a list of open buy and sell orders on the market, and the exchange’s job is to match these orders. A typical orderbook looks like the below, where you can see the buy orders on the left, and the sell orders on the right. Traditional exchanges operate this way to achieve price discovery. Similarly, centralised crypto exchanges, such as Binance and Coinbase, also function like this. 

Uniswap, as mentioned earlier, is a DEX powered by AMM technology. For us to be able to explain Uniswap code and mathematics easily, we should acknowledge that an AMM needs to have the following properties:

- Anyone willing to add liquidity to become an LP should be able to do so.
- Liquidity providers don’t have to lock their capital, meaning they can remove liquidity and retain their assets whenever they want.
- Users can swap one asset for another, provided that there is enough liquidity.
- Users are charged a small fee when swapping one asset for another. This allows LPs to earn some assets back by providing assets to the liquidity pool. 

These requirements are considerably different from how an orderbook functions in traditional finance. 

## Constant Product Formula: How does Uniswap perform price discovery?

Although Uniswap might seem quite complex, it is actually governed by one remarkably straightforward formula, what many people call the constant product formula. The formula is as follows:

```
x * y = k
```

Let’s assume a liquidity pool exists between ETH and UNI. Then, we could look at this pool by assigning x to the reserve balance of ETH and y to the reserve balance of UNI in the trading pool. In this case, k is just a constant assigned to the pool. 

Whether we assign x to ETH or y to ETH is irrelevant as long as we assign one variable to the asset and the other variable to the other asset. 

Let’s assume that a user comes to Uniswap and wants to sell Δx amount of ETH to the pool. At this point, we already know the reserves in the pool, namely x and y, and we also know k, since that’s a constant. To understand how much y this swap would give back to the user, we need to define and calculate a new variable, which we will call Δy. 

With the new swap, the formula should look like this:

```
(x + ^x) * (y - ^y) = k
```

Since we are trying to find  Δy, we can arrange the above formula and arrive at the following function for all known variables at the end of the swap:

```
^y = y * ^x / x + ^x
```

Exercise: Program a function in Solidity that finds the number of y tokens that should be given back for any swap with the inputs x, y, and  Δx.

We have now arrived at a function that allows us to find Δy given that we would like to sell Δx. It’s worth mentioning that the constant product formula is a hyperbola, meaning that x or y will never be equal to 0. That’s great news! This means that none of the trades would decrease the number of reserves to 0 for neither y nor x. 

Here’s a practical example. Let’s hypothetically assume that there exists a liquidity pool between ETH and UNI. For this example, we will say that the reserves are 100 ETH (x)  and 200 UNI tokens (y). A trader could try to “drain” this pool by selling 200 ETH to the pool. 


If you plug these values directly into the formula mentioned above, you will find that we would get Δy = 133.33, meaning that the constant product formula ensures that the liquidity pool would never be drained but also causes something we call slippage because it changes the price of the asset quite drastically when large quantities are being traded in that liquidity pool.  

Definition: Slippage generally means the change in token price caused by the total movement of the market. It refers to the difference between the expected price of a trade and the price at which the trade is executed.

You can see that this determines the price between two assets and also does this in a permissionless, decentralised manner – a huge improvement to our current financial system. A careful reader would ask the question who sets the initial price between these tokens… 

As you would predict, whenever a pool is created, the balance of that pool for each reserve is equal to zero. This means that the first LP coming to the pool would determine the price of that asset. In fact, the first LP is incentivized to provide liquidity at the correct market rate because otherwise,  this creates an arbitrage opportunity for others to come. 

Definition: In finance, arbitrage is taking advantage of a different in prices in two or more  markets to make a profit. A good example would be buying something cheap in one market, and selling the same good/service for more than you spent in the other market.

When an LP deposits assets into a liquidity pool, they get LP tokens representing its position in a given pool. For Uniswap V1, these LP tokens are ERC-20 tokens. The larger the deposits are, the more LP tokens a depositor earns. Uniswap rewards these LPs depending on how many LP tokens they own. For a more detailed introduction to the Uniswap pools, you can visit the Uniswap Pools page1 or wait until the very next lesson where we’ll take a closer look. 