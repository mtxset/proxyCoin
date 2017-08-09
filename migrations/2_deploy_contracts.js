var MintableToken = artifacts.require("OZ/MintableToken.sol");
var ProxyFor = artifacts.require("ProxyFor.sol");
var ProxyCoin = artifacts.require("ProxyCoin.sol")

module.exports = function(deployer) 
{

  deployer.deploy(MintableToken).then(function()
  {
    return deployer.deploy(ProxyFor, MintableToken.address).then(function()
    {
        const startBlock = web3.eth.blockNumber + 2;
        const endBlock = startBlock + 300;
        const rate = new web3.BigNumber(1000);
        const wallet = web3.eth.accounts[0];

        return deployer.deploy(
          ProxyCoin, 
          startBlock,
          endBlock, 
          rate, 
          wallet,
          ProxyFor.address);
    })
  })

};
