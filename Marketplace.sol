// SPDX-License-Identifier: MIT
pragma solidity 0.8.2;

contract EscrowState {
     mapping(uint => address) public approvedRenters;

    // 
    mapping(address => mapping(address => uint)) public ListedNFTsIds;

    // 
    mapping(address => address) public requestsToBeOperator;
    
    event UserDeposit(address indexed user, address indexed asset, uint amount);
    event UserWithdraw(address indexed user, address indexed asset, uint amount);
}

contract Marketplace {
    function deposit(address nonFungibleTokenID) external onlyRole(OWNER && OPERATOR) {
                   emit HouseRegistered(houseAddress, hOfCoin.HOUSE_TYPE(), asset);
    

}
