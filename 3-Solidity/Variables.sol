// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract NumberStorage {
    // uint -> unsigned integer which holds only postive values
    uint num;

    function setNumber(uint _num) public {
        num = _num;
    }

    function getNumber() public view returns (uint) {
        return num;
    }
}

contract MyContract {
    // after assigning the constant variable with a value its value can't be changed throughout the contract 
    uint constant PRICE = 2;

    function setPrice() public {
        PRICE = 1; // here you will get an error
    }

    // for changing the value we have to assign the variable with the immutable keyword
    // immutable -> we don’t need to assign its value during the declaration. However, once it is assigned, it cannot be changed.
    // but for the declaration of the immutable variables it can only be done initialized inline or assigned directly in the contructor
    uint immutable price;

    constructor() {
        price = 1;
    }

    function setprice() public {
        price = 1; // before assigning the value at the contructor here it will show the error.
    }
}