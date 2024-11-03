// In Solidity, an error is handled using any of the following three keywords :

// require
// revert 
// assert 


// Require

// require statement is usually used to check any input or external condition before executing a function. For example, it can be used to check if the account executing the function is the owner of the smart contract:

function example1() public {
    require(msg.sender == owner, “You’re not the owner!”);
    // rest of the function
}

// Before executing the above function, Solidity checks if the account calling the function is the owner of the smart contract. Only if it’s true, the rest of the function is executed. Otherwise it throws the custom error message : ”You’re not the owner!”.

// The custom error message is not mandatory and you can skip it as shown below:

function example1() public {
    require(msg.sender == owner);
    // rest of the function
}

// In the above case if the condition is not met, we’ll just get an error without any custom message. 

// require statement is not necessarily used at the beginning of the function. There can be code before the require statement too, as shown below:

address a;
address owner = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;


function example1() public {
    a = msg.sender;
    require(msg.sender == owner);
    // rest of the function
}

// In the above example, we declare a variable a of type address that has a default value of 0x000000….. i.e. address 0.

// In the function example1, we first assign the variable a equal to msg.sender. Then we check if msg.sender is the owner of the contract. If it’s false, then the rest of the function isn’t executed. Also, any state change we made in the function gets reverted i.e. the value of variable a also gets reverted to address 0.

// This is also true for error handling with revert and assert.

// Revert

// revert statement works similarly. We use the if keyword along with it as shown below:

function example2() public {
    if (msg.sender != owner) {
        revert("You're not the owner!");
    }
    //rest of the function
}

// Just like the example regarding the require statement, it also checks if the account calling the function is the owner of the smart contract. If they’re not the same, it throws an error message with the custom message: “You’re not the owner!”.

// This works exactly the same as the require statement example we discussed earlier.

function example1() public {
    require(msg.sender == owner, “You’re not the owner!”);
    // rest of the function
}


// Assert

// assert statement is usually used to check for a condition that should never be false. A failed assert check probably means that the code has a bug.

// Below is an example of how an assert check is used:

uint num1 = 1;
uint num2 = 4;

function example3() public view {
    uint num3 = num1 + num2;
    assert(num3 == 5);
}

// In the above example, we’re equating num3 to the sum of num1 and num2, and then assert if it’s equal to 5. If it’s not true, any state changes in the function example3 are reverted.