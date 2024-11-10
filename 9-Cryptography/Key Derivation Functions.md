# Key Derivation Functions

Key Derivation Functions (KDFs) are cryptographic algorithms that are mainly used to derive one or more secret keys from other sources of entropy like password, passphrase etc. Other use cases for KDFs include Key stretching and obtaining keys in the desired format.

Note: The pbkdf2 and Scrypt submodules of Ethereum-Cryptography library has two functions implementing the PBKDF2 and Scrypt key derivation algorithms in synchronous and asynchronous ways.  We will be exploring an asynchronous version for practical demonstration due to slowness of the  respective algorithms.

## PBKDF2

Password Based Key Derivation Function 2 (PBKDF2) is a type of KDF which is resistant to dictionary and rainbow table attacks. 

In essence, PBKDF2 takes several input parameters and produces a secret key with desired length as output. 

For generating secret keys pbkdf2 submodule of  Ethereum-Cryptography library exposes following function:

```javascript
    function pbkdf2(password: Uint8Array, salt: Uint8Array, iterations: number, keylen: number, digest: string): Promise<Uint8Array>;
```

Let’s now explore the library to try pbkdf2 by creating empty Pkdf2.js file in any editor of your choice and then following steps below:

**Step-1:**   Import the  pbkdf2 KDF  submodule from ethereum-cryptography library

```javascript
    const { pbkdf2 } = require("ethereum-cryptography/pbkdf2");
```

**Step-2:**  Import other necessary submodules from ethereum-cryptography library for making pkdf2 to accept input in the form of Bytes  and return value in the form of hex  

```javascript
    const { utf8ToBytes } = require("ethereum-cryptography/utils");

    const { bytesToHex} = require("ethereum-cryptography/utils");
```

**Step-3**:  Design async function for generating 32 -byte  hexadecimal secret key using asynchronous version of   pbkdf2  and displaying it to console

```javascript
    async function getPbkdf2(){

    console.log( bytesToHex( await pbkdf2(utf8ToBytes("Calyptus"), utf8ToBytes("Hello"), 999, 32, "sha256")));

    }

    getPbkdf2()
```

**Step-4**: To test it you need to run the following command

```javascript
    node .\Pbkdf2.js
```

## Scrypt

Scrypt is a strong cryptographic key derivation function, designed to be memory intensive to  thwart GPU, ASIC and FPGA based attacks. 

It takes several input parameters and produces a secret key with the desired length as output. 

For generating secret keys scrypt submodule of Ethereum-Cryptography library  exposes the following function:

```javascript
    function scrypt(password: Uint8Array, salt: Uint8Array, N: number, p: number, r: number, dkLen: number): Promise<Uint8Array>;
```

Let’s now explore the library to try  scrypt  by creating empty Scrypt.js file in any editor of your choice and then following the steps below:

**Step-1:**   Import the scrypt KDF  submodule from Ethereum-Cryptography library

```javascript
    const { scrypt } = require("ethereum-cryptography/scrypt");
```

**Step-2:**  Import other necessary submodules from ethereum-cryptography library for making scrypt to accept input in the form of Bytes and return value in the form of hex  

```javascript
    const { utf8ToBytes } = require("ethereum-cryptography/utils");

    const { bytesToHex} = require("ethereum-cryptography/utils");
```

**Step-3**: Write and call  getScrypt() async function for generating 32 -byte  hexadecimal secret key using asynchronous version of   scrypt and  displaying it to console

```javascript
    async function getScrypt() {

        console.log(bytesToHex(await scrypt(utf8ToBytes("Calyptus"), utf8ToBytes("Hello"), 1024, 8, 1, 32)));

    }

    getScrypt()
```

**Step-4**: To test it you need to run the following command

```javascript
    node .\Scrypt.js
```

## CSPRNG (Cryptographically strong pseudorandom number generator)

Cryptographically strong pseudorandom number generator (CSPRNG) generates pseudorandom numbers bearing  properties suitable for cryptographic usage. 

The security strength of the cryptographic systems heavily resides on the properties of these CSPRNGs.  

Cryptographically secure pseudorandom number generators are widely used for generating Nonces, Initial Vectors, Secret key materials etc. 

For generating random keys using random submodule of  Ethereum-Cryptography library  exposes following function:

```javascript
    function getRandomBytes(bytes: number): Promise<Uint8Array>;
```

Let’s now explore the library to try random submodule  by creating empty CSPRNG.js file in any editor of your choice and then following the steps below:

**Step-1:**   Import the  random submodule as getRandomBytes from Ethereum-Cryptography library

```javascript
    const { getRandomBytes} = require("ethereum-cryptography/random");
```

**Step-2:**  Import other necessary submodules from ethereum-cryptography library for allowing   getRandomBytes to return value in the form of hex

```javascript
    const { bytesToHex} = require("ethereum-cryptography/utils");
```

**Step-3**: Write and call  getCSPRN() async function for generating 32 -byte  hexadecimal random secret key using asynchronous version of   random submodule and  displaying it to console

```javascript
    async function getCSPRN()

    {

        console.log(bytesToHex(await getRandomBytes(32)));

    }

    getCSPRN()
```

**Step-4**: To test it you need to run the following command

```javascript
    node .\CSPRNG.js
```