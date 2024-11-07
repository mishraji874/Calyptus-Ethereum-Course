# Tx.origin Phishing

## What is tx.origin?
Solidity’s tx.origin global variable returns the account’s address that initiates a transaction. For a transaction to initiate on the ethereum blockchain, it has to have an external caller account. Such accounts which are not a smart contract on the blockchain itself are called Externally Owned Accounts(EOA). 

The account associated with your wallet, for instance, is an EOA. Here’s Vitalik Buterin’s EOA for your reference: 0xd8da6bf26964af9d7eed9e03e53415d37aa96045. 

Tx.origin is a useful variable for finding out EOAs that have initiated a transaction. For example, You can find out what address made the call to your contract by using the tx.origin global variable. This could be helpful if you wanted to allow or deny a particular address the ability to interact with your contract. 

You can also keep track of how many times a particular EOA interacts with your smart contract by using tx.origin and a counter.

## Vulnerability With tx.origin

The idea behind tx.origin is to indicate who originated the transaction. However, as we will soon see this can be misleading and opens contracts up to the possibility of being exploited if used without caution.

Consider this simple Wallet contract, the comments shall help you understand what the smart contract does:  

```solidity
    contract Wallet {
        address public owner;
        
        // set my deployer as my owner:
        constructor() payable {
            owner = msg.sender;
        }
        
        // send Eth to any address _to via transfer function if 
        //  the originator of the transaction is the owner of 
        // this smart contract:
        
        
        
        function transfer(address payable _to, uint _amount) public {
                require(tx.origin == owner);
        
                (bool sent, ) = _to.call{value: _amount}("");
                require(sent, "Failed to send Ether");
        }
    }
```

So the contract will send Eth to someone only if the originator of the transaction that calls the transfer function is the owner. Seems fair, right? Here comes the catch. Any intermediate smart contract can misuse a transaction initiation from the legitimate owner to call the transfer function. 

Let’s understand this with an example. Let’s say the owner sends some Eth to a malicious smart contract for whatever reason. Or they mistakenly call a fraud function on a smart contract. That smart contract can then in its operation call the transfer function of the wallet contract to steal the funds away. The authentication will pass because the originator of the transaction will be the legitimate owner, albeit he does not intend the transfer to happen. 

Here is a snippet of the smart contract that can steal funds from the wallet if the owner interacts with it:

```solidity
    // To steal the funds:
    
    // Make the Owner of Wallet call this function:
    function attack() public {
        // Transfer Wallet's funds to the hacker
        wallet.transfer(hacker, address(wallet).balance);
    }
    
    // Or make the owner send some Eth to this contract's address
    // which will trigger fallback() like this:
    fallback() payable {
        // Transfer Wallet's funds to the hacker
        wallet.transfer(hacker, address(wallet).balance);
    }
```


## Prevention

Contrary to tx.origin, msg.sender is a global variable that points to the immediate address that sent the transaction rather than the EOA that initiated it. The easiest way to prevent this from occurring is to use msg.sender instead of tx.origin in authentication applications. 