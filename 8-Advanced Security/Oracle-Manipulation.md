# Oracle Manipulation

## What is an oracle?

An oracle serves as a link between blockchain (on-chain) protocols and real-world (off-chain) services. Data from off-chain sources is retrieved by oracles and published on the blockchain for use by smart contracts. Oracles must maintain their resistance to manipulation and guarantee accurate data. There are two types of oracles used in the blockchain ecosystem: on-chain oracles and off-chain oracles.

## On-chain oracles vs. Off-chain oracles

Off-chain oracles obtain their information from non-blockchain sources. Off-chain data typically reacts to price changes more slowly than on-chain data, which can be advantageous or disadvantageous depending on the application. However, pushing off-chain data typically requires a small group of knowledgeable users, so you have to believe that they will always act honestly. Eg. Coinbase oracle.

On-chain oracles get data from sources that originate on the blockchain. On-chain data is always current and does not require the involvement of an intermediary, but because of this, attackers can manipulate it and cause catastrophic results. Eg. Uniswap V3 oracle.

**Various methods for manipulating oracles**

## Use flash loans to manipulate the price of AMM

If an attacker is able to control the price oracle, it is easy to perform an exploit. In a flash loan exploit:

- Borrows a large amount of asset A and deposits it in a liquidity pool
- As the supply of asset A increases, it’s price depreciates in relation to other assets in the pool
- The DeFi platforms using the pool’s price as an on-chain oracle get a manipulated price feed
- The attacker can use this to their advantage in multiple ways, eg. Buying large quantity of asset A at depreciated prices, from which they will repay the flash loan and pocket the difference.

In many cases, this is true for decentralized exchanges and on-chain centralized oracles, where attackers can use flash loans to manipulate the price of AMMs and alter the spot price of a token before the lender’s smart contract looks up the token.

## Centralized exchange leaks

Hackers can easily generate collateral tokens and use them to withdraw the entire balance if they obtain the private key for the exchange account. They also have the choice to borrow new, diluted collateral tokens until the oracle shows the updated value.

### Arbitrage

An arbitrager can use this information to plan an arbitrage if the price between different price oracles varies. For instance, Chainlink updates the Dai contract every 24 hours or whenever the price changes by 2%. The cost of Dai may be set at any point between $0.97 and $1.03. In the chainlink ecosystem, Dai can therefore be manipulated to fluctuate within a 2% range without causing concern.

## Real-world examples of Oracle Attacks

### Case 1: Synthetix MKR Price Manipulation

A price oracle attack against Synthetix occurred in December 2019. Notably, it crosses the divide between on-chain and off-chain price data.


A number of highly dubious transactions were made by the attacker against sMKR and iMKR (inverse MKR). The attacker purchases MKR in bulk from the Uniswap ETH/MKR pair after first purchasing sMKR to go long MRK. After some time passes, the attacker sells their sMKR in exchange for a short iMKR position, buys their MKR back from Uniswap, and repeats the process.

The attacker trades through Uniswap, allowing them to arbitrarily change the price of MKR on Synthetix. The underlying cause is that Synthetix’s off-chain price feed is dependent on MKR’s on-chain price, and MKR does not have enough liquidity for arbitrageurs to adjust the market price to its optimal state.

This incident serves as an example of how, even when you think you’re using off-chain price data, you might actually be using on-chain price data and being exposed to the challenges of doing so.

### Case 2: yVault Vulnerability

A bug with yEarn’s newly launched yVault contract was discovered on July 25, 2020.

By depositing tokens into the yVault system, users can earn money without having to manage their own assets. Internally, the vault keeps track of both the total amount of underlying token deposits and the total amount of yVault tokens issued. The ratio of tokens issued to tokens deposited determines the value of a single yVault token. All yVault tokens that have been issued—and therefore, all yVault token holders—receive a share of the vault’s total revenue.

By adding liquidity to the Balancer MUSD/USDC pool, users of the first yVault can earn USDC yields. Users who contribute liquidity to the Balancer pool are compensated with BPT tokens, which can be used to purchase a stake in the pool. As a result, yVault bases its estimation of the value of its holdings on the MUSD/USDC that can be redeemed using its BPT.

The state of the Balancer liquidity pool during transactions is not stable and cannot be trusted, despite the fact that this seems to be the right way to implement it. Due to the bonding curve that Balancer has selected in this instance, the user will not receive a 1:1 exchange rate when switching from USDC to MUSD and will instead leave some MUSD in the pool. As a result, attackers can manipulate the price at will and subsequently drain the vaults of liquidity. This means that the value of BPT can be temporarily inflated.

## How Can Oracle Manipulation Be Prevented?

### Time Weighted Average Price (TWAP)

A TWAP oracle is introduced in Uniswap V2 for use by on-chain developers. Oracle manipulation attacks are very difficult to succeed against TWAP oracles. Although it only applies to token assets that already have on-chain liquidity, its implementation may not be flexible enough during periods of high market volatility.

### Use only validated on-chain decentralized oracles

Due to the nature of on-chain decentralized oracles, make sure the exchange rate returned is verified by comparing the exchange rate to the exchange rate data coming from other exchanges. Using an average of multiple oracle sources as well as both centralized and decentralized oracles is a good idea. 

## Summing up

Off-chain or on-chain oracles have their own advantages and disadvantages. The main problem with on-chain oracles is that they are easily manipulated. For example, on-chain oracles can be combined with flash loans as leverage. In order to reduce the likelihood of oracle manipulation, many protocols have implemented off-chain or hybrid price oracles in their smart contracts.