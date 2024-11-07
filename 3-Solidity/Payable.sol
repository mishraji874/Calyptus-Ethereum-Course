// Addresses declared as payable can receive ether via smart contract. Similarly, functions declared as payable can receive ether in the smart contract.

// The following contract explains the concept in detail:

// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract Payable {
    bool paid;
    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
    }

    function payment() public payable {
        require(msg.value == 0.1 ether, "Amount not sufficient!");
        paid = true;
    }

    function withdraw() public {
        require(msg.sender == owner, "Only owner can withdraw!");
        owner.transfer(address(this).balance);
    }
}

// owner variable is declared as payable and is assigned as msg.sender on deployment.

// Function payment is also declared as payable. A user can call this function and pay 0.1 eth as mentioned in the require statement.

// On execution of the payment function, the eth will be stored in the smart contract.

// Since owner is a payable address, it can withdraw the eth stored in the contract with the withdraw function to its address.

// It is done by using the address (owner in this case) followed by the transfer keyword and then mentioning the balance in the parentheses. The balance of the contract is accessed by the statement address(this).balance.

// Hence, we can pay a smart contract using a payable function. And the smart contract can pay an address if the address is declared as payable.

// In the above example, we’ve used the ‘transfer’ keyword to transfer ETH to the receiver.

// owner.transfer(address(this).balance);
// There are two other ways to do it.

// Send

// We can use the ‘send’ keyword to send ETH as shown below:

function withdraw() public {
    require(msg.sender == owner, "Only owner can execute withdrawal!");
    bool sent = owner.send(address(this).balance);
    require(sent, "Failure to send Ether.");
}

// In the ‘transfer’ statement earlier, if the transaction failed, it throws an error message.

// But the ‘send’ statement doesn’t throw an error message on failure. Instead, it returns true or false depending on the transaction status. That’s why we assign the returned value to a bool variable sent as shown above.

// And finally, we add a require statement to confirm that the transaction has gone through.

// Call

// The most recommended method currently to send ether is to use the ‘call’ keyword. That’s because it’s used in combination with the re-entrancy guard to protect our smart contract against the re-entrancy attack that we’ll learn in the advanced security module.

// The ‘call’ statement is used as shown below:

function withdraw() public {
    require(msg.sender == owner, "Only owner can execute withdrawal!");
    (bool sent, ) = owner.call{value: address(this).balance}("");
    require(sent, "Failure to send Ether.");
}

// Just like the ‘send’ statement, it also returns a bool value. This is the most recommended method for sending ETH and so we’ll use this method lots in future lessons and modules.
