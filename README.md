[![Compilation](https://github.com/NFT-Lab/ERC721-marketplace/actions/workflows/solidity-compile.yaml/badge.svg)](https://github.com/NFT-Lab/ERC721-marketplace/actions/workflows/solidity-compile.yaml)
[![Test](https://github.com/NFT-Lab/ERC721-marketplace/actions/workflows/tests.yaml/badge.svg)](https://github.com/NFT-Lab/ERC721-marketplace/actions/workflows/tests.yaml)
[![Coverage Status](https://coveralls.io/repos/github/NFT-Lab/ERC721-marketplace/badge.svg)](https://coveralls.io/github/NFT-Lab/ERC721-marketplace)
[![Test](https://github.com/NFT-Lab/ERC721-marketplace/actions/workflows/code-formatting.yaml/badge.svg)](https://github.com/NFT-Lab/ERC721-marketplace/actions/workflows/code-formatting.yaml)
[![code style: prettier](https://img.shields.io/badge/code_style-prettier-ff69b4.svg)](https://github.com/prettier/prettier)

# ERC721 Renting Marketplace

## Description

This repo contains the contracts to build an ERC721 renting marketplace on ethereum, wich underlying currency can either be ethereum itself (with _eth_) or an IERC20 implementation ([Openzeppelin's implementation](https://github.com/OpenZeppelin/openzeppelin-contracts/tree/master/contracts/token/ERC20) or your custom implementation). Can be imported as a npm package (procedure described below), this wway it provides alla the contracts, ABI for them and typechain generated code for static typing in typescript to build a dApp on top of it with [ethers.js](https://github.com/ethers-io/ethers.js/)

### Architecture

The main component is the Marketplace, written in `contracts/Marketplace.sol`. It is responsible for registering trades and holding information about them. It instanciates a `NFTLabStoreMarketplaceVariant`, a contract identical to `NFTLabStore` (a `ERC721URIStorage` and `ERC721Enumerable` contract) that also implements a function to force the transfer of nfts to the marketplace if the param `form` is allowed for that token. this way users can avoid a call to the blockchain allowing the market for the token. the `NFTLabStore` as already mentioned is responsible for holding NFTs, record movements of ownership and minting them, it holds the NFTs as the name suggests. the Marketplace is then specialized into two contracts: `ETHMarketplace` and `ERC20Marketplace`, the difference between the two is the way they handle paymens: `ETHMarketplace` uses ether, while `ERC20Marketplace` can use every `IERC20` contract. The diagram of the architecture is the following


![marketplace full](https://user-images.githubusercontent.com/65864145/147574529-c1f1d385-10e0-429c-8cb8-97f77b52e6dd.png)
