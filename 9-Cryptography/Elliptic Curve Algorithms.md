# Elliptic Curve Algorithms

Elliptic Curve Cryptography (ECC) is a modern type of public key cryptography based on the algebraic structures of elliptic curves over finite fields and derives its security from the difficulty of Elliptic Curve Discrete Log Problem (ECDLP). 

In fact, public key  cryptography used in Bitcoin and Ethereum is ECC exploiting the field and curve parameters defined by secp256k1. The advantage of using ECC is that it reduces key size and enhances the speed.

Secpk256k1 submodule of Ethereum-Cryptography library exposes the set of functions listed below for performing operations like generating and recovering  public keys, signing, and  verifying signatures etc.

```javascript
    function getPublicKey(privateKey: Uint8Array, isCompressed?: false): Uint8Array;
    function sign(msgHash: Uint8Array, privateKey: Uint8Array, opts?: Options): Promise<Uint8Array>;
    function verify(signature: Uint8Array, msgHash: Uint8Array, publicKey: Uint8Array): boolean
    function recoverPublicKey(msgHash: Uint8Array, signature: Uint8Array, recovery: number): Uint8Array | undefined;
```

Let’s now explore the secp256k1 submodule functions by creating empty Secp256k1.js file in any editor of your choice and then following steps below:

**Step-1:**   Import the  secp256k1  submodule from Ethereum-Cryptography library

```javascript
    const secp256k1 = require("ethereum-cryptography/secp256k1");
```

**Step-2:** Write async function and call appropriate functions from secp256k1 module to generate public key from given private key and perform signing and verification on given message hash

```javascript
(async () => {

    // You pass either a hex string, or Uint8Array

    const privateKey = "f310db9d294b47aa6f395b55b585343b519ac77878d32b63f020239f0321f0bb";

    const messageHash = "e25bb8f8f0d1598b5f25853f92813cbae8fcab2848c3135e244e796ccfc7edd8";

    const publicKey = secp256k1.getPublicKey(privateKey);

    const signature = await secp256k1.sign(messageHash, privateKey);

    const verified = secp256k1.verify(signature, messageHash, publicKey);

    console.log("Verified", verified);

})();
```

**Step-3:** To test it you need to run the following command

```javascript
    node .\Secp256k1.js
```