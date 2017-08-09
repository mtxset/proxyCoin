pragma solidity 0.4.13;

//import 'zeppelin-solidity/contracts/token/MintableToken.sol';
import './OZ/Crowdsale.sol';

contract ProxyCoinCrowdsale is Crowdsale
{
    MintableToken ml;

    function ProxyCoinCrowdsale
      ( uint startBlock,
        uint endBlock,
        uint rate,
        address wallet,
        address tokenAddr)
        Crowdsale(startBlock, endBlock, rate, wallet)
    {
        ml = MintableToken(tokenAddr);
    }

    function createTokenContract() internal 
    returns (MintableToken)
    {
        return ml; 
    }
}
