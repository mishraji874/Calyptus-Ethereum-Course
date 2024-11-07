// While executing a function, sometimes we write on the blockchain i.e. change state variables as shown below:

// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract ViewPure {
    uint x;

    function changeVariable() public {
        x = 100;
    }
}

// Here, x is a state variable and in the function changeVariable, we’re changing the value of x, hence writing on the blockchain.

// But sometimes, we just want to read from the blockchain, usually in functions that return the value of a variable. In the above example, we can add a function getVariable that reads/returns the value of x. It doesn’t change any state variable i.e. doesn’t write anything on the blockchain. Hence we add the keyword view while declaring it as shown below:

// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract ViewPure {
    uint x;

    function changeVariable() public {
        x = 100;
    }

    function getVariable() public view returns (uint) {
        return x;
    }
}

// If we’re writing a function that neither writes on the blockchain nor reads anything from it, we add the keyword pure while declaring it as shown below:

// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract ViewPure {
    uint x;

    function changeVariable() public {
        x = 100;
    }

    function getVariable() public view returns (uint) {
        return x;
    }

    function addNumbers() public pure returns (uint) {
        return (1 + 2);
    }
}

// In the above contract, we have a function addNumbers where we’re simply adding two numbers. Since it doesn’t read or write anything on the blockchain, we’ve declared this function with the keyword pure.
