// A constructor is a special function that is executed during the deployment of the smart contract. It is an optional function that can be used to initialise state variables of a contract. It is declared with the constructor keyword as shown in the following contract:

// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract ConstructorExample {
    uint public price;
    address public owner;

    constructor(uint _price) {
        price = _price;
        owner = msg.sender;
    }

    function changePrice(uint _price) public {
        require(msg.sender == owner);
        price = _price;
    }

    function getPrice() public view returns (uint) {
        return price;
    }
}

// In the above contract, we declare two variables, price and owner.
