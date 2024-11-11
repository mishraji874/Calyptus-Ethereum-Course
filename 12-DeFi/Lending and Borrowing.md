# Lending and Borrowing

One of the most significant components of any financial system is lending and borrowing. At some point in their lives, most people are exposed to borrowing money, usually through taking out a student loan, car loan, or mortgage.


The idea is quite basic. In return for interest on their deposits, lenders, also known as depositors, provide money to borrowers. In exchange for receiving a lump sum of cash straight away, borrowers or loan takers are prepared to pay interest on the amount they borrowed.

Traditionally, lending and borrowing are facilitated by a financial institution such as a bank or a peer-to-peer lender. 

## Lending and Borrowing in Crypto 

There are 2 main ways to lend and borrow money in the cryptocurrency space. You can do so through DeFi protocols such as Aave or Compound, or by using Centralised Finance (CeFi) companies like BlockFi or Nexo.


CeFi is very similar to how banks operate. This is also why sometimes we call these companies “crypto banks”. For example, BlockFi takes charge of deposited assets and lends them out to both institutional borrowers like market makers or hedge funds, as well as other users on their platform.

Even though the centralised lending model is effective, it is susceptible to the same issues as centralised cryptocurrency exchanges – most notably customer deposits being lost due to hacking or other forms of negligence (bad loans, insider jobs, etc.).

The CeFi model might also be viewed as conflicting with one of the key benefits that cryptocurrencies offer users: self-custody of assets.

This is where DeFi lending comes into play. 

## Lending and Borrowing in DeFi

DeFi lending is a completely decentralised and permissionless way for users to become lenders or borrowers, without having to give up custody of their coins.


The DeFi loan concept is based on self-executing smart contracts that operate on open (public) blockchains, such as Ethereum. Just like a vending machine, a smart contract is programmed to produce outputs based on predefined actions or events. You are not required to provide personal information or entrust another person with your money (unlike CeFi). 

Aave and Compound are the two main lending protocols available in DeFi. These smart contract-based protocols both function by establishing money markets for various tokens such as ETH, stablecoins like DAI, and USDC, as well as other cryptocurrencies like LINK or LTC.

Users can become lenders by supplying their tokens to a money market. The interest they receive on their investment is determined by the APY and how much is currently supplied.

Users are able to take out loans using the supplied tokens, which are sent to a smart contract and made available for other users to borrow. In return for the supplied tokens, the smart contract creates additional tokens that represent the given assets plus interest. These tokens are called cTokens in Compound and aTokens in Aave and they can be redeemed for the underlying tokens. We’ll go deeper into their mechanics later in this lesson.

It’s also worth mentioning that in DeFi, at the moment, pretty much all of the loans are overcollateralized. Meaning that a user looking to take out a loan must put down collateral in the form of tokens that are worth more than the amount of money they want to borrow.

Now, you might be thinking – what’s the purpose of taking out a loan if you have to put down collateral that’s worth more than the amount of money you’re borrowing? Why wouldn’t someone just sell their tokens in the first place?

There are quite a few reasons for this. Most users don’t want to sell their tokens, but they may need funds for unexpected expenses. Other reasons include avoiding or delaying capital gains taxes on their tokens, as well as utilising borrowed money to increase their leverage in a specific trade.

So, how much can be borrowed? Is there a limit?

Yes. The amount that can be borrowed depends on 2 main factors:

1. How much funds are available to be borrowed in a particular market. This isn’t an issue in healthy markets unless someone tries to borrow a huge number of tokens.
2. The collateral factor of supplied tokens. The collateral factor determines how much can be borrowed based on the quality of the collateral. For example, DAI and ETH have a collateral factor of 80% on Compound (at the moment of writing). This means that up to 80% of the value of the supplied DAI or ETH can be used to borrow other tokens.

A user’s loan value can never surpass the worth of their collateral x the collateral factor. There is no limit to how long a person can borrow money if this condition persists.

If the collateral’s value decreases beneath the required level, it will be liquidated in order for the protocol to return the borrowed money.

The interest that lenders get and the cost of borrowing tokens is determined by a market’s ratio between supplied and borrowed tokens.


The interest that is paid by borrowers is the interest earned by lenders, and the Borrow APY (Annual Percentage Yield) should be higher than the Supply APY in a particular market. I.e. it should always be more expensive to borrow money in a specific market (e.g. ETH) rather than lend to ensure lenders get a return for taking on risk.

APYs are based on the Ethereum block. Because DeFi lending offers varying interest rates dependent on borrower demand for particular tokens, it implies that DeFi loans have dynamic interest rates that vary significantly depending on the amount of demand for a specific token.

This is also where one of the most significant distinctions between Compound and Aave arises. Although both protocols offer variable supply and borrow APYs, Aave also offers stable borrow APY. Stable APY is fixed in the short-term, but it can change in the long-term to accommodate changes in the supply/demand ratio between tokens.

In addition to offering a stable APY, Aave also provides Flash Loans. With this feature, users can borrow funds without having to put down any collateral beforehand. The loan only lasts for one Ethereum transaction. 

## The mechanics of Compound and cTokens

Say, a user deposits 10 ETH into Compound. Compound issues cTokens ( cETH in this case ) in exchange for the 10 ETH.


The number of cETH tokens the user will receive fluctuates, depending on the real-time exchange rate for ETH. When a new market is created the exchange rate between cTokens and underlying tokens is set to 0.02. We can assume that each market starts at 0.02, but this number is completely arbitrary. Also, we can assume that the only way this exchange rate could increase is if more Ethereum blocks are mined.

If the user supplied 10 ETH when the market was just created they would’ve received 10/0.02=500 cETH. Because the ETH market has been operating for a while we can assume that the exchange rate is already higher. Let’s say it is 0.021.

This means that the user would receive 10/0.021=~476.19 cETH. If the user chooses to immediately redeem their ETH, they should get around 10 ETH back, close to the same amount that has been deposited.

This is where it gets interesting. The user will have cETH which works like any other ERC20 token, and can be sent to different Ethereum wallets. The main difference is that cETH is necessary to redeem the underlying ETH from Compound. Furthermore, cETH will continue to grow interest even if it is transferred from the original deposit wallet to another.

With each Ethereum block that passes, the exchange rate will increase. The rate of the increase depends on the supply APY which is determined by the ratio of supplied/borrowed capital.

In our example, suppose that the exchange rate from cETH to ETH changes by 0.0000000002 with each block. Assume the interest rate continues to rise at the same pace for a month. We can easily calculate how much interest may be earned throughout that time using this method.

Let’s say on average we have 4 blocks per minute. This gives us the following numbers.

0.0000000002*4*60*24*30=0.00003456. Now we can add this number to the previous exchange rate. 0.021+0.00003456=0.02103456.

If the user decides to redeem their ETH they would receive 476.19*0.0213456=~10.0165 ETH. So the user just made 0.0165 ETH in a month which is around 0.16% return on their ETH. The user received the same amount of cETH as before, but because the exchange rate changed, they were able to redeem more ETH than initially deposited.


Aave operates on a similar model but with interest being accumulated every block. The primary contrast is that aTokens’ value corresponds to the value of the original token at a 1:1 ratio. The interest is distributed amongst aToken holders by way of increasing their wallet balance. If an aToken holder should choose, they can redirect future payments to another Ethereum address.

When it comes to borrowing, users lock their cTokens or aTokens as collateral and borrow other tokens. Collateral earns interest, but users cannot redeem or transfer assets while they are being used as collateral.

As we said earlier the amount that can be borrowed is determined by the collateral factor of the supplied assets. There’s also a smart contract that analyses all of the collateral in each user’s account and determines how much may be borrowed safely without being liquidated right now. 

Compound uses its own price feed to determine the value of the collaterals, which takes prices from several exchanges with high liquidity. Aave on the other hand relies on Chainlink Oracles and falls back to their own price feed if necessary.

If a user decides to repay the borrowed amount and unlock their collateral, they also have to repay the accrued interest on their borrowed assets. The amount of interest that has accumulated is determined by the APY you borrowed, and it also automatically increases with each Ethereum block.