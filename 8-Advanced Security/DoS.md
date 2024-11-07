# Denial of Service(DoS) Attack

A denial-of-service attack (DoS) aims to obstruct a network, server, or application’s ability to process requests from legitimate users. By sending more traffic and overloading the network, the attacker exhausts the servers’ memory and bandwidth. 

Blockchains are the main target of DoS attacks to siphon off the wealth because of the enormous potential they hold. DoS attacks have happened to the most well-known cryptocurrencies, including Bitcoin and Ethereum. 

The DoS vulnerability in smart contracts allows for unlimited resource usage or contract manipulation. This causes the execution of routine tasks to be interrupted or causes the logic of the contract to break down. 

## Types of DoS

1. **Unexpected Revert DoS**

Let’s examine this DoS attack on smart contracts using an example of an auction contract. Every time a highest bid is received, the auction contract is updated and, if the previous bidder’s bid was lower than the current one, it is returned.

```solidity
    contract Auction {
        address frontRunner;
        uint256 highestBid;
        
        function bid() public payable {
            require(msg.value > highestBid, "Need to be higher than highest bid");
            // Refund the old leader, if it fails then revert  
            require(payable(frontRunner).send(highestBid), "Failed to send Ether");
            frontRunner = msg.sender;
            highestBid = msg.value;
        }
    }
```

The attacker contract’s constructor initializes it with the auction contract’s address, giving it access to the auction’s functions. By using the “attack()” function in this case, the attacker locks the amount, preventing the system from returning the attacker’s original bid amount even in the event that a higher bid comes in. 

```solidity
    import "./Auction.sol";  
    contract Attacker{
        Auction auction;
        
        constructor(Auction _auctionaddr){
            auction = Auction(_auctionaddr);
        }
        function attack (){
            auction.bid{value: msg.value}();
        }
    }
```

The reason for the unexpected revert is that the “attacker” contract lacks a “receive()” or fallback function to refund Ether. As a result, the attacker’s contract always remains the highest bidder. 

2. **Block Gas Limit DoS** 
The maximum amount of gas that can be used by the block is based on the amount of computation that needs to be done. There are two different types of DoS attacks that can result from going over the gas cap.

- ***Gas Limit DoS – Unbounded Contract Operation***
There is a predetermined gas limit, and transactions fail if their gas consumption exceeds the predetermined limit. 

When the attacker controls the required gas, the situation gets worse. Let’s understand this scenario with the help of an example:

```solidity
    struct Payee {
        address addr;
        uint256 value;
    }
    
    Payee[] payees;
    uint256 nextPayeeIndex;
    
    function payOut() {
        uint256 i = nextPayeeIndex;
        while (i < payees.length && msg.gas > 200000) {
        payees[i].addr.send(payees[i].value);
        i++;
        }
        nextPayeeIndex = i;
    }  
```

In this contract, in exchange for a very small refund, the attacker can add a few addresses. The gas fee associated with each refund causes the gas cost to go over the limit that stops the refund transactions from happening, and the smart contract reverts the transaction every time the payout function is called. 

Therefore, necessary steps must be considered while implementing a loop over an array. 

- ***Block Stuffing***

The attacker launches this attack to stop transactions from adding to the blocks by sending computationally expensive transactions. To use up the entire gas limit, several similar transactions are issued. 

The attacker makes sure that only the intended transactions, and not the rest, are added to the blocks by paying the high gas fee. 

3. **Owner Action**

Many contracts have a specific owner address that has the power to initiate or halt transactions. The owner’s address is crucial to the operation; therefore, if it is lost, the user will be unable to send tokens at all, and the contract will cease to function.

## Impact Of DoS Attack

The following are collateral losses that a DoS attack on the blockchain can bring about in addition to the suspension of smart contract operations:

**Bloated ledger:** The blockchain ledger is where the transactions are recorded permanently. For double-spend checks, the blockchain nodes keep a copy of each transaction. The ledger can be overrun by spam transactions during a DoS attack.

**Network traffic:** Every node in the blockchain receives a copy of the transaction. A DoS flooding may result in a large transaction volume in the peer to peer network, consuming the network bandwidth. 

**Node failures:** Blockchain relies on nodes, which need software support to handle large amounts of data. The nodes may run out of memory during transaction flooding, stopping the operations.

## How to write DoS safe smart contracts?

1. DoS attacks can be avoided by changing the payment system in your smart contract from a push model to a pull model.

In the **Unexpected Revert DoS** section, the bid() function has a push model to refund the previous bidder, i.e., the smart contract tries to send the fund to the worthy address. This can be changed to the pull model wherein the smart contract requires the worthy address to request their funds by using the withdraw() function as follows:

```solidity
    contract Auction {
        address frontRunner;
        uint256 highestBid;
        mapping(address => uint) public balances;
        function bid() public payable {
            require(msg.value > highestBid, "Need to be higher than highest bid");
            // update previous bidder info
            balances[frontRunner] += highestBid;
            // update new bidder
            frontRunner = msg.sender;
            highestBid = msg.value;
        }
        function withdraw() public nonReentrant {
            require(msg.sender != frontRunner, "Current frontRunner cannot withdraw");
            uint amount = balances[msg.sender];
            balances[msg.sender] = 0;
            (bool sent, ) = msg.sender.call{value: amount}("");
            require(sent, "Failed to send Ether");
        }
    }
```

2. **By avoiding unbounded loops**
Any loop with no restrictions on the number of iterations is considered an unbounded loop. It goes without saying that a sender can execute functions with unbounded loops up until the transaction’s gas limit. 

Software clients are not restricted by the number of distinct calls they make to a contract, but the maximum permitted computational complexity severely restricts each contract transaction and call. Therefore, we should focus on patterns that shift consumption from the scarce resource to the abundant resource. 

Instead of a contract function that repeats a step 1000 times, it is preferable to have a software client perform 1000 tiny contract function calls to complete 1000 steps.  

In your smart contract, you should stay away from things like sort algorithms because their cost of operation can multiply depending on their complexity. Basically, take on-chain operations that may have variable cost which can crank up gas consumption a lot and break them into many smaller fixed cost operations.

## Conclusion

Computation on a distributed computer comes with a cost. Gas cost for computation and gas limit is a feature of ethereum blockchain that makes sure the network is not exploited. It’s necessary for a smart contract developer to write code keeping both gas cost and gas limit in mind. In this lesson, we analyzed DoS attacks and their effects, demonstrated how they work and discussed a potential defense against them.