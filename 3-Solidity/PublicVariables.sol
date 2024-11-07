// SPDX-License-Identifier: MIT

pragma solidity 0.8.7;

contract NumberStorage {
    // if we don't assign the variable with the public or private then the visibility of the variable will be internal
    uint public num;

    function setNumber(uint _num) public {
        num = _num;
    }

    function getNumber() public view returns (uint) {
        return num;
    }
}