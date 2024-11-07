# Insecure Arithmetic

## Overflow, Underflow
In pure mathematics, there are no overflowing numbers. One can add any two large numbers together and get an exact result. High-level programming languages like Python and JavaScript also prevent numbers from overflowing. Even though the outcome in some cases could be infinite, adding two positive numbers may never result in a negative outcome. In Java and C++, floating-point numbers do not overflow, but integer numbers do.

Solidity’s integer types are not true integers, like many other programming languages. When the values are small, they resemble integers, but they are unable to represent arbitrary large numbers.

The following code causes an overflow because the result of the addition is too large to be stored in the type uint8 because the range of uint8 is 2^8-1 i.e., 255:

```solidity
    // Default: Checks for underflow/overflow
    uint8 x = 255;
    uint8 y = 1;
    return x + y;  //reverts the execution with an error
    
    
    // Wrapped in unchecked: does not check for underflow/overflow
    unchecked {
            uint8 x = 255;
            uint8 y = 1;
            return x + y; //returns 0
    }
```

Integer overflow and underflow checks were carried out using the SafeMath library prior to Solidity 0.8.0. As of Solidity 0.8.0 and later, the compiler performs that check for us. The compiler can handle these overflows in two different ways: checked and unchecked, or “wrapping” mode.

The default “checked” mode will detect overflows and cause a failing assertion. You can disable this check using “unchecked { … }”, causing the overflow to be silently ignored. The above code would return 0 if wrapped in “unchecked { … }” as shown in the above code block.

Do not assume you are safe from overflow bugs, even in checked mode. Overflows always revert to this mode. A smart contract may stick in a particular state such that it fails all executions if the overflow cannot be avoided. This is why you should always anticipate the chances of a variable going over/under its set limit and write checks to cope with it. 

Try to use require limiting the size of inputs to a reasonable range to find potential overflows. Below is a snippet of Uniswap’s V2 core contract. The business logic of this function is beyond the purview of this lesson, but you can see how Uniswap devs have explicitly put a require to the user input in the _update function:

```solidity
// update reserves and, on the first call per block, price accumulators
   function _update(uint balance0, uint balance1, uint112 _reserve0, 
   uint112 _reserve1) private {
 
    // Check out how they have explicitly put a require to the 
user input in the function:
 
      require(balance0 <= uint112(-1) && balance1 <= uint112(-1), 
'UniswapV2: OVERFLOW');
 
       uint32 blockTimestamp = uint32(block.timestamp % 2**32);
       uint32 timeElapsed = blockTimestamp - blockTimestampLast; 
 // overflow is desired
       if (timeElapsed > 0 && _reserve0 != 0 && _reserve1 != 0) {
           // * never overflows, and + overflow is desired
           price0CumulativeLast += uint(UQ112x112.encode(_reserve1).uqdiv(_reserve0)) * timeElapsed;
           price1CumulativeLast += uint(UQ112x112.encode(_reserve0).uqdiv(_reserve1)) * timeElapsed;
       }
       reserve0 = uint112(balance0);
       reserve1 = uint112(balance1);
       blockTimestampLast = blockTimestamp;
       emit Sync(reserve0, reserve1);
```

## When to use the Unchecked wrapping?

Solidity performs an additional check to make sure that the math you use in your smart contract does not overflow or underflow. These additional operations add to the opcode of the contract and thus cost gas. 

If we are certain that the mathematical operations we will perform as part of the contract won’t result in either overflow or underflow, we can tell the compiler to skip checking for them. When performing those functions, this can help the user of our contract save gas. Consider the below code snippet as an example:

```solidity
    function foo(uint8 _limit) public {
        for (uint i; i < _limit;) {
            // do something that doesn't change the value of i
            unchecked { ++i; }
        }
    }   
```

Here, the loop’s post condition i.e., ++i does not need to check for overflow/underflow because we have bound its value to strictly be under uint8 limit variable’s. The compiler already checks to make sure limit does not overflow/underflow. Thus, an error will be thrown if limit goes over 2^8-1 i.e., 255. As a result, i’s value can’t go over 2^8-2 i.e., 254. So it’s safe to put the ++i increment under the unchecked {…} wrap without losing on security. 

This little trick can save up to 30 to 40 gas per iteration, which can be significant if the number of iterations is large.

**Bonus:** In the above loop, notice how we have declared i in the loop but not initialized it. That’s because the default value of a uint in solidity is 0 and not null, unlike most languages. Thus, we don’t need to waste gas on explicitly initializing the variable.

**Bonus:** Notice how we’ve used ++i instead of i++. That’s because ++i costs less gas compared to i++ or i += 1 for an unsigned integer, as pre-increment is cheaper (about 5 gas per iteration). This statement is true even with the optimiser enabled.