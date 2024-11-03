// In Solidity, an array can contain items of the same data type only i.e. a uint array will contain uint values, a string array will contain string values and so on.

// An array is declared by the data type followed by square brackets as shown below:

//  uint[] numArray;
// The above command initialises an array of data type uint. It is a dynamic array since we haven’t mentioned the array size i.e. it can contain any number of values.

// We can either initialise an array on declaration or do it later as shown below:

//  // initialised on declaration
//  uint[] numArray = [2, 4, 6];

//  // first declared and then initialised
//  string[] textArray;
//  textArray = ['a', 'b', 'c'];
// We can also add the visibility of the array i.e. public, external etc. By default it’s private.

// uint[] public numArray = [2, 4, 6];
// We can access a particular item inside an array by mentioning its index in the square bracket. In the above example, numArray[0] will return 2, numArray[1] will return 4 and so on.

// The first element of an array has 0 index, and it keeps increasing as we move forward.

// To declare a fixed-length array, we need to mention the length of the array in the square brackets while declaring.

//  uint[5] numArray = [1, 2, 3, 4, 5];

//  string[3] textArray = ['a', 'b', 'c'];
// A fixed size array should always be initiated while declaring as shown above.

// Array methods

// There are 3 popular array methods: push, pop, and length.

// An array method is appended to the array name using a dot notation and does something specific with that array.

// .length returns the length of the array.

// .push adds a value towards the end of the array.

// .pop removes the last value from the array.

// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract Array {
    uint[] numArray = [1, 2, 3, 4, 5];

    function arrayLength() public view returns (uint) {
        return numArray.length;
    }

    function elementByIndex(uint i) public view returns (uint) {
        return numArray[i];
    }

    function addValue(uint n) public {
        numArray.push(n);
    }

    function popValue() public {
        numArray.pop();
    }
}

// The above smart contract summarises the basic functionalities of an array.

// First of all, we declare a dynamic uint type array with 5 values.

//  uint[] public numArray = [1, 2, 3, 4, 5];
// The arrayLength function returns the length of the array. For our case, it should return 5.

//  function arrayLength() public view returns(uint) {
//      return numArray.length;
//  }
// The elementByIndex function takes an index position as an argument and returns the value at that index position from the array. For the numArray if we pass 3 as argument for index, it will return the value 4 (counting from 0 index).

// function elementByIndex(uint i) public view returns(uint) {
//      return numArray[i];
//   }
// The addValue function takes a parameter and adds it to the end of the array. If we pass the value 6 as an argument, the array becomes [1, 2, 3, 4, 5, 6].

// function addValue(uint n) public {
//      numArray.push(n);
//  }
// The popValue function removes the last value from the array. If the current array is [1, 2, 3, 4, 5, 6], the pop method will remove the last value i.e. 6 from the array and the array will become [1, 2, 3, 4, 5].

//  function popValue() public {
//      numArray.pop();
//  }