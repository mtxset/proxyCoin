pragma solidity 0.4.13;

contract ProxyFor
{
    // Must remain as first declaration
    address _addr;

    address _owner;
    uint8 _version;
    string _libraryName;

    function ProxyFor(address addr) 
    { _addr = addr; _owner = msg.sender; }

    function ()
    {
        assembly
        {
            let g := and(gas, 0xEFFFFFFF)
            let code := mload(0x40)
            let addr := and(sload(0), 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF)
            calldatacopy(code, 0, calldatasize)

            let retval := call(g, addr, 0, code, calldatasize, code, 32)
            jumpi(0x02, iszero(retval))
            return (code, 32)
        }
    }

    function Version() public constant
    returns (uint8)
    { return _version; }

    function LibraryName() public constant
    returns (string)
    { return _libraryName; }
}