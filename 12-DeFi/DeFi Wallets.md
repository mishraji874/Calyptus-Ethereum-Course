# DeFi Wallets

Wallets serve as a digital space to hold, send, and receive cryptocurrency.

They don’t actually hold your assets or crypto, but they do hold your private and public keys linked to your assets, so that you can easily retrieve your assets from the blockchain. 

Think about it like the credit cards that you keep in your real-life wallet, those credit cards held in your wallet are not your “money”, they are just a link to your bank account where your money actually is. If you were to lose your (real-life) wallet, someone could use your cards and spend your money. The same goes for the private keys held in your digital wallet.  


There are many different wallet types, but the most popular options are: 

1. a browser extension wallet – eg. Metamask
2. a web wallet – eg. Coinbase Account
3. a cold wallet – eg. a piece of paper
4. a hardware wallet – eg. Ledger

DeFi-friendly wallets allow you to interact with DeFi applications such as decentralised exchanges and lending and borrowing protocols while also managing your digital assets.

Let’s begin with Metamask, which is the most popular browser plugin for DeFi users.

## Metamask

If you went through our Basic modules, you already learned about it, but now we will dive deeper into its full capabilities.

Metamask is a crypto wallet that provides users easy access to blockchain apps. For example, DeFi apps like Uniswap, Compound, Aave and Maker. You can see it as a bridge that helps to connect the internet we are all used to, to Web3.

Metamask is a browser plugin that can also be downloaded as a mobile application for your smartphone.

The users have the options to: 

1. Sync an existing wallet with a mobile app
2. Create a new wallet
3. Recover a wallet using a recovery phrase 

Metamask supports ether (ETH) and Ethereum-based tokens such as ERC–20 and ERC-721.

Metamask, as well as all other wallets listed in this module, are non-custodial. This implies that users have complete authority and ownership over the assets stored in their wallets.

But like always, with great power comes great responsibility. Users of non-custodial wallets have no assurance that the wallet provider will recover their funds. Instead, they must take wallet recovery into their own hands. This is usually achieved by securing a recovery phrase.

A seed phrase, also known as a recovery phrase, is a particular set of words that may be used to restore an entire wallet with all of its private and public keys. You could lose all control of your digital assets stored in that wallet if you lose your wallet’s private keys and credentials or forget your recovery phrase. This is why everyone who decides to use a non-custodial wallet MUST take the security of their recovery phrase seriously.

The basic security measures for your recovery phrase include:

1. Write it down offline, for example, on a piece of paper and keep multiple copies in different locations
2. Never leave your recovery phrase online, for example, in a Google doc or Apple notes
3. If you must restore an existing wallet using your recovery phrase, it’s better afterwards to move all your funds to a new wallet/account. This is because if you lost your wallet’s credentials and someone else found them they could potentially access your wallet account too, so just to be on the safe side after you recover access to it it’s better to move your funds to a new one.
4. Always double check the URL of Metamask but also always check the URL of all Dapps you are trying to connect to. 
5. Never share your seed phrase with anybody, no web3 dapp or service will ever need your seed phrase, and the same goes for your private keys. Never trust any person or any email asking you to share those details.

The private keys generated from the recovery phrase are kept on the user’s browser in Metamask and aren’t sent to an external server for security reasons. 

The private keys are used to sign transactions in the user’s browser, which then broadcasts them to the Ethereum network. 

Metamask permits you to create various accounts, and each account has a set of private and public keys. You can generate the keys from the recovery phrase.

Now, let’s take a look at the pros and cons of using Metamask.

**Pros:**

1. It is non-custodial
2. It is an easy to use bridge into Ethereum and DeFi apps
3. It is open-source

**Cons:**

1. It is still a “hot” wallet – keys are stored on the computer’s browser that is connected to the Internet which increases the risk
2. It only supports Ethereum-based assets and Ethereum-compatible networks like Polygon, Arbitrum, and Optimism for the time-being

## Hardware Wallets

Hardware wallets (or cold wallets) are hard drives, usually USB drives built specifically for holding and managing crypto assets. The most well-known hardware wallet is Ledger, which most cryptocurrency users are already familiar with.

Ledger allows users to store various digital assets, including ETH and ERC20 tokens, Bitcoin, Litecoin, and many more.

During set-up, Ledger requires users to create and store a recovery phrase, similar to Metamask.

The user’s private keys are kept offline on a secure hardware device with Ledger. This system provides complete isolation between the private keys and online devices that are more susceptible to hacks, like computers or smartphones. This makes it an ideal option for users with a high value of digital assets.

Metamask also allows users to create an account that is linked to a hardware wallet, such as Ledger. This account is just like any other MetaMask account, making it a breeze to use multiple DeFi apps at the same time. The major distinction is that the hardware device must be connected to your computer in order to sign and send a transaction.

Ledger has also a desktop application called Ledger Live, which lets you connect your Ledger hard wallet and buy cryptos as well as connecting directly to Dapps in a similar way to how you’ll do so using Metamask.

If you take your digital asset security seriously, then a Ledger device is strongly recommended.

Even though it is the most used, Ledger is not the only brand creating hardware wallets – also known as cold wallets – another well-known brand is Trezor, the functionalities are very similar to that of Ledger.

Let’s take a look at the pros and cons of using Ledger:

**Pros:**

1. Highest degree of security available
2. Supports a wide range of cryptocurrencies, not only Ethereum based
3. Integrates with Metamask and many other Dapps directly through LedgerLive

**Cons:**

1. The inconvenience of using a separate hardware device
2. Requires security of the physical device

## Mobile Wallets

Out of all the available DeFi wallets that can be used on your phone, Argent is one of the top contenders.

By directly integrating with popular DeFi protocols such as Uniswap, Aave or Set Protocol, Argent makes it easy for users to get started with DeFi.

Argent, similarly to the other mentioned wallets, is non-custodial. Argent creates a smart contract on Ethereum that is controlled by the user of the wallet when a new wallet is generated, so Argent has no say in that smart contract at any time. This feature allows for the addition of more functionality that couldn’t be accomplished with a basic Ethereum address.

Argent has a unique recovery model when it comes to security. Instead of having to write down a long and complicated recovery phrase, users can set up social recovery by choosing one or more “Guardians”. Guardians can be people you know or family, but they may also be other devices like hardware wallets, MetaMask, or third-party services.

The majority of Guardians must give permission in order to retrieve a wallet and its data. In the case that the number of Guardians is even, 50% is enough for the recovery to happen.

Argent also offers the ability to set daily transfer limits and temporarily freeze your wallet, similar to how you would with a credit card.

The pros and cons of using Argent:

**Pros:**

1. Non-custodial 
2. Doesn’t require a recovery phrase
3. Integrated with the most popular DeFi protocols 
4. Daily limits and locking option similar to a credit card

**Cons:**

1. Requires a good understanding of the social recovery model
2. Not all DeFi protocols are available
3. Not as secure as a hardware wallet

## DeFi Dashboards

Although they are not exactly wallets, it is worth mentioning two apps that make managing a DeFi portfolio simpler. Those apps are Zapper and Zerion, but many others are starting to appear in the market.

Both apps allow you to view your overall portfolio in one spot. Users may connect a wallet, such as Metamask or Ledger, to be able to invest or transfer their assets, or they can supply an address/addresses to see a portfolio in view-only mode. Each app has a different design, but both provide an overview of the value locked in each DeFi protocol.