// Using Inheritance, a child contract can inherit the properties of a parent contract. Solidity supports both single and multiple inheritance. It is useful when you already have a standard contract and you want to use the properties in another contract without writing everything from scratch.

// A contract is inherited into another contract using the “is” keyword. For example, in the following code, contract Child inherits contract Parent using the “is” keyword:

// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract Parent {
    uint public num = 10;

    function increment() public {
        num++;
    }
}

contract Child is Parent {
    function decrement() public {
        num--;
    }

    function incrementAndDecrement() public {
        increment();
        decrement();
    }
}

// Contract Parent has a state variable num, and a function increment. By inheriting this contract in the contract Child, we pass these properties to that contract. Now the child can access the num variable in its decrement function. It can also access the increment function in its incrementThenDecrement function.
