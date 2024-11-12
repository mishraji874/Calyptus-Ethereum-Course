# Intro to Oracles, Chainlink and Data Feeds

## Smart contract connectivity to off-chain data

We’ve explored in detail how smart contracts interact with and process on-chain data. As you know, we can command our smart contract to fetch data from the blockchain, process it and respond with a particular answer.

But we might also need our smart contract to process some real world data like the ETH/USD price for a DeFi app, the result of a football match for a betting game, the weather conditions in a particular area for an insurance settlement etc.

The sources of such data are off-chain and therefore even if somebody uploads this data on-chain, there’s no way we can trust that person to upload the correct data.

Similarly, if we connect our contract to an off-chain oracle, we’ll have to trust that source to provide the correct data and not have downtime issues as well as all the other issues that come along with a centralised system.

## Chainlink : Decentralised oracle network

The solution to this problem is Chainlink.

Chainlink connects smart contracts with external data using its decentralised oracle network. It consists of multiple nodes that collect particular data from different sources which are then aggregated to a Data Feed. 

For example, multiple nodes in the Chainlink system collect ETH/USD data from different sources and it’s then aggregated at the ETH/USD data feed which has its own blockchain address. We can use the address of the Chainlink ETH/USD data feed in our smart contract to get an ETH/USD price that comes from a decentralised source.

Said another way, smart contracts can access particular data from a Chainlink’s data feed. Each of these data feeds uses data aggregated from many independent Chainlink nodes. Chainlink’s data feeds have on-chain addresses and functions that can be used by a smart contract to access the data.

## Data feed demo

Let’s write a smart contract that consumes data from a price data feed.

The following smart contract gets the latest ETH/USD price from Chainlink data feed on the Sepolia network.

```javascript
// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;


import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";


contract PriceConsumerV3 {


   AggregatorV3Interface internal priceFeed;


   /**
    * Network: Sepolia
    * Aggregator: ETH/USD
    * Address: 0x1a81afB8146aeFfCFc5E50e8479e826E7D55b910


    */
   constructor() {
       priceFeed = AggregatorV3Interface(0x1a81afB8146aeFfCFc5E50e8479e826E7D55b910);
   }


   /**
    * Returns the latest price
    */
   function getLatestPrice() public view returns (int) {
       (
           /*uint80 roundID*/,
           int price,
           /*uint startedAt*/,
           /*uint timeStamp*/,
           /*uint80 answeredInRound*/
       ) = priceFeed.latestRoundData();
       return price;
   }
}
```

The import statement imports the AggregatorV3Interface that defines that all v3 Aggregators should have the latestRoundData function (as we’ll see in our contract later in this lesson).

The constructor initialises an interface object named priceFeed that uses AggregatorV3Interface and connects specifically to a proxy aggregator contract that is already deployed at 0x1a81afB8146aeFfCFc5E50e8479e826E7D55b910 on the Sepolia network. Please note that this address will be different for other test networks and mainnet.

The getLatestPrice function calls the priceFeed object and runs the latestRoundData function. The response from the aggregator includes several variables, but getLatestPrice returns only the price variable.
Now, let’s deploy the contract on the Sepolia network using Remix. Remember to select Sepolia network on your metamask, and Injected Provider as Environment in the deployment section before deploying the contract. On deployment, you can see a button for the getLatestPrice function.

As you can see, it shows the ETH/USD price as 165600649950 (at the time of writing this tutorial) which may look absurd. But please note that it doesn’t show the decimal points which are 8 digits for this data on the ETH/USD data feed. Hence, the actual value of the price is 1656.01 USD per ETH.

We can use similar interfaces for any kind of data provided by Chainlink’s network of decentralised oracles. 