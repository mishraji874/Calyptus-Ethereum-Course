# Flash Loans

Flash loans are one of the most unique financial instruments utilised in Web3. They allow a user to take out a designated amount of assets from a smart contract pool without having to put any collateral down. Flash loans are essential for DeFi because they can be used in many different ways, such as arbitrage, swapping collateral and self-liquidation.

Flash loans, although initially introduced by the Marble protocol, were popularised by Aave and dYdX.

So, what is the catch? 

A flash loan has to be borrowed and repaid within the same blockchain transaction.

The definition of a transaction on a blockchain, such as Ethereum, is no different from that of a computer science transaction. 

## Transactions 

A transaction represents a set of operations that must be executed in an atomic way – either all the steps are executed or the transaction is rolled back and none of the steps take place.

Let’s look at a simple database transaction as an example. If you’re already familiar with this, feel free to skip down.

Imagine a database table that represents users’ balances. 

Amanda’s balance is $1000 and John’s balance is $500. Amanda sends John $500. In this case, we, of course, have to subtract $500 from Amanda’s balance and add $500 to John’s balance. So we start writing our database update statements.

**UPDATE ACCOUNTS SET BALANCE = BALANCE – 500.00 WHERE ID = 1;**

**UPDATE ACCOUNTS SET BALANCE = BALANCE + 500.00 WHERE ID = 2;**

This is great, but what happens if the first update runs successfully, but the second one fails for whatever reason?

If this happens, Amanda and John would both have $500, resulting in an inconsistent state.

To avoid situations like this we have to use transactions.

In the above situation, in SQL, we just need to wrap both statements with BEGIN; and COMMIT; keywords. If we do that, then it’s safe to assume that both statements will either be executed correctly or neither of them will – leaving Amanda’s and John’s balances untouched. Lessons that are a part of the same transaction are atomic, meaning they cannot be divided – it’s all or nothing. 

## Ethereum Transaction
When it comes to Ethereum, every common operation, such as sending ETH, sending ERC20 tokens and interacting with smart contracts are executed within a transaction scope. 

Transactions are combined into blocks and included in the Ethereum blockchain. We can find out which transactions were included in any given block on a block explorer like Etherscan. 

Ethereum transactions can be multi-step, meaning you could supply ETH and borrow DAI on Compound, swap half of the borrowed DAI for USDC on Curve and provide liquidity to the DAI/USDC pool on Uniswap – all within one Ethereum transaction. An error in any of these steps will cause the whole transaction to be rolled back and none of the steps will occur.

Remember that, even if a contract execution is not completed successfully and the whole transaction rolls back, you will still pay gas costs.

The amount of steps in a single transaction is limited only by the gas cost, so although you could theoretically construct a valid transaction with thousands of stages, it would be rejected due to the per-block max gas cost limit.

## Flash Loans
Now, let’s dive a little bit deeper into flash loans.

First of all, the most important part of executing a flash loan is to find a flash loan provider.

Aave and dYdX are examples of projects that have developed smart contracts which permit DeFi users to borrow various cryptocurrencies from a set pool, under the condition that they will repay the amount borrowed within the same Ethereum transaction. There is usually a fixed cost associated with using flash loans.

Aave contracts, for example, require the borrower to return the initial amount + an extra 0.09% of the borrowed amount. The fee is split between depositors, who provide the funds that can be borrowed, and integrators, who facilitate the use of Aave’s flash loan API. A part of this fee is also swapped to AAVE tokens and burned. 

The borrower can leverage the borrowed amount to carry out any other arbitrary activity, as long as the original flash loan is repaid at the end of the chain of various steps within the transaction.

Because the loan has to be repaid within one transaction, there is no risk of borrowers not repaying their borrowed amount.

The only risk is the ever present smart contract and platform risk.

Flash loans are becoming more and more popular with some users borrowing as much as 14M DAI on Aave.

## Use Cases

There are 3 common use cases for flash loans though others do exist. 

### Arbitrage

The profits obtainable from a good arbitrage opportunity might be magnified by using flash loans.

Let’s suppose that the DAI/USDC pools have a price difference between Uniswap and Curve. While 1 DAI buys you 1 USDC on Curve, only 0.99 DAI is needed to purchase 1 USDC on Uniswap.

Now you can try to execute the following arbitrage: 

1. Borrow 100,000 DAI from Aave via flash loan 
2. Swap 100,000 DAI for USDC on Uniswap and receive 101,010 USDC
3. Swap 101,010 USDC for 101,010 DAI on Curve 
4. Repay initial 100,000 DAI + 0.09% fee = 100,090
5. Profit 920 DAI

This looks nice, but we have to take a few extra things into consideration:

1. **Network fees –** When you’re calculating your profits from an arbitrage transaction with multiple steps, don’t forget to include transaction fees. 
2. **Price Slippage –** Always calculate how much price slippage you’ll experience while executing your order (remember – it depends on the size of your order and the liquidity present in the liquidity pool)
3. **Frontrunning –** There’s a good chance that someone else will discover the same opportunity and get their transaction mined ahead of you. Not only that, but bots that track the mempool can notice your lucrative arbitrage opportunity and send the same transaction with a higher gas fee, profiting them rather than you.

### Collateral swap

Let’s assume you have borrowed DAI using ETH as collateral, from Compound.

You can swap your collateral from ETH to, for example, BAT in the following way:

1. Take a flash loan in DAI to cover the amount of DAI that was borrowed
2. Repay your Compound loan with borrowed DAI 
3. Withdraw your ETH 
4. Swap your ETH for BAT on Uniswap 
5. Supply BAT as collateral on Compound 
6. Borrow DAI against your BAT collateral 
7. Repay flash loan with borrowed DAI + fee

Great, you just swapped your collateral from ETH to BAT and paid 0.09% of the borrowed amount for this.

### Self-liquidation

Consider the following scenario: You have a DAI loan on Compound with ETH as collateral. 

The value of ETH is dropping in dollar terms, and you’re close to the point where your account will be liquidated. You also don’t have or don’t want to deposit more ETH to decrease your liquidation level and you also don’t have the DAI required to repay the loan.

To avoid the MakerDAO contract liquidating your collateral and charging you liquidation fees, you can take the following steps:

1. Take a flash loan for the amount of DAI that you owe
2. Repay your DAI loan and withdraw your ETH
3. Swap enough ETH to DAI in order to repay the flash loan + fees 
4. Keep the rest of your ETH

These are the three most popular ways people use flash loans. Of course, the concept of flash loans is still relatively new, and there are numerous applications to be discovered in the future.

## Flash Loans and DeFi Hacks
Like crypto, flash loans can be beneficial or harmful depending on how they’re used. In regards to the latter, there are a number of recent DeFi hacks that have utilised flash loans in order to gain magnified profits without any initial investment.

One of the most famous hacks was the BzX hack where a flash loan was used to manipulate the Uniswap oracle price. As is often the case, the issue was not with flash loans themselves, but rather suboptimal decisions made with regards to using a single price oracle like Uniswap (rather than a safer and decentralised oracle network e.g. Chainlink).