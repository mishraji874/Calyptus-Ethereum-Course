# Ethereum & Smart Contracts

## What is Ethereum?
We’ve learnt about Bitcoin & Blockchain but what about Ethereum? Well we can define Ethereum as:

**A decentralised supercomputer with smart contract functionality**

- If Bitcoin is like a (decentralised) PayPal for digital gold,
- Ethereum is like a (decentralised) Microsoft for digital assets 

And everything that’s ever built or transacted on the Ethereum blockchain is recorded publicly, just like Bitcoin.

## Ethereum the Smartphone
To help explain things, let’s use the Microsoft analogy and assume you own a Microsoft Smartphone. Ethereum is essentially your phone’s operating system. And developers (like yourself) are able to build apps on it. The key difference however, is that these types of apps are decentralised…

- Instead of Fruit Ninja, you might have Axie Infinity (a Web3 Pokemon-style game),
- Instead of Santander, you have MetaMask (storing crypto, your digital assets),
- Instead of Vanguard you have UniSwap (a decentralised exchange)

What does **decentralised** mean? There is no central authority which looks after each app’s digital assets – of monetary value or data – which otherwise has risks economically, socially or as a single point of failure. In which case, the apps are instead created and looked after open-source by communities of developers.

So as an operating system, Ethereum enables decentralised use-cases to be built which all revolve around digital asset ownership (or the tokenization of things).

And **ether** is the native cryptocurrency of the platform. It is used for:

- rewarding validators for keeping the network secure and up-to-date
- the currency for paying transaction fees on the network (i.e. gas),
- a medium of exchange between the digital assets that exist within its platform 
(much like the US dollar is the base currency of the fiat world)

So ether is very important for how the whole Ethereum ecosystem is run.

## Smart Contracts
If you imagine Bitcoin can be used in a binary way – I either do or do not send you money, and any transaction made is publicly recorded – Ethereum was built as a blockchain for conditional transactions. Transactions based on rules or stipulations run by smart contracts.

**A smart contract is a computer programme which is intended to automatically execute, manage or document events according to the terms of a contract or an agreement**

If we as humans can have our own crypto wallet to send/receive ether to each other, smart contracts have exactly the same rights as we do. See them as custodial robots!

They can be programmed to send/receive crypto or information from their own wallets based on predefined rules meaning they can effectively replace and automate the roles of intermediaries/middle-men which exist in today’s world.



It is very important to note here the 2nd and 3rd point of the definition: manage or record events.

Smart contracts can not only create automatic, conditional executions (if X then Y), but their capabilities are much broader than this. They can be programmed to command a set of rules: to record events and track the ownership of digital assets being sent & received between wallet holders.

## Conditional Functions
Let’s break smart contracts down and go through some examples from simple to a bit more complicated…

These contracts can be anything from a conditional agreement between two parties, such as a straightforward transaction like Alice wants to pay Bob 10 ether. The smart contract can be programmed to accept Alice’s crypto, hold it and send it on to Bob after X period of time (not dissimilar to a custodial service like PayPal).



Or another simple example, smart contracts can be programmed to be triggered by real-world events. Take insurance for example, the future of insurance could very well be disrupted by smart contract technology.

If a real-world event occurred like a natural catastrophe, a smart contract could automatically execute a payout to someone based on a set of predefined rules. 

A smart contract can connect and make decisions based on data which is off-chain (i.e. information not found on a blockchain like the weather forecast) by using oracles. We will learn about oracle networks such as Chainlink in our Advanced Modules.

## Tokens & Standards
### Tokens
Let’s refer back to our smart contract definition: 

**a computer programme which is intended to automatically execute, manage or document events according to the terms of a contract or an agreement**

Smart contracts can manage or document events according to the terms of a contract.

In which case, smart contracts can be used to create and autonomously manage fungible digital assets i.e. tokens.

What does **fungible** mean? Something that can be divisible into smaller parts of equal value. 

Take a £10 note. It is fungible because it can be divided into 1000 smaller parts, 1000 * 1p coins. And every unit of this £10 note whether its 1p, 2p, 5p, 10p has the exact same value as any other 1p, 2p, 5p, 10p unit respectively1.

How are tokens different from coins in cryptocurrency?

- Coins are the native cryptocurrency of a blockchain e.g. BTC is the native cryptocurrency of the Bitcoin network, ETH is the native cryptocurrency of the Ethereum network. 
- Tokens are cryptocurrencies which are non-native digital assets which are built and managed on top of blockchains e.g. UNI is the token of Uniswap built on Ethereum.

To avoid confusion, smart contracts often represent a token (e.g Chainlink), but if you had 50 Chainlink tokens (LINK) in your crypto wallet, they are not 50 individual smart contracts. 

Those 50 LINK tokens, and the rest of the circulating supply on the Ethereum network (approximately 500m LINK token), are just numbers on a screen i.e. your balance.

LINK is an ERC20 token which is managed by a single smart contract. This smart contract has been programmed to keep track of the balances of all Ethereum wallets on the Ethereum network which hold LINK tokens.

### ERC20: The Token Standard

#### What does ERC20 mean?

**ERC-20 is the standard (i.e. a specific framework) for creating smart contracts which manage fungible digital assets (tokens) on the Ethereum network.**

It enables any person or entity to mint their own token on the Ethereum blockchain in a standardised. It ensures all types of fungible tokens can be compatible with all DApps, platforms & exchanges across the Ethereum ecosystem (for storing, sending or receiving tokens).

What are the rules? 

Let’s say we want to create a token called Calyptus Token. 

The smart contract is programmed to be responsible for keeping track of all its attributes that make it a Calyptus Token. This would include: the name of the token, its ticker (perhaps CAL), the symbol (the Calyptus logo), total token supply (e.g. 1,000,000,000), and most importantly how it will keep track of balances across wallets. 

You will learn more about this in the Advanced Module called Token Standards.

#### ERC20: Stablecoins
Stablecoins like USDC are a key example of an ERC20 token. What are stablecoins?

**Tokenised versions of real-world currencies (like the US dollar)**

With USDC, its smart contract has been programmed to mint every 1 US dollar received (input) into 1 USDC token (output), and secure the fiat currency as collateral. USDC is considered the safest stablecoin because it is 100% backed by cash and short-dated US treasuries, meaning 1 USDC will always be 100% redeemable for 1 US dollar.

Stablecoins have become increasingly popular for remittances because of their rapid and cost-effective capability to emulate the role of sending normal fiat currency across the world. Most fiat currencies must change hands via several intermediaries before reaching their end destinations. Stablecoins are simply peer-to-peer on a decentralised network.


### Non-Fungible Tokens (NFTs)
Non-Fungible Tokens are slightly more complex types of tokens in terms of their characteristics. They became increasingly popular in their ability to prove digital ownership of virtual art such as Bored Ape Yacht Club or CryptoPunks2.



Despite being popularised through consumerism, the technology has the potential to disrupt proof of ownership across every industry in the world. If it’s a unique type of digital asset, an NFT has the capability to represent ownership on the blockchain.

So what’s an NFT? It’s a Non-Fungible Digital Asset.

While fungible tokens can be divided into smaller parts of equal value, non-fungible tokens cannot. NFTs are completely “one-of-a-kind”.

What does its smart contract do? Well, it typically manages a collection of NFTs (often 1,000 or 10,000 in the virtual art world) and tracks their ownership via allocating a specific tokenID to every token so they are uniquely identifiable from one another.

Some of its most relevant applications today include: 

- Virtual art,
- Club membership
- Music & film royalties,
- Ticketing & proof of event attendance
- Negative value assets like bonds,
- Real estate and even virtual real estate3

Where is the NFT stored?

Taking virtual art as an example, the image itself is not actually stored on the blockchain! Storing images on the blockchain would take up way too much space. So the thing that is stored is simply the unique ID which is affiliated with that artwork.

Anyone in the world could screenshot your CryptoPunk, but if you don’t own the NFT (the digital tag) then it’s not yours! Alphanumeric data however can be stored with the NFT almost like a “comment” section (e.g a URL link relating to a website showing the image) but that’s it.

### ERC721: The Token Standard
Just like fungible tokens, Ethereum has a token standard for building a smart contract which creates and manages NFTs which are slightly more complicated. Its standard is called ERC721.

Unlike ERC20, there are no account balances which the smart contract tracks. Instead, there is only ever one holder at a time of a given NFT. It’s more like tracking the ownership of a “tag” associated with a crypto wallet, rather than a balance.

There are a number of interesting attributes which we will explore in the Advanced Module on NFTs, but one unique characteristic is that they are extensible i.e. they can be combined with other NFT ID’s in their smart contract to produce other random NFTs called “breeding”.4


Another interesting attribute is that their ownership can be assigned to 3rd parties such as auctioneers / brokers (like OpenSea) to sell the NFT on your behalf.

In the Token Standards module, we will also learn about ERC1155 which is a fungibility-agnostic type of token.

## Decentralised Apps (DApps)
Smart contracts can be used like building blocks on top of other smart contracts to produce what we know today as Decentralised Applications (Dapps). Dapps are:

**autonomously-operational platforms which have no central authority.**

And we will be later training you on how to build your own!

Much like apps on our smartphones belong to certain verticals (like Calm & Headspace belong as Mindfulness apps), the same is true for DApps. The most prominent space for Dapps today is in the Finance sector also known as DeFi. DeFi refers to:

**Decentralised finance platforms which have no central authority.**

UniSwap & Aave are the most popular DeFi platforms for trading crypto, and borrowing & lending crypto respectively. They have the power to create highly efficient financial markets and automate the execution of trades between cryptocurrencies based on liquidity pools. 

People can earn UNI or AAVE tokens by lending their tokens to these liquidity pools for other people (or smart contracts) to borrow. We will cover both these DeFi platforms in separate Advanced modules.

## Decentralised Autonomous Organisations (DAOs)
Smart contracts can also create decentralised businesses called Decentralised Autonomous organisations (DAOs). Decentralised platforms (like Aave) require a DAO structure to manage the platform fairly as a community of builders.

**A DAO is a community-led entity with no central authority**

It is a fully autonomous and transparent organisational structure where smart contracts lay the foundational rules on: 

- how the voting system works for making decisions within the community, 
- publicly recording the votes on decisions made by the community and then,
- executing the agreed upon decision on behalf of the community 
(e.g. allocating a % of the DAO’s treasury to a specific project)

There are some particularly brilliant applications of social, philanthropic & charitable organisations being run by DAOs e.g. Big Green DAO. The DAO structure is used to issue grants towards specific positive-change projects as voted by its community.

We will take you through DAOs in the Advanced Modules.


## Ethereum 2.0
As of the 15th September 2022, Ethereum upgraded to Ethereum 2.0. This event was called “The Merge” which defined Ethereum changing its consensus mechanism from **Proof of Work (PoW) to Proof of Stake (PoS).**

As a recap, Proof of Work involves miners competing to solve a computational puzzle through trial and error. Despite every single miner exerting a huge amount of effort, there can only be one “winner” for each block, which means 99% of the energy used is attributed to the attempts of “losers”. This is where there has been controversy over Bitcoin’s efficiency and sustainability.

### So how is Proof of Stake different?
The proof-of-stake consensus mechanism solves this efficiency problem. With proof of stake, a validator is chosen randomly, based in part on how many coins they have locked up in the blockchain network, also known as staking. 

The coins act as collateral and when a participant, or node, is chosen to validate the next block, they receive a reward (currently 2 ETH). A new block on Ethereum is produced every 10-15 seconds.

However, if the protocol detects any hostile or fraudulent activity, it will slash your staked amount of Ether. 

Slashing is a mechanism put in place to enforce good behaviour. It is an irreversible punishment that ‘slashes’ a percentage of an offending validator’s current stake. It results in a steady loss of ETH over time until the network forcibly evicts the validator and labels them “slashed.”

### What is the result of Proof of Stake?
Proof of Stake is 99.98% more energy efficient than Proof of Work making it an environmentally sustainable solution for building in Web3.

Additionally, PoS is believed to make the network more secure because the slashing mechanism is a huge risk to any bad actor looking to medal with Ethereum’s ledger. 

### Will Bitcoin go Proof of Stake?
It is likely the Bitcoin miner community will not change to PoS because it’s the life-blood of Bitcoin, the original innovation first created by Satoshi Nakamoto.

While it’s not energy efficient, almost 50% of Bitcoin miners use renewable energy sources such as dams (which naturally can improve their profit margins).

PoW might also be a better mechanism for detering centralisation and possible 51% attacks. This is because purchasing and setting up all the mining hardware (PoW) vs buying enough Ether to stake (PoS), to become a dominant force on the network, would be more difficult.

## Sharding
In 2023, Ethereum aims to vastly scale its transactional volume by using something called sharding. An event which has been coined “The Surge”. 


Sharding is a traditional computer science scaling technique which would split up the blockchain into 64 mini-blockchains (shards). Each mini-blockchain would care for different pools of transactions on the network, and each would be maintained by a different subset of validators. 

The shards’ transactional data would then be coordinated and organisationally time stamped on a Beacon chain to create one tidy ledger for the whole Ethereum network.

### The Benefits of Sharding

Sharding will vastly increase throughput to c. 100,000 transactions per second. Furthermore, validators will not need large mining computers which all individually need enough memory to download the whole Ethereum blockchain, and keep it maintained. 

Instead, anyone with a smartphone could hypothetically become a validator (and earn Ether doing so). This would open up a huge amount of potential for the network’s widespread decentralisation (and allay centralisation risks from a PoS consensus mechanism), while being able to maximise security of the network, and significantly lower transactions fees.

Nice Work!

## Conclusion
You’ve just learnt about Ethereum from a bird’s eye view covering smart contracts to token standards, NFTs to DAOs. You’re now officially ready to kick start learning about how to interact with the blockchain and start building your first smart contract. Before that, let’s get you setup on MetaMask! See you in the next module.

### Good To Know:

- Did you know BTC can be divisible down to the 1/100 millionth of a Bitcoin, also known as 1 Satoshi? While ETH can be divisible down by 10^18 i.e. 1,000,000,000,000,000,000 of 1 Ether. This lowest unit is called “Wei”.
- There are a few NFT collections to have achieved a cult-like status such as CryptoPunks. The project was launched in 2017 by Larva Labs and was inspired by the London punk scene, the cyberpunk movement, and electronic music artists such as Daft Punk. 

- The most expensive CryptoPunk in the world is CryptoPunk #5822. The token sold for roughly $23.7 million in February 2022. Why so much? Because of its rarity. The Punk is part of the series’ rarest alien edition, of which only 9 exist out of the 10,000 punks available. 

- On top of this, the token is one out of 333 others with a bandana. The NFT was purchased by Deepak Thapliyal, the CEO of Chain. Given its rarity and cult-like following, it’s likely to remain one of the most expensive NFTs in the world.
