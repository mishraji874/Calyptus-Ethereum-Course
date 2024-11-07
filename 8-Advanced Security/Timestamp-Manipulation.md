# Timestamp Manipulation

When a smart contract uses the block.timestamp function to execute crucial logic, it is vulnerable to timestamp dependence. This covers activities like sending ETH or utilising the function as a source of entropy to produce the required random numbers. 

Block.timestamp can easily be manipulated by the nodes. The node creates a block containing  transactions. They can alter the value of timestamp put on the block they add.

Nodes accept any block timestamp that falls within a specific window because they are flexible.

By manipulating the block timestamps themselves, malicious actors (validators in this case) can take advantage of the vulnerability when a smart contract transfers ETH using block.timestamp, creating the ideal environment for their own success.

Consider this contract as an illustration of a timestamp dependence vulnerability:

```solidity
    contract Roulette {
        uint public pastBlockTime;
        
        constructor() payable {}
        
        function spin() external payable {
            require(msg.value == 10 ether); // must send 10 ether to play
            require(block.timestamp != pastBlockTime); // only 1 transaction per block
        
            pastBlockTime = block.timestamp;
        
            if (block.timestamp % 7 == 0) {
                (bool sent, ) = 
            msg.sender.call{value: address(this).balance}("");
                require(sent, "Failed to send Ether");
            }
        }
    }
```

Because this smart contract uses the block.timestamp function to determine the winner of the Roulette, a malicious validator can set the block.timestamp to a number in the future that is divisible by 7 and send a transaction in their block to call the spin() function. If the validator is able to successfully add their block to the blockchain, they will win the game.

## What Is Block Number Dependency?

Block number dependency vulnerability is comparable to timestamp dependence vulnerability. This occurs when programmers estimate a time difference using block.number and average block time rather than block.time. 

Since blocks advance one at a time, it might appear more secure than block.timestamp, but alas, it also has flaws. Block times may alter as a result of fork reorganisations for example.

## How to Prevent Timestamp Dependence?

### 15-Second Rule

Widely used Ethereum protocol implementations Geth and Parity both reject blocks with timestamps longer than 15 seconds (with average block times landing between 12-14 seconds). This indicates that it is okay to use a block.timestamp for that function if the size of the time-dependent event can vary by 15 seconds while maintaining integrity of the application. 

For example, in the roulette game contract we referred to in the previous section, the game logic depends on the timestamp being accurate within the range of 7 seconds. Thus a validator can manipulate the timestamp to its benefit. 

On the contrary, let’s consider a staking contract where a user stakes his token for a vesting period of 12 months. In this situation, if the time of unlocking after a year varies by 15 seconds, it practically won’t matter too much to the user. In such situations, using block.timestamp for timekeeping is not a security threat. 

### Using Off Chain Oracles

You can use a reliable oracle for the generation of random numbers. For instance, the Verifiable Random Function provided by Chainlink Oracle, which is a fair and verifiable random number generator (RNG) enables smart contracts to access random values without jeopardising security or usability.