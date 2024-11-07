// Strings in Solidity represent a stream of characters. To declare a string in Solidity, we use the data-type string.

// string message = "hello";
// Here, message can contain a stream of characters of any length. An empty string is denoted by “”.

// A string can contain letters, numbers and special characters.

//SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract Inbox {
    string message;

    //  calldata and memory. These are storage specifiers to specify the memory location of dynamic variables. Dynamic variables are those whose size is not defined. 
    function setMessage(string calldata _message) public {
        message = _message;
    }

    function getMessage() public view returns (string memory) {
        return message;
    }
}

// Storage:

// The permanent storage of the contract from where all functions can access data like the hard disk of your device. All the state variables are stored in storage location of the contract by default.
// string message;

// Memory:

// The temporary storage of the contract where local variables like the one defined inside a function, the parameters of the function, or return values of a function. This can be thought of as the RAM of your computer. Once the function is executed, the local variables are discarded from the memory. 
// function getMessage() public view returns(string memory)

// Calldata:

// The same as memory location but is immutable in nature. calldata is always recommended when you want to use the function parameters or other local variables as is, without modifying their values. 
// function setMessage(string calldata _message) public 

// Stack:

// This also saves the variables in a temporary location only within a stack at the time of execution and is maintained by EVM (Ethereum Virtual Machine). 