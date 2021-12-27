# NFT-Renting-Protocol-LimeAcademy
Final Project - 1st Cohort

ERC721 Renting Marketplace
Description
This repo contains the contracts to build an ERC721 renting marketplace on ethereum, which underlying currency can either be ethereum itself (with eth) or an IERC20 implementation (Openzeppelin's implementation or your custom implementation). Can be imported as a npm package (procedure described below), this wway it provides alla the contracts, ABI for them and typechain generated code for static typing in typescript to build a dApp on top of it with ethers.js

Architecture
The main component is the Marketplace, written in contracts/ERC721Marketplace.sol. It is responsible for registering rents and holding information about them. It instanciates a NFTLabStoreMarketplaceVariant, a contract identical to NFTLabStore (a ERC721URIStorage and ERC721Enumerable contract) that also implements a function to force the transfer of nfts to the marketplace if the param form is allowed for that token. this way users can avoid a call to the blockchain allowing the market for the token. the NFTLabStore as already mentioned is responsible for holding NFTs, record movements of ownership and minting them, it holds the NFTs as the name suggests. the ERC721 Renting Marketplace is then specialized into two contracts: ETHMarketplace and ERC20Marketplace, the difference between the two is the way they handle paymens: ETHMarketplace uses ether, while ERC20Marketplace can use every IERC20 contract. The diagram of the architecture is the following

![marketplace full](https://user-images.githubusercontent.com/65864145/147497174-bc7c40d7-de62-461e-aac7-981e0e63c02f.png)
