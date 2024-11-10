# Introducing Cryptography

Cryptography is the mathematical art of secret writing. Generally, Cryptography is applied  to realise  three broad security goals namely **confidentiality** (sensitive data must be secret from the unintended users), **integrity** (data must be secured from unauthorised modifications) and **availability** (information must be always available to intended users).

In Cryptography, confidentiality is achieved by applying a technique called **Encryption**. 

Integrity is achieved by employing special one-way functions called **Cryptographic Hash Functions** and authentication (process for verifying identity of the sender) is achieved by applying a technique called **Digital Signatures**. 

Availability is mostly achieved by using **redundancy** and replication of the same information or data at multiple places. 

All in all, Cryptography allows users to communicate securely over insecure communication channels (wired/wireless).

Cryptography is the backbone technology behind Blockchains (Bitcoin, Ethereum, Solana etc). For a clear understanding about the inner workings of Blockchains, it is essential to understand cryptographic concepts on which Blockchains are built. In relation to Blockchain platforms like Bitcoin and Ethereum, generally cryptographic mechanisms are applied to achieve the following functionalities:

- As part of wallet address generation

- For performing transactions over the Blockchain network

- As part of a consensus mechanism

## Cryptography On The Mind

Ever wondered why Blockchains are considered tamper-resistant? It is because of the magical properties of Cryptographic Hash functions (eg. SHA-256). We will be exploring different Cryptographic Hash functions like **SHA256**, **Keccak-256** , **RIPEMD160** and **BLAKE2b** in the first section of this module. 

Have you ever thought about why it is so hard to use brute force or guess a private key used to sign Blockchain transactions? It is because of the randomness used in their generation  and the security strength of the cryptographic schemes which employ them for achieving specific security goals. In section 2 and 3  we will explore some of the well known key derivation functions like **PBKDF2**, Scrypt and a cryptographically strong pseudo random number generator for generating secure secret keys.  

Ever imagined what makes it possible to sign and verify transactions/messages on Blockchains like Bitcoin and Ethereum? Well, it’s because of the unique properties of digital signature algorithms. In section 4 we will be exploring the Ethereum-Cryptography library’s **secp256k1** submodule to sign and verify an arbitrary message to understand the process.  

Have you ever wondered what’s happening behind the scenes of your mnemonic phrase on Metamask? Metamask (the most widely used ethereum wallet, as you know) is able to generate new account addresses on the fly, keep track of all our account balances and allows us to export the wallet with all the account addresses to different machines by just using one mnemonic seed phrase. How is this possible? Well it’s all because of **BIP32**, **BIP39**  and other related standards. In section 5 and 6 we will be exploring BIP32 and BIP39 in detail. 

Finally in the last section of this module we will explore **AES**, the most widely used symmetric-key cryptographic algorithm for achieving confidentiality. 

## Js-Ethereum-Cryptography library

To successfully interact or develop applications and tools for Blockchains, we are often required to implement desired cryptographic schemes. 

Js-Ethereum-Cryptography is one such attempt towards providing secure and easy to use implementation of almost all cryptographic primitives for the Ethereum Blockchain. 

In essence it is a JavaScript/Typescript based cryptographic library that supports most of the crypto algorithms required to work on Ethereum’s Blockchain. 

The cryptographic schemes supported/implemented by Ethereum-Cryptography library are listed below:

- Hashes: SHA256, keccak-256, RIPEMD160, BLAKE2b
- KDFs: PBKDF2, Scrypt
- CSPRNG (Cryptographically strong pseudorandom number generator)
- Secp256k1 curve
- BIP32 HD Keygen
- BIP39 Mnemonic phrases
- AES Encryption

First things first, before we test the functionalities of this library, we need to install it. Since the library comes in the form of a node module, we need to have node.js installed, npm comes bundled with it and then we can use any one of the commands listed below for installing the library:

```bash
    npm install ethereum-cryptography

    Or

    yarn add ethereum-cryptography
```

In the following lessons we will be briefly describing and demonstrating the use of the library for each of these cryptographic primitives. 

The best part about the Ethereum-Cryptography library is that there is no single entry-point, but a submodule for each cryptographic primitive, making it very easy to use.