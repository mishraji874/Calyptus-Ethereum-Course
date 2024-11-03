// Fixed-Size Byte Array

// It’s used for storing fixed size bytes value, written with data-type bytesX, where X represents the length of bytes, which can vary from 1 to 32. So we can declare bytes array as bytes1, bytes2, bytes3, … , and so on till bytes32.

// bytes1 a = 0x12;
// Below is a list of operations that can be performed on a bytesX type variable:

// Comparisons: <=, <, ==, !=, >=, > (evaluate to bool)
// Bit operators: &, |, ^ (bitwise exclusive or), ~ (bitwise negation)
// Shift operators: << (left shift), >> (right shift)
// Index access: If x is of type bytesI, then x[k] for 0 <= k < I returns the k th byte (read-only).

//SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract MyContract {
    bytes1 a = 0x12;
    bytes2 b = 0x1234;

    function compare() public view returns (bool) {
        return b > a;
    }

    function bitOperations() public view returns (bytes2) {
        return a & b;
    }

    function leftShift() public view returns (bytes1) {
        return a << 1;
    }

    function returnAtIndex(uint _index) public view returns (bytes1) {
        return b[_index];
    }
}

// Shift operators take an unsigned integer as the right operand that specifies the number of bits to shift (but return the type of the left operand). Shifting in a signed type causes a compile error.

// We can find the length of the bytes array by .length member of bytes class.

contract MyContract1 {
    bytes1 a = 0x12;

    function returnLength() public view returns (uint) {
        return a.length;
    }
}

// Dynamic-Size byte Array

// Dynamic sized byte arrays are declared with the data-type bytes, with no length specified.However, you can calculate their length afterwards by using the length member.

contract MyContract2 {
    bytes a = "Hello";

    function returnLength() public view returns (uint) {
        return a.length;
    }
}
