# Introduction to NFT

NFTs are one of the earliest use-cases of blockchain. You must have already heard of a few popular NFT collections like Bored Apes, Crypto kitties etc. What exactly are these NFTs and what gives them value? Let’s try to understand it in this lesson.

## Definition of NFT

An NFT is a record on the blockchain that certifies that a particular digital asset is unique and also certifies who owns that particular asset.

Before we deep dive into NFTs, let’s first try to understand the complexities of using digital assets.

## Limitations of digital assets

Ownership of digital assets is complex since a digital asset can easily be duplicated any number of times. For example, a digital photograph signed by your favourite celebrity holds no value since anyone can right click and save it on their own computer as well, and then post it on their instagram account. 

Similarly, an apparel store can’t issue a digital discount coupon since it can be duplicated by multiple people. Although the apparel store can use their own website to issue discount coupons against your email ID, that’s a centralised approach and the coupons are limited to the store’s website and can’t be openly traded. Basically, you couldn’t experience the benefits of decentralisation with digital assets in the pre-blockchain era.

With the advent of blockchain, it became possible to establish ownership and authenticity of digital assets. Now, if your favourite celebrity publishes his/her signed photograph, or a great artist publishes a digital artwork, you can buy it on blockchain and prove your ownership.

But why would someone want to buy a digital asset? Even if we prove our ownership of the digital asset on the blockchain, it can still be copied by other people by right clicking and saving it. Then what’s the point of owning a digital asset by paying for it?

## Use-cases of owning a digital asset

The benefits come in many levels, depending on the use-case. At the very basic level, it’s just about bragging rights of owning a famous digital art. There are many popular digital artists like Beeple, PAK etc. and owning their digital art is a flex for the fans. Similarly, owning your favourite sporting moments (for example, NBA top-shots) is something worth bragging for. Others might have saved a copy of it, but only you own the authentic piece that can be verified on the blockchain.

But it’s not just all about flex and bragging. There can be utilities attached to the digital asset. For example, a celebrity can release a digital image, and whoever owns that image, gets to have lunch with the celebrity once a quarter. Or a music band can release a digital video and whoever owns that video on the blockchain, gets the front-row seat access for the band’s concerts around the world. Or an apparel store can issue digital coupons on blockchain, the owner of that coupon gets an extra discount on shopping from the store.

A digital asset can also represent physical things. For example, a digital contract that certifies the owner of owning an actual house.

The most common use-case of NFTs is digital collections such as Bored Ape Yacht Club, Crypto Kitties, Cryptopunks etc. These collections are like the base-ball cards collection and the community of card holders attach a value to it. Holding such cards/NFTs from a collection might give the holders access to events, online portals, or other utilities.

The use-cases are endless. The benefit of tracking the ownership on blockchain is that it becomes decentralised and can be traded openly without being limited to the issuer’s website.

## What is an NFT and how it works?

Now what exactly is an NFT? Is it another name for digital art? The monkey image you see in the Bored Apes collection, is it called an NFT?

In day-to-day language, we usually call the image itself as an NFT and ultimately this is the thing that we bought it for. But technically, an NFT is a serial ID on the blockchain i.e. 1, 2, 3 etc. Against this serial ID, there’s a wallet address, and this mapping of address against the serial ID proves that a particular serial ID is owned by a particular address.

Eg: 

1 — 0x54D2C951462A0B394b5FC620049C71BCE4976e59

2 — 0x0D6089D678138745529De37753DbF672521198c9

3 — 0x00fA8cf4150e95C587A60cF87aDF02711116dd97

And so on…

As per the above mapping, the address 0x54D2C951462A0B394b5FC620049C71BCE4976e59 owns the serial ID 1 (i.e. the NFT 1). This is on the blockchain and the ownership can be proved to anyone.

But what about the images/ digital assets we talked about earlier? Where are they stored? 

Images, videos etc. are not stored on the blockchain itself because it’s heavy data to be stored on the blockchain and might be very expensive if we do so. Instead, these digital assets can be stored on a server, or IPFS (if we want to keep it decentralised and immutable). We’ll discuss more about IPFS in the next lesson.

Once stored on IPFS, its link can be mapped to the serial ID in another mapping.

Eg:

1 — IPFS link 1

2 — IPFS link 2

3 — IPFS link 3

Thus, with the help of these two mappings, ownership of digital assets is established. For example, address 0x54D2C951462A0B394b5FC620049C71BCE4976e59 owns the serial ID 1 (or NFT 1) which points to the digital asset stored on IPFS link 1. Thus, a particular address is able to prove the ownership of a digital asset though an NFT, and thus reap the benefit of all the utilities attached to it.

## What does non-fungible mean?

**NFT stands for Non-Fungible Token**. The ERC-20 tokens that we created earlier are fungible tokens. That’s because the same ERC-20 tokens are interchangeable and can be exchanged with each other, as each token has the same value. Similarly, native tokens of blockchains such as bitcoin, ether, matic etc. are also fungible tokens. 

NFTs on the other hand are created using ERC-721 standard. As we saw in the above example, each NFT with ID 1, 2, 3 etc. points to a different IPFS link. Hence, these tokens are non fungible i.e. they can’t be exchanged with each other.