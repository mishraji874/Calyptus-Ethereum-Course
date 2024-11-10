# BIP 32 & BIP 39

## BIP 32

Bitcoin Improvement Proposal 32 (BIP32) is a wallet standard that describes how to derive private and public keys of a wallet from a **binary master seed (m)** and an ordered set of indices. 

BIP32 was originally designed for Bitcoin, later it was extended to be used for other Blockchains like Ethereum. 

Wallets that are BIP32 compliant are called **Hierarchical Deterministic (HD) wallets**. 

BIP32 was mainly designed with a goal to create a tree of key pairs utilising  single seed only and deriving wallet structure based on these key pairs. BIP32 compliant HD wallets offer several advantages in terms of backup, security , portability etc.

BIP32 extended keys are represented in terms of derivation path, to better understand this let’s take a simple example.

- The master private key is **m**.
- The first normal child of the master private key is **m/0** (first normal child private key of master private key).
- The first hardened child of the master private key is **m/0′** (first hardened child private key of master private key).
- The first normal child of **m/0** is **m/0/0** (first normal grandchild private key of master private key) and so on.

The last character in the derivation path (**m/0/0** ) indicates which one is the child of the parent and the rest of the path is the parent. It is also important to note that the private key derivation path starts with lowercase m while the public key derivation path starts with uppercase **M**. 

Let’s now explore the hdkey submodule functions by creating empty Bip32.js file in any editor of your choice and then following steps below:

**Step-1:**   Import the hdkey submodule as HDKey from Ethereum-Cryptography library

```javascript
    const { HDKey } = require("ethereum-cryptography/hdkey");
```

**Step-2:**  Import other necessary submodules from ethereum-cryptography library 

```javascript
    const { bytesToHex,hexToBytes} = require("ethereum-cryptography/utils");
```

**Step-3:** Given Master seed: generating first and second normal grand-grandchild private keys of master private key and corresponding public keys as well and finally displaying them on console.

```javascript
seed = hexToBytes("aba95e0851419e1e67a4d9c47017ce85117115fe0c0dc266f6f000d44e1d7f8c0618df2e127f51538ef62d389c1ffa4ee0b02ba9d9efc376606b37095299a20d");

const hdkey1 = HDKey.fromMasterSeed(seed);

console.log(bytesToHex(hdkey1.derive("m/0/0/0").privateKey))

console.log(bytesToHex(hdkey1.derive("m/0/0/0").publicKey))

console.log(bytesToHex(hdkey1.derive("m/0/0/1").privateKey))

console.log(bytesToHex(hdkey1.derive("m/0/0/1").publicKey))
```

**Step-4:** Given Message hash and HD key perform signing verification and displaying verification result on console.

```javascript
const messageHash = "e25bb8f8f0d1598b5f25853f92813cbae8fcab2848c3135e244e796ccfc7edd8";

const sig = hdkey1.sign(hexToBytes(messageHash));

console.log(hdkey1.verify(hexToBytes(messageHash), sig));
```

**Step-5:** To test it you need to run the following command

```javascript
    node .\Bip32.js
```

## BIP39 Mnemonic Seed Phrase

Bitcoin Improvement Proposal 39 (BIP39) is a wallet standard that lays out how mnemonic seed phrases are to be generated for the creation of deterministic wallets. 

In essence BIP39 is a way to **represent a randomly generated  number (entropy) in the form of a sequence of words (Mnemonic seed phrase)**. 

BIP39 essentially has two parts: 

- Generating  mnemonic seed phrase and converting it to binary seed
- Generating deterministic wallets from binary seed according to the BIP32 standard

Mnemonic seed phrase is an easy to remember group of words (with length depending on size of entropy)  chosen from wordlist (each word can  be picked from wordlist without any ambiguity by just typing the initial 4 characters of the word)  of 2048 words. 

BIP39 also allows using an optional passphrase for providing additional security to wallets.

Let’s now explore the bip39 submodule functions by creating empty Bip39.js file in any editor of your choice and then following steps below:

**Step-1:** Import the required functions from Bib39 submodule of Ethereum-Cryptography library

```javascript
    const { generateMnemonic,mnemonicToSeedSync,mnemonicToEntropy } = require("ethereum-cryptography/bip39");
```

**Step-2:** Import wordlist from Bip39 submodules of ethereum-cryptography library 

```javascript
    const { wordlist } = require("ethereum-cryptography/bip39/wordlists/english");
```

**Step-3:** Import other necessary submodules from ethereum-cryptography library 

```javascript
    const { bytesToHex,hexToBytes} = require("ethereum-cryptography/utils");
```

**Step-4:** Using  Wordlist from step2  generate Mnemonic Seed Phrase and displaying it to console

```javascript
    console.log(generateMnemonic(wordlist));
```

**Step-5:** Using Step4 mnemonic phrase, generate Entropy and displaying it to console

```javascript
    console.log("Entropy",bytesToHex(mnemonicToEntropy(generateMnemonic(wordlist),wordlist)))
```

**Step-6:** Using Step4 mnemonic phrase, generate Master Seed and display it to console 

```javascript
    console.log("Master Seed",bytesToHex(mnemonicToSeedSync(generateMnemonic(wordlist))))
```

**Step-7:** To test it you need to run the following command

```javascript
    node .\Bip39.js
```