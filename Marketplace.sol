// SPDX-License-Identifier: MIT
pragma solidity 0.8.2;

/**
* @title The Marketplace contract.
* @author jaibo.eth
* @notice Displays all the NFTs listed that are available for leasing/renting.
* @notice Users can only deposit and withdraw from this contract.
* @dev  Contracts are split into state and functionality.
*/

contract EscrowState {
    mapping(uint => address) public approvedRenters;

    mapping(address => mapping(address => uint)) public ListedNFTsIds;
    
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
    
    
    // this function is to set a price per block for the nonFungibleTokenID
    function setPricePerBlock(uint price) public {
         
    }
    
    
    // this function is the action that a lender can take when he wants to get the NFT transfered from the contract to his wallet
    // this must be the point where we remove the right of the owner to transfer the ERC721
    function lease(address nonFungibleTokenID) public {
    
    }
    
    // add visibility here- after how many blocks the lender can get his rent 
    // add visibility here- is he/she eligible for some of these actions or if you execute the transaction it's going to be reverted? 
    function collectRent(address leasedNFTId, uint amount) public {
    }
    
    // add visibility here - after how many blocks the lender can reclaim its nft back?
    // add visibility here- is he/she eligible for some of these actions or if you execute the transaction it's going to be reverted?
    function reclaimNFT(address leasedNFTiD) public onlyOwner(OWNER_ROLE) { 
    }

}
