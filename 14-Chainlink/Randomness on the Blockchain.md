# Randomness on the Blockchain

Randomness is an important aspect of many blockchain applications, such as gaming, lottery, and auction systems. These applications often require the generation of random numbers or events in a fair and secure manner. While random numbers are highly beneficial in various blockchain applications, they cannot be generated natively within smart contracts.

As consensus is an essential aspect of blockchain technology, a majority of miners must agree on the same outcome when evaluating a transaction. Thus, achieving randomness becomes challenging in a public blockchain system. Additionally, the public nature of a blockchain makes it difficult to find a secure source of entropy since the internal state of a contract and the entire history of a blockchain are visible to the public.

In Ethereum, block timestamps were one of the initial sources of randomness considered. However, miners can influence block timestamps as long as they are not older than their parent block. While most block timestamps are likely to be correct, a miner may use their mining power to benefit from incorrect timestamps and manipulate the outcome of the random function to their advantage.

## Chainlink VRF

Chainlink VRF, or Verifiable Random Function, is a solution for generating random numbers and events on the blockchain. Chainlink VRF uses cryptographic techniques to generate random numbers that are tamper-proof and tamper-evident, ensuring the fairness and security of the process.

## Request and Receive Cycle

In the previous example on data feeds, we explained how to use Chainlink Data Feeds that contain reference data uploaded on the blockchain by oracles. This data is saved in a contract and can be accessed by consumers until the oracle updates it.

On the contrary, randomness cannot be considered as reference data. If the output of a randomness generator is saved on the blockchain, any individual could access the value and predict the outcome. Therefore, requesting randomness from an oracle is necessary. The oracle generates a number and creates a cryptographic proof, which is then returned to the contract that initiated the request. This process is known as the Request and Receive cycle.

## Subscription Manager

Requests for VRF are funded using subscription accounts. To manage the funding of all your application requests in a single location, you can create an account and pre-pay for VRF requests using the Subscription Manager. We’ll see how to set it up in the following demo.

## VRF Demo

Now, let’s create and deploy a smart contract to generate random numbers:

```javascript
// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;


import "@chainlink/contracts/src/v0.8/interfaces/VRFCoordinatorV2Interface.sol";
import "@chainlink/contracts/src/v0.8/VRFConsumerBaseV2.sol";
import "@chainlink/contracts/src/v0.8/ConfirmedOwner.sol";


contract VRFv2Consumer is VRFConsumerBaseV2, ConfirmedOwner {
   event RequestSent(uint256 requestId, uint32 numWords);
   event RequestFulfilled(uint256 requestId, uint256[] randomWords);


   struct RequestStatus {
       bool fulfilled; // whether the request has been successfully fulfilled
       bool exists; // whether a requestId exists
       uint256[] randomWords;
   }
   mapping(uint256 => RequestStatus)
       public s_requests; /* requestId --> requestStatus */
   VRFCoordinatorV2Interface COORDINATOR;


   // Your subscription ID.
   uint64 s_subscriptionId;


   // past requests Id.
   uint256[] public requestIds;
   uint256 public lastRequestId;


   // The gas lane to use, which specifies the maximum gas price to bump to.
   bytes32 keyHash =
       0x79d3d8832d904592c0bf9818b621522c988bb8b0c05cdc3b15aea1b6e8db0c15;


   // Depends on the number of requested values that you want sent to the
   // fulfillRandomWords() function.
   uint32 callbackGasLimit = 100000;


   // The default is 3, but you can set this higher.
   uint16 requestConfirmations = 3;


   // For this example, retrieve 2 random values in one request.
   // Cannot exceed VRFCoordinatorV2.MAX_NUM_WORDS.
   uint32 numWords = 2;


   /**
    * HARDCODED FOR Sepolia
    * COORDINATOR: 0x8103B0A8A00be2DDC778e6e7eaa21791Cd364625
    */
   constructor(
       uint64 subscriptionId
   )
       VRFConsumerBaseV2(0x8103B0A8A00be2DDC778e6e7eaa21791Cd364625)
       ConfirmedOwner(msg.sender)
   {
       COORDINATOR = VRFCoordinatorV2Interface(
           0x8103B0A8A00be2DDC778e6e7eaa21791Cd364625
       );
       s_subscriptionId = subscriptionId;
   }


   // Assumes the subscription is funded sufficiently.
   function requestRandomWords()
       external
       onlyOwner
       returns (uint256 requestId)
   {
       // Will revert if subscription is not set and funded.
       requestId = COORDINATOR.requestRandomWords(
           keyHash,
           s_subscriptionId,
           requestConfirmations,
           callbackGasLimit,
           numWords
       );
       s_requests[requestId] = RequestStatus({
           randomWords: new uint256[](0),
           exists: true,
           fulfilled: false
       });
       requestIds.push(requestId);
       lastRequestId = requestId;
       emit RequestSent(requestId, numWords);
       return requestId;
   }


   function fulfillRandomWords(
       uint256 _requestId,
       uint256[] memory _randomWords
   ) internal override {
       require(s_requests[_requestId].exists, "request not found");
       s_requests[_requestId].fulfilled = true;
       s_requests[_requestId].randomWords = _randomWords;
       emit RequestFulfilled(_requestId, _randomWords);
   }


   function getRequestStatus(
       uint256 _requestId
   ) external view returns (bool fulfilled, uint256[] memory randomWords) {
       require(s_requests[_requestId].exists, "request not found");
       RequestStatus memory request = s_requests[_requestId];
       return (request.fulfilled, request.randomWords);
   }
}
```

This smart contract is an example of a consumer contract that relies on a subscription for funding. It uses the Chainlink VRF (Verifiable Random Function) to generate random numbers. The contract is imported with the VRFCoordinatorV2Interface.sol and VRFConsumerBaseV2.sol interfaces. It also imports ConfirmedOwner.sol, which allows the owner to verify any changes made to the contract.

The contract contains a struct called RequestStatus that keeps track of the status of the request. It has three attributes, fulfilled, exists, and randomWords. The fulfilled attribute indicates whether the request has been successfully fulfilled, and the exists attribute indicates whether the requestId exists. The randomWords attribute stores the random words generated by the VRF.

The contract has a mapping called s_requests that maps a requestId to a RequestStatus. It also has a COORDINATOR variable that is of type VRFCoordinatorV2Interface, which is set in the constructor. The contract has a subscriptionId, which is set in the constructor and is used to identify the subscription that will fund the VRF.

The contract has a function called requestRandomWords() that can only be called by the owner. This function requests a set of random numbers from the VRF. It then sets the requestId in the s_requests mapping to a new RequestStatus struct. The requestIds array stores the requestId, and the lastRequestId variable stores the last requestId generated. An event is emitted indicating that the request has been sent.

The function fulfillRandomWords() is called by the Chainlink node when the request has been fulfilled. The function updates the RequestStatus struct for the corresponding requestId and emits an event indicating that the request has been fulfilled.

The function getRequestStatus() can be called by anyone to check the status of a request. It returns a tuple of two values, fulfilled and randomWords, indicating whether the request has been fulfilled and the set of random words generated.

The contract includes various variables that can be adjusted, such as the gas limit for the callback function, the number of words to be requested, and the number of request confirmations required.

To deploy the VRFv2Consumer contract using Remix, follow these steps:

- Go to the Deploy tab in Remix and select the Injected Provider environment.
- From the contract list, choose the VRFv2Consumer contract.
- Specify your subscriptionId in the constructor so it can be set.
- Click the Deploy button to deploy the contract on-chain.
- Confirm the transaction in MetaMask when prompted.
- After deployment, copy the contract address from the Deployed Contracts list in Remix.
- Go to the Subscription Manager page where we had our subscription ID and enter the address of your consuming contract and click Add consumer.
- Confirm the transaction in MetaMask when prompted.
- Once the transaction is complete, click on the View subscription button. You can see the details of your subscription.

Now that the deployed contract is a consumer of the subscription, we can request random numbers from the VRF. 

- To start the request, run the requestRandomWords() function on your contract and confirm the transaction in MetaMask
- Chainlink VRF processes your request, fulfills it and returns the random values to your contract in a callback to the fulfillRandomWords() function
- A new key requestId is added to the mapping s_requests and depending on testnet conditions, it might take a few minutes for the callback to return the requested random values to your contract
- To fetch the request ID of your request, call lastRequestId()
- After the oracle returns the random values to your contract, the mapping s_requests is updated with the received random values stored in s_requests[_requestId].randomWords
- Call getRequestStatus() specifying the requestId to display the random words.

Congratulations! You just deployed a simple contract that can request and receive random values from Chainlink VRF. 

Now let’s create a more complex smart contract in the Game of Thrones theme.

The following contract requests randomness from Chainlink VRF, transforms the result of the randomness into a number between 1 and 20, mimicking the rolling of a 20 sided die. Each number represents a Game of Thrones house. If the dice lands on the value 1, the user is assigned house Targaryan, 2 for Lannister, and so on.

```javascript
// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;


import "@chainlink/contracts/src/v0.8/interfaces/VRFCoordinatorV2Interface.sol";
import "@chainlink/contracts/src/v0.8/VRFConsumerBaseV2.sol";


/**
* @notice A Chainlink VRF consumer which uses randomness to mimic the rolling
* of a 20 sided dice
*/


contract VRFD20 is VRFConsumerBaseV2 {
   uint256 private constant ROLL_IN_PROGRESS = 42;


   VRFCoordinatorV2Interface COORDINATOR;


   // Your subscription ID.
   uint64 s_subscriptionId;


   // Sepolia coordinator. 
   address vrfCoordinator = 0x8103B0A8A00be2DDC778e6e7eaa21791Cd364625;


   // The gas lane to use, which specifies the maximum gas price to bump to.
   bytes32 s_keyHash =
       0x79d3d8832d904592c0bf9818b621522c988bb8b0c05cdc3b15aea1b6e8db0c15;


   // Depends on the number of requested values that you want sent to the
   // fulfillRandomWords() function. 
   uint32 callbackGasLimit = 40000;


   // The default is 3, but you can set this higher.
   uint16 requestConfirmations = 3;


   // For this example, retrieve 1 random value in one request.
   // Cannot exceed VRFCoordinatorV2.MAX_NUM_WORDS.
   uint32 numWords = 1;
   address s_owner;


   // map rollers to requestIds
   mapping(uint256 => address) private s_rollers;
   // map vrf results to rollers
   mapping(address => uint256) private s_results;


   event DiceRolled(uint256 indexed requestId, address indexed roller);
   event DiceLanded(uint256 indexed requestId, uint256 indexed result);


   /**
    * @notice Constructor inherits VRFConsumerBaseV2
    *
    * @dev NETWORK: Sepolia
    *
    * @param subscriptionId subscription id that this consumer contract can use
    */
   constructor(uint64 subscriptionId) VRFConsumerBaseV2(vrfCoordinator) {
       COORDINATOR = VRFCoordinatorV2Interface(vrfCoordinator);
       s_owner = msg.sender;
       s_subscriptionId = subscriptionId;
   }


   /**
    * @notice Requests randomness
    * @dev Warning: if the VRF response is delayed, avoid calling requestRandomness repeatedly
    * as that would give miners/VRF operators latitude about which VRF response arrives first.
    * @dev You must review your implementation details with extreme care.
    *
    * @param roller address of the roller
    */
   function rollDice(
       address roller
   ) public onlyOwner returns (uint256 requestId) {
       require(s_results[roller] == 0, "Already rolled");
       // Will revert if subscription is not set and funded.
       requestId = COORDINATOR.requestRandomWords(
           s_keyHash,
           s_subscriptionId,
           requestConfirmations,
           callbackGasLimit,
           numWords
       );


       s_rollers[requestId] = roller;
       s_results[roller] = ROLL_IN_PROGRESS;
       emit DiceRolled(requestId, roller);
   }


   /**
    * @notice Callback function used by VRF Coordinator to return the random number to this contract.
    *
    * @dev Some action on the contract state should be taken here, like storing the result.
    * @dev WARNING: take care to avoid having multiple VRF requests in flight if their order of arrival would result
    * in contract states with different outcomes. Otherwise miners or the VRF operator would could take advantage
    * by controlling the order.
    * @dev The VRF Coordinator will only send this function verified responses, and the parent VRFConsumerBaseV2
    * contract ensures that this method only receives randomness from the designated VRFCoordinator.
    *
    * @param requestId uint256
    * @param randomWords  uint256[] The random result returned by the oracle.
    */
   function fulfillRandomWords(
       uint256 requestId,
       uint256[] memory randomWords
   ) internal override {
       uint256 d20Value = (randomWords[0] % 20) + 1;
       s_results[s_rollers[requestId]] = d20Value;
       emit DiceLanded(requestId, d20Value);
   }


   /**
    * @notice Get the house assigned to the player once the address has rolled
    * @param player address
    * @return house as a string
    */
   function house(address player) public view returns (string memory) {
       require(s_results[player] != 0, "Dice not rolled");
       require(s_results[player] != ROLL_IN_PROGRESS, "Roll in progress");
       return getHouseName(s_results[player]);
   }


   /**
    * @notice Get the house name from the id
    * @param id uint256
    * @return house name string
    */
   function getHouseName(uint256 id) private pure returns (string memory) {
       string[20] memory houseNames = [
           "Targaryen",
           "Lannister",
           "Stark",
           "Tyrell",
           "Baratheon",
           "Martell",
           "Tully",
           "Bolton",
           "Greyjoy",
           "Arryn",
           "Frey",
           "Mormont",
           "Tarley",
           "Dayne",
           "Umber",
           "Valeryon",
           "Manderly",
           "Clegane",
           "Glover",
           "Karstark"
       ];
       return houseNames[id - 1];
   }


   modifier onlyOwner() {
       require(msg.sender == s_owner);
       _;
   }
}
```

The contract has the following functions:

- rollDice: This submits a randomness request to Chainlink VRF
- fulfillRandomWords: The function that the Oracle uses to send the result back
- house: To see the assigned house of an address

