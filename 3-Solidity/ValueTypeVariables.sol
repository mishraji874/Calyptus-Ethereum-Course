// Just like in most programming languages, solidity has two categories for data types – reference types and value types.

// In this lesson, we will learn about value-type variables. A value-type variable stores its value directly in the memory. These types of variables are always passed by value. That means, whenever they are passed into a function as arguments, their value is copied instead of passing the actual reference to the variable. If the function modifies the value of the argument, it’s not reflected in the original variable. 

// Value types in Solidity:

// Booleans
// Integers
// Unsigned integers
// Addresses
// Fixed-size byte arrays (bytes1 to bytes32)
// Enums
// Fixed point numbers (they are not fully supported yet)
// Let’s have a look at an example:

//SPDX-License-Identifier: MIT
pragma solidity 0.8.7;
 
contract MyContract {
   uint num = 2;
 
    function modify(uint _val) public pure returns(uint){
       _val = _val + 1;
       return _val;
   }
 
  
   function modifyNum() public view returns(uint){
       return modify(num);
   }
 
 
   function getNum() public view returns(uint){
       return num;
   }
}


// In the above code, we have:

// A state variable num.
// A public function modify() that increments the value of the _val argument passed and returns the modified value of _val.
// This function is declared as pure as it doesn’t utilise the state of the contract.

// A public function modifyNum() that calls the modify() function with state variable num as the argument and returns it.
// This function is declared as view because it uses the state variable num but doesn’t modify it. 

// A public return function getNum() that returns the value of num.