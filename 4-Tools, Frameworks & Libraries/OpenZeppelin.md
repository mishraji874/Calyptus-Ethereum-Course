# Your Future Best Friend, OpenZeppelin

OpenZeppelin is a smart contract library that is available on Github and can be installed as an npm module. It offers a number of secure smart contracts that can be inherited in a custom smart contract to implement various functionalities for access control, cryptography, utilities token standards, security, governance, finance, etc.

Advantages of using a smart contract library:

- Reduces development time by ∼70%
- Reduces code redundancy
- Ensures secure code as all the contracts in the library are audited
- Pre-built functionalities and standardised implementation

OpenZeppelin has an efficient folder structure that differentiates smart contracts according to their functionalities. 

OpenZeppelin also offers a **Wizard** to create smart contracts using its library. Let’s try out this Wizard over a simple Counter smart contract that will allow us to increment and decrement a state variable num.

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;
 
import "@OpenZeppelin/contracts@4.7.3/access/Ownable.sol";
 
contract MyContract is Ownable {
 
   uint num;
 
   constructor() {
       num = 5;
   }
 
   function increment() public onlyOwner {
       ++num;
   }
 
   function decrement() public onlyOwner {
       --num;
   }
 
   function getNum() public view returns (uint) {
       return num;
   }
}
```

We have used **onlyOwner** modifier here from **Ownable.sol** that ensures that the functions increment and decrement can only be called by the contract owner. By default, the deployer of the contract is the owner of the contract.

We can change the ownership of the contract by using the transferOwnership function of the Ownable.sol contract.

Similarly, you can use other smart contracts as well from the OpenZeppelin library to implement various functionalities, such as in finance, security, access control, tokenization, etc.