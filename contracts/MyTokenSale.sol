// SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;

import "./Crowdsale.sol";

contract MyTokenSale is Crowdsale {

    constructor(
        uint256 rate,  // rate in TKNbits
        address payable wallet,
        IERC20 token
    )
        Crowdsale(rate, wallet, token)
        public
    {

    }
}