# Cryptographic Hash Functions

Cryptographic Hash functions are special one-way mathematical functions that take variable size data/message as an input and produce a fixed size hash value as an output. 

In relation to Blockchains they are mostly used to ensure the integrity of transactions however they also perform an essential role in proof of work consensus mechanism and wallet address generation. 

It is because of the immutable nature of Cryptographic Hash functions that Blockchains are known to be immune to modification once something has been recorded on it.

Some of the important  properties of cryptographic hash functions are listed below:

- **Ease of Computation:** It is easy to  compute the hash value for any given input message
- **Deterministic:** The same message always results in the same hash value 
- **Non-invertible:** It is computationally infeasible to recover the input from a given  hash value 
- **Uniform distribution:** The probability of a hash value is the same as any other for a range of inputs 
- **Collision resistance:** No two different inputs yield the same hash
- **Immutable:** It is computationally infeasible to modify a message without its hash value being changed

## SHA256

SHA(Secure Hashing Algorithm)-256 is a variant of SHA-2 developed by the National Security Agency in 2001. 

**SHA256 takes arbitrary size message/data as input and produces a hash value of 256 bits. **

SHA256 is used by some of the most popular authentication protocols like Secure Sockets Layer (SSL), Transport Layer Security (TLS),  Secure Shell (SSH) and many more. 

Regarding Blockchain specifically, cryptocurrencies, like Bitcoin, use SHA256 for verifying transactions. It is also an integral part of Bitcoin’s Proof of Work  consensus mechanism.

For computing  SHA256 hash on any arbitrary size message sha256 submodule of  ethereum-cryptography library exposes the following function:

```javascript
    function sha256(msg: Uint8Array): Uint8Array;
```

Let’s now explore the library to try SHA256 by creating empty SHA256.js file in any editor of your choice and then following steps below:

**Step-1:**   Import the sha256  hash function submodule from Ethereum-Cryptography library

```javascript
    const { sha256 } = require("ethereum-cryptography/sha256");
```

**Step-2:**  Import other necessary submodules from ethereum-cryptography library for making sha256 to accept input in the form of string and return value in the form of hex 

```javascript
const { utf8ToBytes } = require("ethereum-cryptography/utils");  // Allows to pass string as parameter to SHA256

const { bytesToHex } = require("ethereum-cryptography/utils");  // Helps to get output from SHA256 in hexadecimal form
```

**Step-3:** Take  SHA256 hash  on any arbitrary  input message and display it to console

```javascript
    console.log(bytesToHex (sha256(utf8ToBytes("Calyptus"))))
```

**Step-4:** To test it you need to run the following command

```javascript
    node SHA256.js
```

## keccak-256

keccak256 is a cryptographic hashing  algorithm from **SHA-3** family. It computes the hash of variable size input to a fixed size hash value of 256 bits. 

In essence, keccak256 which is used in Ethereum Blockchain, is a variant of sha3-256 with  some constants changed in the code. 

Keccak was the winner of the sha3 NIST (National Institute of Standards and Technology) competition. For computing keccak256 hash on any arbitrary size message, the keccak-256 submodule of ethereum-cryptography library exposes the following function:

```javascript
    function keccak256(msg: Uint8Array): Uint8Array;
```

Let’s now explore the library to try keccak256 by creating an empty Keccak256.js file in any editor of your choice and then following steps below:

**Step-1:**   Import the  keccak256 hash function  submodules from the Ethereum-Cryptography library

```javascript
    const { keccak256 } = require("ethereum-cryptography/keccak");
```

**Step-2:**  Import other necessary submodules from the ethereum-cryptography library to allow keccak256 to accept input in the form of string and return value in the form of hex  

```javascript
    const { utf8ToBytes} = require("ethereum-cryptography/utils");  // Allows to pass string as parameter to keccak256

    const { bytesToHex} = require("ethereum-cryptography/utils");  // Helps to get output from keccak256 in hexadecimal form
```

**Step-3**: Take  keccak256 hash  on any arbitrary  input message and display it to console

```javascript
    console.log(bytesToHex(keccak256(utf8ToBytes("Calyptus"))))
```

**Step-4**: To test it you need to run the following command

```javascript
    node Keccak256.js
```

## RIPEMD 160

RIPEMD160 is a secure cryptographic hash function which computes the **hash of variable size input to a fixed size hash value of 160 bits**. 

RIPEMD-160 is the most widely used variant among all the members of the RIPEMD family.

RIPEMD-160 is used in the Bitcoin address generation process and in the popular internet security program, Pretty Good Privacy (PGP). 

For computing RIPEMD160 hash on any arbitrary size message ripemd160 submodule of ethereum-cryptography library exposes the following function:

```javascript
    function ripemd160(msg: Uint8Array): Uint8Array;
```

Let’s now explore the library to try ripemd160 by creating an empty Ripemd160.js file in any editor of your choice and then following steps below:

**Step-1:** Import the ripemd160 hash function submodule from ethereum-cryptography library

```javascript
    const { ripemd160 } = require("ethereum-cryptography/ripemd160");
```

**Step-2:**  Import other necessary submodules from ethereum-cryptography library for making ripemd160 to accept input in the form of string and return value in the form of hex  

```javascript
    const { utf8ToBytes} = require("ethereum-cryptography/utils");  // Allows to pass string as parameter to ripemd160

    const { bytesToHex} = require("ethereum-cryptography/utils");  // Helps to get output from ripemd160 in hexadecimal form
```

**Step-3**: Take  ripemd160 hash on any arbitrary input message and display it to console

```javascript
    console.log(bytesToHex(ripemd160(utf8ToBytes("Calyptus"))))
```

**Step-4**: To test it you need to run the following command

```javascript
    node Ripemd160.js
```

## BLAKE2b

BLAKE2b is a member of the BLAKE2 family of cryptographic hash functions which is an improved version of the SHA-3 NIST competition finalist BLAKE. 

BLAKE2b is a highly secure and fast cryptographic hash function which **accepts variable size input and produces a hash value of 512-bits**. 

For computing  BLAKE2b hash on any arbitrary size message the blake2b submodule of ethereum-cryptography library exposes the following function:

```javascript
    function blake2b(msg: Uint8Array): Uint8Array;
```

Let’s now explore the library to try blake2b by creating empty Blake2b.js file in any editor of your choice and then following steps below:

**Step-1:** Import the  blake2b hash function  submodule from ethereum-cryptography library

```javascript
    const { blake2b } = require("ethereum-cryptography/blake2b");
```

**Step-2:**  Import other necessary submodules from ethereum-cryptography library for making blake2b to accept input in the form of string and return value in the form of hex  

```javascript
    const { utf8ToBytes} = require("ethereum-cryptography/utils");  // Allows to pass string as parameter to blake2b

    const { bytesToHex} = require("ethereum-cryptography/utils");  // Helps to get output from blake2b in hexadecimal form
```

**Step-3:** Take  blake2b hash  on any arbitrary  input message and displaying it to console

```javascript
    console.log(bytesToHex(blake2b(utf8ToBytes("Calyptus"))))
```

**Step-4:** To test it you need to run the following command

```javascript
    node .\Blake2b.js
```

