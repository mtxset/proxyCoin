# Proxy Coin

OpenZeppelin.Crowdsale
OpenZeppelin.MintableToken

ProxyCoin -> ProxyFor -> OpenZeppelin.MintableToken

The idea that if you reference ProxyFor in ProxyCoin you don't touch ProxyCoin if you
want to change OpenZeppelin.MintableToken. 

So if client wants to use your contract you provide proxy for him.

Very gimmicky, many bugs. 