// SPDX-License-Identifier: MIT
pragma solidity 0.8.2;

contract EscrowState {
     mapping(uint => address) public approvedRenters;

    mapping(address => mapping(address => uint)) public ListedNFTsIds;

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
    
    function withdraw(address nonFungibleTokenID) public {
      (address nonFungibleTokenID) =  _checkBalances(msg.sender, rentedTokenID);
      
      require(rentedTokenId == exists);
      
      ERC721(rentedTokenID).transfer(msg.sender, nonFungibleTokenID);

      // Emit withdraw event.
      emit UserWithdraw(msg.sender, nonFungibleTokenID);
      
    }
     
    function setPricePerBlock(uint price) public {
         
    }
    
    function lease(address nonFungibleTokenID) public {
    
    }
    
    function collectRent(address leasedNFTId, uint amount) public {
    // add visibility here- after how many blocks the lender can get his rent 
    // add visibility here- is he/she eligible for some of these actions or if you execute the transaction it's going to be reverted? 
    }
    
    function reclaimNFT(address leasedNFTiD) public onlyOwner(OWNER_ROLE) {
    // add visibility here - after how many blocks the lender can reclaim its nft back?
    // add visibility here- is he/she eligible for some of these actions or if you execute the transaction it's going to be reverted? 

    }

}
