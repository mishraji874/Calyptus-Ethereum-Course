# Frontrunning

## What is frontrunning?
Frontrunning as a concept has existed for a long time in the traditional stock market. In TradFi, the practice of acquiring a client’s transaction information via the brokers before the transactions are submitted to the exchange is called “front-running”. 

This is in fact how the popular and “free” investment platform Robinhood makes its money; earning revenue by selling transaction information to brokers before its users’ trades execute. 

In the DeFi industry, the open-source nature of blockchains enables even more sophistication for frontrunning.

Let’s first examine how transactions are handled on blockchains like Ethereum in order to comprehend frontrunning. 

Sending Ether or ERC tokens, deploying a smart contract, or interacting with them, these activities are all considered transactions because they alter the state of the blockchain. For these transactions to be valid, the validators must place them on the most recent block. 

As you send transactions, they are routed to an intermediary resting pool known as the mem pool, from which the validators can select some of them to put on the next block. This decision is typically based on the “Maximum Extractable Value,” also known as “Miner Extractable Value,” which is the most money that can be made by the validator over and above the standard block reward and gas fee by choosing which transactions from the pool to include in the next block and in what order. 

The mempool is public. Everyone who wishes to can view all of the pending transactions contained within the mempool. At any given time, there are more than 150,000 pending transactions in the pool.

### Frontrunning Bots
Every time a user sends a transaction to the public mempool, the transaction gets inspected by thousands of frontrunning bots to see if they can make a profit out of it.


Frontrunners are essentially bots that monitor the mempool, simulate each transaction, copy the code of the potentially profitable transaction, replace addresses with the frontrunner’s address, and run the transaction ahead of the original one by paying the validator more. 

This is a simple example of frontrunning. Let’s examine the various front-running attacks that can be carried out using the knowledge of all the pending transactions.

1. **Displacement Attack**

The example in the previous lesson of a simple frontrunning attack is an example of a displacement frontrunning attack. In such an attack, the success of the attack does not require the execution of the original transaction sent by the genuine sender. Let’s explore some examples to better understand. 

- You send a transaction to register a coveted ENS domain but a bot observes your transaction waiting in the mempool and registers the domain before you.
- You try to submit a bug in an on-chain bounty contest, and the bot observes your solution and sends it before you.

These attacks are feasible because the benefit from the transactions depends on the order in which they occur. Such a situation is also referred to as a “race condition.” 

2. **Sandwich Attack**

In such attacks, the original transaction sent by the real sender must be executed after the transaction sent by the bot in order for the attack to be successful. 

Say you want to purchase an NFT on the open market, and you enter a transaction to do so at whatever the going rate is. A bot could watch your transaction, purchase the NFT ahead of you, and then sell it to you for more money so that it can keep the difference.

Here’s another example of a sandwich attack. The ERC20 token standard includes a function called “approve” that allows an address to approve another address to spend tokens on their behalf. 

- Assume that Alice has approved Eve to spend 100 of her tokens. 
- Then Alice decides to change Eve’s approval to 50 tokens. 
- Alice submits a function call to be approved with the value 50 for Eve. 
- Eve runs an Ethereum node, so she knows that Alice is going to change her approval to 50. 
- Eve then submits a transferFrom request, sending 100 of Alice’s tokens to herself, but giving it a much higher gas price than Alice’s transaction. 
- The transferFrom executes first, so it gives Eve 100 tokens and sets Eve’s approval to zero. 
- Then Alice’s transaction executes and sets Eve’s approval to 50. 
- Eve then sends those 50 tokens to herself as well. 
- Eve thus receives 150 tokens, despite the fact that she should have received at most 100 i.e. max(50,100).


## How to not get front-run?

1. **Commit and Reveal Scheme**

The Commit and Reveal hash scheme is a remedy for race conditions in information submission in exchange for a reward. The party who has the answer submits a hash (salt, address, and answer) rather than sending the actual response; the contract stores this hash as well as the sender’s address. 

The sender must then submit a transaction with salt and an answer to be eligible for the reward. The contract hashes (salt, message.sender, answer) and compares the generated hash to the previously stored hash; if the hashes match, the reward is released by the contract.

2. **Remove the benefits of frontrunning**
 
The programmers of the smart contract should design the smart contract in such a manner that the sequence does not benefit one transaction over the other. 

Let’s revisit the “ERC20 Approve” illustration from the earlier example. To prevent the attack, the programmer can add a field to the approve function’s inputs that represents the expected current value and revert the execution if Eve’s current allowance is less than what Alice indicated she expects. 

Keep in mind making this change will alter the core functionality of an ERC20 token. There’s no written rule to not make such changes but doing so will make your contract non-compliant to the ERC standard.

3. **Hide your transaction from the mempool**

The solutions discussed above are from the perspective of the programmer of the smart contract. What if you are a user and don’t want your transactions to go to the dark forest of mempool? 

This is where services like FlashBot Auction come in handy. The FlashBots Auction allows us to send private transactions to the miners. This means that our transaction will bypass the public mempool. As a result, the bots will not be able to observe the transaction. If you want to learn more about how to use Flashbot Auction in your contracts, head to Additional Resources and click the link1.  

Alternatively, you can also use Flashbot Protect endpoint which provides the benefit of Flashbot Auction and has a much simpler implementation. All you have to do is configure your RPC endpoint, say Metamask, to Flashbot’s RPC endpoint instead of sending it to the mainnet’s endpoint by putting the following details in the add custom network setting in Metamask:

**Network Name:** Flashbots Protect RPC

**New RPC URL:** https://rpc.flashbots.net

**ChainID:** 1

**Currency Symbol:** ETH

Transactions sent with your wallet switched to this network will be sent to the miners via flashbot and they will only be visible to the pool, and thus also on the block explorers only after they get confirmed.

## Conclusion

The Ethereum blockchain currently has a highly adversarial environment in its base layers. The only means of preventing attacks like frontrunning are the creation of safe smart contracts and open-source initiatives like FlashBots. 