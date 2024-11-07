// Events are used to store any information regarding the smart contract in the transaction logs. This information is emitted by the events through its arguments. Thus, it’s a cheap form of storage for any smart contract data. It’s also used by the UI or an external script to listen to any updates in the current state of the contract data.

// In Remix, you can see the transaction logs in the terminal section after executing a function/transaction. You can also see the entire history of the transaction logs of a smart contract in Etherscan.

// For example, the following smart contract has a function addProduct. Using this we can add the product details in the mapping priceByProduct.

// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract Event {
    mapping(uint => uint) public priceByProduct;

    function addProduct(uint _productID, uint _price) public {
        priceByProduct[_productID] = _price;
    }
}

// We can access the data in the mapping inside any other function in the smart contract. The downside is that this form of data storage is quite expensive.

// Storing data in transaction logs via events is cheaper but the data can’t be accessed from inside the smart contract. It can be only accessed by an external UI or a script. Hence, if you don’t need to access the data from inside the smart contract, you can use events as shown below:

// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract Event {
    event ProductAdded(uint productID, uint price);

    function addProduct(uint _productID, uint _price) public {
        emit ProductAdded(_productID, _price);
    }
}

// With this, everytime the function addProduct is executed, the productID and price passed as the arguments in the event get stored on the transaction logs as shown in the terminal
