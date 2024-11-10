# AES Encryption

The Advanced Encryption Standard (AES) algorithm is a symmetric-key (single key) block cipher developed by NIST in 2000-2001. 

**AES takes blocks of 128 bits as input and produces 128 bits blocks of ciphertext using keys of length 128 or 192 or 256 bits. **

AES uses substitution and permutation with multiple rounds to convert plain text into cipher text. For key lengths 128, 192 and 256 bits, AES has 10, 12 and 14 rounds respectively. 

AES is a widely used Encryption algorithm and is recommended because of its security strength compared to DES and 3DES.

Let’s now explore the aes submodule encrypt and decrypt functions by creating an empty AES.js file in any editor of your choice and then following steps below:

**Step-1:**   Import the required functions from aes submodule of Ethereum-Cryptography library

```javascript
    const { encrypt ,decrypt} = require("ethereum-cryptography/aes");
```

**Step-2:**  Import other necessary submodules from ethereum-cryptography library 

```javascript
    const { hexToBytes,bytesToHex,utf8ToBytes, bytesToUtf8} =require("ethereum-cryptography/utils");
```

**Step-3:** Write AESEnc() function to perform encryption on plaintext message “Calyptus” with given key and initial vector

```javascript
async function AESEnc() {

    console.log("Result after AES Encryption",

        bytesToHex(await encrypt(

            utf8ToBytes("Calyptus"),

            hexToBytes("2b7e151628aed2a6abf7158809cf4f3c"),

            hexToBytes("f0f1f2f3f4f5f6f7f8f9fafbfcfdfeff")

        )

        ));

}
```

**Step-4:** Write  AESDec() function to perform decryption on ciphertext produce in step-3 and same key and initial vector used in step3 and finally call these functions to compare the see the result

```javascript
async function AESDec() {

    console.log("Result after AES  Decryption",

        bytesToUtf8(await decrypt(

            await encrypt(

                utf8ToBytes("Calyptus"),

                hexToBytes("2b7e151628aed2a6abf7158809cf4f3c"),

                hexToBytes("f0f1f2f3f4f5f6f7f8f9fafbfcfdfeff")

            )

            ,

            hexToBytes("2b7e151628aed2a6abf7158809cf4f3c"),

            hexToBytes("f0f1f2f3f4f5f6f7f8f9fafbfcfdfeff")

        )

        ));

}

AESEnc()

AESDec()
```

**Step-5:** To test it you need to run the following command

```javascript
    node .\AES.js
```

| Name of Hash Function	| Size of Output in Bits   | Usage in Blockchain
|:---------------------:|:------------------------:|:----------------------------------------------------------------------------------------------------------------:|
| SHA256	            | 256	                   | Bitcoin (address generation, PoW consensus  and Transaction signing and Verifying )
| Keccak256	            |  256	                   | Ethereum (address generation, Ethash consensus engine)
| RIPEMD160	            |  160	                   | Bitcoin address generation
| Blake2b	            |  1-64 bytes	           | Polkadot

