
# ERC721 Renting Marketplace

## Description

This repo contains the contracts to build an ERC721 renting marketplace on ethereum, wich underlying currency can either be ethereum itself (with _eth_) or an IERC20 implementation ([Openzeppelin's implementation](https://github.com/OpenZeppelin/openzeppelin-contracts/tree/master/contracts/token/ERC20) or your custom implementation). Can be imported as a npm package (procedure described below), this wway it provides alla the contracts, ABI for them and typechain generated code for static typing in typescript to build a dApp on top of it with [ethers.js](https://github.com/ethers-io/ethers.js/)

### Architecture

The main component is the Marketplace, written in `contracts/RentingMarketplace.sol`. It is responsible for registering trades and holding information about them. It instanciates a `NFTLabStoreMarketplaceVariant`, a contract identical to `NFTLabStore` (a `ERC721URIStorage` and `ERC721Enumerable` contract) that also implements a function to force the transfer of nfts to the marketplace if the param `form` is allowed for that token. this way users can avoid a call to the blockchain allowing the market for the token. the `NFTLabStore` as already mentioned is responsible for holding NFTs, record movements of ownership and minting them, it holds the NFTs as the name suggests. the Marketplace is then specialized into two contracts: `ETHMarketplace` and `ERC20Marketplace`, the difference between the two is the way they handle paymens: `ETHMarketplace` uses ether, while `ERC20Marketplace` can use every `IERC20` contract. The diagram of the architecture is the following


![marketplace full](https://user-images.githubusercontent.com/65864145/147574529-c1f1d385-10e0-429c-8cb8-97f77b52e6dd.png)


### Mock Interfaces

#### Open Rent - Adding the NFT to the Marketplace
This interface is where the Owner of the NFT will set the price per block he will charge and will see what item number his token will have. After calling the openRent function in `RentingMarketplace.sol` the msg.sender will send his token to the contract, the `rentCounter` will be incremented and a new entry will be added to the mapping `rents` and at the same time the `msg.sender` to `addressToRents` mapping and the newly added _item will be added to the `nftToActiveRent` mapping as well.
![openrent](https://user-images.githubusercontent.com/65864145/147577224-60cd2b48-6a53-445d-9a1f-0d808095b8b9.png)

#### RentingMarketplace - Interface displaying the `rents` mapping
This interface is where the user looking to rent an NFT will see ALL the NFTs listed in the `NFTLabStore` , using the getRent function inside the `RentingMarketPlace.sol` contract to individually pull the relevant information from each NFT and display it. 
![Renting MArketplace interface](https://user-images.githubusercontent.com/65864145/147577448-d29a1b77-7676-4939-ad59-c0da07f5a834.png)

#### Execute Rent - Interface where the Renter will confirm his rental 
This interface will allow the user to input the time parameter in days and see at a glance how much they will pay it for that i.e. if I want to rent it 30 days it will cost them 0.03 ETH (or any other ERC20 token)
![executeRent](https://user-images.githubusercontent.com/65864145/147577892-d3173415-670c-4887-b772-9a3ee0122ac2.png)

#### Pull Rent - Interface where the Renter will confirm his rental 
This 
