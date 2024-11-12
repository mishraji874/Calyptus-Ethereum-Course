# Introducing Uniswap

The notion of exchange has existed since the invention of money by the Mesopotamian people almost 5,000 years ago. Since then, the form of an exchange transformed from being a city stall to an institutionalised and usually government-controlled foreign exchange broker. 

Although exchanges have become more efficient and, in some cases, more transparent by some requirements, including law, they are prone to human error and greed that could affect the benefits of the parties involved.

A solution that might come to mind would be to achieve efficiency with computer code. Although this is quite effective, it still doesn’t guarantee fairness and transparency for the trades being executed. This is because the code, in the current computer paradigm, is very much centralised. 

An alternative way to build an exchange would be to build on-chain, meaning that it exists on the blockchain. In this manner, all the rules of an exchange would be visible to everyone interacting with the exchange so that fairness would be guaranteed by code. 

A *decentralised exchange (DEX)* does exactly that, but since this is currently impossible with the fiat money system, a DEX is built on a blockchain as the technology itself is perfect for it.

Now we have understood why we might want a DEX to exist, let’s formally define it: 

- A DEX is a peer-to-peer marketplace where users can trade one cryptocurrency for another without any intermediaries or the need to transfer funds to custody. 

Uniswap1 was the first DEX to be built on the Ethereum blockchain, with trading volume reaching $1.2T as of October 2022. Similar examples of such an exchange could be seen in other blockchain ecosystems, such as Trader Joe2 on the Avalanche blockchain and Ref Finance3 in the NEAR ecosystem. 

A DEX, as stated earlier, comes with many benefits. DEXs provide token availability for newly created tokens, more often than not earlier than their centralised counterparts. DEXs also preserve their users’ privacy as accounts interacting with a DEX don’t have to prove their identity, unlike centralised exchanges requiring their users to go through Know Your Customer (KYC) guidelines. On top of its benefits as a privacy-preserving mechanism, DEXs provide an extra layer of security as they also do not control the funds. 

Aligned with the spirit of web3, a DEX is not run by a community, but rather governed by its community. In the case of Uniswap, for instance, the holders of the $UNI token have voting power in how Uniswap structures itself for its future. Logically, the more $UNI tokens an account has, the more voting power it has. 

So, we’ve discussed the benefits of using a DEX, but a curious mind would ask how it actually works. DEX’s are able to thrive by using an automated market maker (AMM), a set of algorithms that help trade asset pricing. In the next lesson, we will dive deep into AMM’s mathematics.

## Demonstration: Swapping Assets on Uniswap

To build web3 products, we need to understand how it works under the hood and how it is presented to the user. It is common knowledge that UI/UX is a problem in web3, and learning how to interact with web3 projects will allow you to propose improvements and contributions to web3 UI/UX.

In this lesson, we will use the Uniswap interface to swap $ETH for the $UNI token that gives governance rights to an account that holds that token. To be able to go through this short demonstration,  open your Metamask wallet, connect to Sepolia Testnet and add some test ETH. 

After connecting to the application with your Metamask wallet, make sure that you switch to the Sepolia testnet. This is fairly important as staying on the Ethereum mainnet will cause you to swap your ETH for UNI on the mainnet, which could have an undesired impact on your finances.

In the swap interface, write however much ETH you would like to swap UNI with. In our case, we will click the max button right next to the balance indicator on the interface. We will then select the token that we would like to swap with by clicking onto the pink “Select token” and searching for and selecting “UNI” in the search interface. After selection, your screen should look like the below. Uniswap would fetch the price for us, and for the maximum amount of $ETH that we could swap, it would give the equivalent of that in the $UNI tokens.

The latest step we have to take is to press the “Swap” button to finish off the swap and confirm the swap by pressing the “Confirm Swap” button in the interface that pops up after pressing the “Swap” button.

In this scenario, where we are connected to the Ethereum mainnet, “Confirm Swap” would trigger a transaction that we would have to confirm in our wallet, and would then swap our ETH for the UNI tokens. You would then be able to see your tokens in the “Assets” section in our Metamask wallet. However, as you have realised by now, Uniswap does not currently support the testnet. 

Now that we have played with the Uniswap interface, it is now time to go a bit deeper into the technical overview/features of the DEX, along with some code and mathematics.

## A Technical Introduction to Uniswap

Just like most software that’s been created, Uniswap has been improving to offer more functionality and boost efficiency. As of October 2022, there have been three upgrades to the design of this dex, namely Uniswap V1, V2, and V3 – each of their whitepapers are linked if you’d like to take a read. 

For the sake of brevity, this lesson will focus on what features each Uniswap version offers. In the coming lessons, we will take a look into how Uniswap V1 is programmed and the mathematics of a DEX.

Launched in November 2018, Uniswap V1 is limited to allowing swaps only between the native asset of Ethereum, namely $ETH, and an ERC-20 token. A trader can swap one ERC-20 token with another by using chained swaps that he would swap his ERC-20 token with $ETH and then swap that $ETH with the desired ERC-20 token.

Uniswap V2, on the other hand, improved the contracts from a couple of different angles. Importantly, this version allows direct transfers between two ERC-20 tokens and “flash swaps” that allow traders to receive the desired assets and use them elsewhere before paying for them later in the transaction.

Uniswap V3 is the latest, improved version of the DEX that comes with some capital efficiency, which allows liquidity providers (LPs) to provide capital at certain intervals that could lead to better returns on their capital. Uniswap V3 uses NFTs as a utility token given to LPs for the intervals in which they provide capital. 

## The future of Uniswap: What’s Next?

Uniswap V3 is just the beginning of a transition to more efficient market makers that power the decentralised economy. Last summer, Uniswap acquired the NFT marketplace aggregator Genie to bring NFTs into its mix4.  As of October, Uniswap raised $165M to become the go-to platform for digital assets on the EVM chains5. We expect that the growth of Uniswap will continue, and learning the fundamentals of how this DEX works will very likely help your career if you move into the web3 space. 