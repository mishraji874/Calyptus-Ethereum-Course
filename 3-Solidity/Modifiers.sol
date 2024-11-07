// A Function Modifier is code that can be run before and/or after a function call.

// Suppose there’s a line of code that needs to be written before/after many different functions. Instead of writing that command again and again inside every function body, you can create a function modifier that can be used during those function calls.

// For example, if you want to ensure that the person calling the function is the owner of the contract, you need to add the following line of code at the beginning of the function:

//  require(msg.sender == owner);
// Now if you want to use this in 3 functions, you need to add this line of code in all the 3 functions as shown below:

// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract Modifier {
    address owner = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    address a;
    address b;
    address c;

    function example1() public {
        require(msg.sender == owner);
        a = msg.sender;
    }

    function example2() public {
        require(msg.sender == owner);
        b = msg.sender;
    }

    function example3() public {
        require(msg.sender == owner);
        c = msg.sender;
    }
}

// In the above example, we have three functions: example1, example2, example3 and we use the following line of code at the beginning of all these three functions:

// require(msg.sender == owner);
// Instead we can create a modifier that does the same. A modifier is declared with the keyword modifier followed by any name we give it. Let’s name our modifier as onlyOwner as shown below:

// modifier onlyOwner {
//       require(msg.sender == owner);
//       _;
//  }

// Inside the modifier, we write our prerequisite statement i.e.

// require(msg.sender == owner);
// followed by:

// _;
// This symbol represents the rest of the code of the function where the modifier is used. Let’s understand it with an example.

// If we use the onlyOwner modifier in the example1 function, we don’t need to write the require statement. Instead, we can just mention onlyOwner while declaring the function as shown below:

// function example1() public onlyOwner {
//       a = msg.sender;
//  }

// When this function is executed, it first executes the require statement in the onlyOwner modifier. After that, it executes the rest of the example1 function as indicated by the _; symbol in the onlyOwner modifier.

// Thus, we can write the entire smart contract as:

// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract Modifier {
    address owner = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    address a;
    address b;
    address c;

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    function example1() public onlyOwner {
        a = msg.sender;
    }

    function example2() public onlyOwner {
        b = msg.sender;
    }

    function example3() public onlyOwner {
        c = msg.sender;
    }
}
// In the above smart contract, before executing any function, the require statement in the onlyOwner modifier is checked. Only if it’s true, the rest of the function is executed.

// Please note that we can also add lines after the function code with modifiers. For example, in the above example if we need to update a counter every time a function is called, we can do it as depicted below:

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Modifier {
    address owner = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    address a;
    address b;
    address c;
    uint count;

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
        count++;
    }

    function example1() public onlyOwner {
        a = msg.sender;
    }

    function example2() public onlyOwner {
        b = msg.sender;
    }

    function example3() public onlyOwner {
        c = msg.sender;
    }
}
// In the above example, every time the function example1, example2, or example3 is called, it checks :

// if msg.sender is equal to owner
// executes the function
// updates the count variable.
