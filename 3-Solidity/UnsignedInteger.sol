//SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract MyContract {
    uint a = 2;
    uint b = 3;

    function add() public view returns (uint) {
        return a + b;
    }

    function sub() public view returns (uint) {
        return a - b;
    }

    function mul() public view returns (uint) {
        return a * b;
    }

    function div() public view returns (uint) {
        return a / b;
    }
}
