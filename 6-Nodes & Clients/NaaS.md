# Nodes as a Service (NaaS)

## Working of a Node Service

The node service provider runs the distributed node client in the background without you needing to run it.

These services typically provide an API key that can be used to write to and read from the blockchain. This often includes access to the Ethereum testnet in addition to the mainnet.

Some services provide their own dedicated nodes to manage, while others use load balancers to distribute activity across nodes.

Almost all Node services integrate very easily. Replacing a self-hosted node or switching the service itself simply requires changing a line in your code.

In many cases, the node service runs a variety of node clients and types, allowing access to the complete archive node in addition to the client-specific methods of the API.

Note that node services should not store private keys or information.

### Advantages of using a node service

- No need to spend time setting up and managing your own node
- Focus on product development without worrying about infrastructure maintenance
- Save high expenses on disk space to bandwidth
- No need to worry about spinning up more nodes when scaling, updating nodes to the latest version, ensuring state consistency, etc.

### Disadvantages of using a node service

The main disadvantage of using a node service is that you centralise the infrastructure aspects of your product. For this reason, projects that care most about decentralisation may prefer self-hosted nodes as opposed to outsourcing to a third party.

### Widely used Node Services

- Infura
- Alchemy
- GetBlock
- BlockDaemon
- Chainstack
- QuickNode

And many more..