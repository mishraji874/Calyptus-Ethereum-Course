# Smart Contract

In this lesson, we’ll create an ERC-721 smart contract for our NFT collection and link it to our images’ data on IPFS.

We’ll use the following code for our smart contract:

```solidity
// SPDX-License-Identifier: MIT

pragma solidity 0.8.7;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

import "@openzeppelin/contracts/access/Ownable.sol";

contract CalyptusNFT is ERC721, Ownable {

   using Strings for uint256;

   uint public constant MAX_SUPPLY = 10;

   uint public price = 0.01 ether;

   uint public tokenId = 1;

   string _baseUri;

   constructor() ERC721("CalyptusNFT", "CAL") {}

   event NftMinted(address indexed minter, uint indexed tokenId);

   function tokenURI(uint256 _tokenId) public view override returns (string memory) {

       require(_exists(_tokenId), "URI query for nonexistent token");

       string memory baseURI = _baseURI();

       return bytes(baseURI).length != 0 ? string(abi.encodePacked(baseURI, _tokenId.toString(),".json")) : '';

   }

   function _baseURI() internal view override returns (string memory) {

       return _baseUri;

   }

   function mint() public payable {

       require(msg.value >= price, "Ether sent is not sufficient.");

       require(tokenId <= MAX_SUPPLY, "Sold out!");

       _safeMint(msg.sender, tokenId);

       emit NftMinted(msg.sender, tokenId);

       tokenId++;

   }

   function setBaseURI(string memory newBaseURI) external onlyOwner {

       _baseUri = newBaseURI;

   }

   function setPrice(uint newPrice) external onlyOwner {

       price = newPrice;

   }

   function withdraw() external onlyOwner {

       require(payable(msg.sender).send(address(this).balance));

   }

}
```

First we import ERC721 and Ownable contracts from OpenZeppelin.

```solidity
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

import "@openzeppelin/contracts/access/Ownable.sol";
```

Then we write the following statement in the contract’s code:

```solidity
using Strings for uint256;
```

It means that we can use the Strings library for a uint256 variable i.e. we can convert a uint256 variable to string withe the following syntax :

```solidity
variable.toString();
```

If the value of the variable is 100, it will be converted to a string ‘100’. We’ll use this functionality in the tokenURI function later in this contract.

Then we declare a few variables : 

- `MAX_SUPPLY` is a constant with a value of 10 since we have a collection of 10 NFTs
- `price` variable holds the price of the NFT i.e. 0.01 ETH
- `tokenId` will start with 1 just as mentioned in our metadata on IPFS

`_baseUri` is a private variable that will contain a link with the CID of our metadata folder. The base URI for a contract will be `ipfs://CID/`. For example,

```
ipfs://QmWttJtwRDkJPTtX8Qn1eWjpDnZhsTeAKJYvv8fR6QuVEL/ 
```

But initially, our base URI will be empty and we’ll update it later once all the NFTs have been minted.

Then we have our constructor where we define the name and symbol for our NFT project.

NftMinted is an event that will be emitted every time someone mints an NFT. It will emit the address of the minter of the NFT and the tokenId minted by him/her.

Function `tokenURI` will return the tokenURI of our minted NFT. This tokenURI connects our metadata to our tokenID. The function takes tokenID as a parameter and returns the respective tokenURI.

For example, the `tokenURI` for `tokenID` 1 would be:

```
_baseUri + tokenId + “.json”

i.e.

“ipfs://QmWttJtwRDkJPTtX8Qn1eWjpDnZhsTeAKJYvv8fR6QuVEL/“ + 1 + “.json”

i.e.

ipfs://QmWttJtwRDkJPTtX8Qn1eWjpDnZhsTeAKJYvv8fR6QuVEL/1.json
```

Then we have the function `_baseURI` that returns the base URI of the contract.

`mint` is a payable function for minting an NFT. It checks if the `msg.value` sent is enough to cover the price of the NFT. It also checks if the NFTs have been sold out. And finally, it calls the `_safeMint` function from the open zeppelin’s ERC721 contract. And then it emits the NftMinted event and increments the tokenId.

`setBaseURI` function is used to update the new base URI of the contract. Usually the base URI is kept empty while deploying the smart contract, since we don’t want to reveal our NFTs before they are minted.

Once all the NFTs are minted, we update our base URI so that everyone can finally see what images they’ve got.

`setPrice` function is used to change the price of the NFTs.

Finally, we have the `withdraw` function that can only be called by the owner. This function will transfer all the ETH collected in the contract to the owner’s address.

Now, you can deploy this contract to the Sepolia testnet on Remix. If you try to mint an NFT by calling the `mint` function, your `tokenId` won’t be connected to any images since we haven’t updated the `base URI` yet.