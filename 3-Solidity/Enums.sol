// Enum is another way of creating user-defined data types. Enums restrict a variable to have one of only a few predefined values.

// For example, for a video game we can represent the level that the player has reached with an enum as follows :

// enum PlayerLevel {
//      Beginner,
//      Intermediate,
//      Advanced
//  }
// Thus, PlayerLevel becomes a data type that can only have a value of Beginner, Intermediate or Advanced represented by 0, 1 and 2 respectively.

// We can declare a variable of type PlayerLevel as follows:

// PlayerLevel public level;
// The default value of level on declaration would be Beginner i.e. 0.

// Let’s look at another example of using an Enum. The following smart contract creates an enum for representing the shipment status of a package, and provides functions for setting the status and reading the status:

// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract Enum {
    enum Status {
        Ordered,
        Shipped,
        Delivered,
        Cancelled
    }

    Status public status;

    function setStatus(Status _status) public {
        status = _status;
    }

    function getStatus() public view returns (Status) {
        return status;
    }
}

// The setStatus function takes an argument (0, 1, 2 or 3) and assigns that value to the status variable.

// The getStatus function returns the current value of status. The returned value is either 0, 1, 2 or 3 representing Ordered, Shipped, Delivered and Cancelled respectively.
