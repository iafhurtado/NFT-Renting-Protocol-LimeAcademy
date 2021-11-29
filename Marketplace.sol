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
    function deposit(address nonFungibleTokenID) public {
      
      // Transfer reserveAsset amount to this contract.
      ERC721(nonFungibleTokenID).transferFrom(msg.sender, address(this), amount);
      
      
      escrowState.mint(msg.sender, nonFungibleTokenID, "");
      
      emit UserDeposit(msg.sender, nonFungibleTokenID);
    }

}
