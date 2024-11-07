// An address type variable is used to store an account address or a smart contract address. A variable declared as address can only hold valid address hex strings and no other string value.
//  address account = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;

// We can compare two addresses using “==”.

//SPDX-License-Identifier:MIT
pragma solidity 0.8.7;

contract MyContract {
    // The function here is declared as pure because it’s not using any of the state variables or the environment and is a totally independent function
    function checkEqual(
        address _acc1,
        address _acc2
    ) public pure returns (bool) {
        return (_acc1 == _acc2);
    }
}

// For calculating the balance of the address
contract MyContract1 {
    // The getBalance function is declared as view because it is fetching balance from the environment but doesn’t modify anything.
    function getBalance(address _account) public view returns (uint) {
        return _account.balance;
    }
}
