// In Solidity, we can create key-value pairs using Mappings. For example:

// Student names against their role numbers,
// Wallet balances against wallet addresses,
// and so on.

// A mapping is declared as follows :

// mapping(address => uint) public balances;
// It creates a mapping called balances with a key of type address and value of type uint. Thus, we can use this mapping to store wallet balances (uint) against wallet addresses (address).

// If we want to assign a particular balance (say 100) of a token to a particular address, we do it as follows:

// balances[key] = value;

// i.e.

// balances[0x5B38Da6a701c568545dCfcB03FcB875f56beddC4] = 100;
// Suppose you’ve created a token and you want to create a list of existing addresses, with a token balance assigned to each address, so that the address owner can claim it later.

// The following smart contract contains functions to set balances of different wallets and read the balance of a particular wallet using mappings:

// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract Mapping {
    mapping(address => uint) public balances;

    function setBalance(address _address, uint _balance) public {
        balances[_address] = _balance;
    }

    function getBalance(address _address) public view returns (uint) {
        return balances[_address];
    }
}

// The function setBalance takes two parameters: _address and _balance. It then sets the provided balance (_balance) against the provided address (_address) in the mapping. Thus, you can provide any address with a particular value for its token balance.

// The function getBalance takes a parameter for address and returns the token balance value assigned to it.

// If the address provided as an argument to the getBalance function doesn’t exist in the mapping, it will return a default value of 0 as its token balance.
