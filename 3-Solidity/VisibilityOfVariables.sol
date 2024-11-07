// Each function or state variable in a smart contract is accompanied by a keyword that specifies its visibility i.e. public, private, internal or external.

// This keyword determines where a particular function or state variable can be accessed from.

// A function can be declared as:

// Public – Any contract or account can access it
// Private – Only the contract in which it is defined can access it
// Internal – The contract in which it is defined and its child contracts can access it
// External – Only other contracts and accounts can access it
// State variables can be declared as public, private, or internal but not external. The default visibility is internal.

// The following contract shows the variables and functions with different visibilities. Since the visibility of the variable myAdd isn’t mentioned, it’s internal by default.

// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract Visibility {
    uint public num = 10;
    string internal str = "hello";
    address myAdd = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;

    function publicFunc() public view returns (uint) {
        return num;
    }

    function privateFunc() private view returns (uint) {
        return num;
    }

    function internalFunc() internal view returns (uint) {
        return num;
    }

    function externalFunc() external view returns (uint) {
        return num;
    }
}

// In this contract, the variable num and function publicFunc can be accessed from any contract or account.

// The function privateFunc can be accessed from only this contract.

// The variable str and function internalFunc can be accessed from this contract and from any other contract that inherits this contract.

// The function externalFunc can only be accessed from external accounts or contracts.

// Now let’s write a child contract that inherits from the Visibility contract defined above.

// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract Visibility {
    uint public num = 10;
    string internal str = "hello";
    address myAdd = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;

    function publicFunc() public view returns (uint) {
        return num;
    }

    function privateFunc() private view returns (uint) {
        return num;
    }

    function internalFunc() internal view returns (uint) {
        return num;
    }

    function externalFunc() external view returns (uint) {
        return num;
    }
}

contract VisibilityChild is Visibility {

}
// As you can see, we’ve added a contract called VisibilityChild that inherits from the Visibility contract. The contract doesn’t VisibilityChild have any additional variables and functions.
