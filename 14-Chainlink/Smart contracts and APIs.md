# Smart contracts and APIs

An API, or Application Programming Interface, is a software tool that enables two different applications to communicate with each other. For instance, apps like news and weather apps are built on APIs to fetch data from different sources.

Smart contracts have a limitation in that they cannot directly interact with external APIs. This is where oracles come in.

## Chainlink API Calls

Chainlink Any-API is a solution that allows smart contracts to interact with any external API. With Chainlink Any-API, developers can easily access data from various sources and bring it into the blockchain ecosystem. 

In the previous lesson, we learnt how request and receive cycle works on Chainlink. When using smart contracts that require data from external sources, such as VRF random, the contract sends a request to the oracle node and waits for a response. In the case of VRFConsumerBaseV2 contract from the previous lesson, the fulfillment function is already defined, so oracles know where to send the response to. However, for API calls, the contract must specify which function to receive the response.

Before proceeding, it is important to understand what Jobs are.

## Jobs

For Chainlink nodes to perform useful tasks, they require Jobs. Whenever we make a request through the Chainlink oracle, we are essentially requesting it through a Chainlink Job. Jobs are responsible for defining the specifics of what, when, how, and why Chainlink nodes need to perform certain tasks.

## Tasks

Every oracle job has a pre-configured set of tasks that it must accomplish when it’s executed. These tasks can be divided into two subcategories:

- Built-in Tasks: These are the default tasks that are included with each node, such as http, ethabidecode, and others.
- External Adapters: These are custom adapters that are created by node operators and members of the community. They perform specific tasks like calling a particular endpoint with a specific set of parameters, including authentication secrets that should not be publicly visible.

To create a job that needs to retrieve a specific unsigned integer field from a JSON response obtained by making a GET request to an API and then submitting it back to the requesting contract, the job should contain the following tasks:

- HTTP: Calls the API using GET request method to get the JSON response.
- JSON Parse: Parses the JSON response and extracts the desired value at a specified keypath.
- Multiply: Multiplies the extracted value by a multiplier to remove the decimals.
- ETH ABI Encode: Converts the multiplied value into an integer and formats it into Solidity’s uint256 data type.
- ETH Tx: Submits the formatted data to the blockchain network, completing the transaction cycle.

There are also decode tasks included in a job so that off-chain oracle nodes can get the information from requests sent by consumer contract.

As an example, suppose you want to retrieve 24 hrs volumes of the ETH/USD pair from the cryptocompare API. The job would execute the following tasks:

- **HTTP:** Calls the API and gets the HTTP GET result for ETH/USD pair, which returns the following JSON response:

```javascript
{“RAW”:

  {“ETH”:

    {“USD”:

      {

        …,

        “VOLUMEDAYTO”:953806939.7194247,

        “VOLUME24HOUR”:703946.0675653099,

        “VOLUME24HOURTO”:1265826345.488568

        …,

      }

    }

  }

}
```

- **JSON Parse:** Parses the JSON response and extracts the “VOLUME24HOUR” field, which returns the value 703946.0675653099.
- **Multiply:** Multiplies the value by 10^18, resulting in 703946067565309900000000.
- **ETH ABI Encode:** Formats the value into an integer and converts it into Solidity’s uint256 data type, resulting in 0xc618a1e4.
- **ETH Tx:** Places the formatted data into the transaction’s data field, signs the transaction, and broadcasts it to the network. The result is a completed transaction.

