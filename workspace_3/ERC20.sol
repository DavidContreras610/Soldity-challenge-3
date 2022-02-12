// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract Growthtkn{
    string public constant coin = "Growth";
    string public constant symbol = "GWTH";
    uint public constant decimal = 18;

    // mapping {key:value}
    // address: 1000 GWTH
    mapping(address => uint) balances;

    // supply
    uint _Totalsupply;

    constructor(uint inputValue) {
        _Totalsupply = inputValue;
        // msg.sender => metamask address
        balances[msg.sender] = _Totalsupply;

    }
    // REQUIRED FUNCTION #1
    function Totalsupply() public view returns(uint) {
        return _Totalsupply;
    }

    // REQUIRED FUNCTION #2
    function balancesOf(address owner) public view returns(uint){
        return balances[owner];
    }

    
    function transfer(address reciver, uint amount) public returns (bool) {
        if (balancesOf(msg.sender) >= amount){
            balances[msg.sender] -= amount;
            balances[reciver] += amount;
            return true;
        }else {
            return false;
        }
    }


    function transferFrom(address sender, address reciver, uint amount) public returns (bool) {
        if (balancesOf(sender) >= amount){
            balances[sender] -= amount;
            balances[reciver] += amount;
            return true;
        }else {
            return false;
        }
    }


}