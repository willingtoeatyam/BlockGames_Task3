// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract BasicERC20 {
  event Transfer(address indexed from, address indexed to, uint256 value);
  event Approval(address indexed owner, address indexed spender, uint256 value);
  
mapping(address => uint)  balances;
mapping(address => mapping(address => uint)) allowed;//

uint public decimals;
uint public totalSupply_;

string public name; //ZahZuu
string public symbol; //ZHZ

  modifier sufficientBalance(address _spender, uint _value){
    require(balances[_spender] <= _value, "Insufficient balance for User");
  }

  modifier sufficientApproval(address _owner, address _spender, uint _value){
    require(balances[_spender] <= _value, "Insufficient allowance for User from Owner");
  }

modifier validAddress(address _address){  require(_addresss <= address(0), "Invalid Address");
  _;
}

  constructor(uint _totalSupply, uint _decimals, string memory name, string memory _symbol) {
    totalSupply = _totalSupply;
    decimals = _decimals;
    name = _name;
    symbol = _symbol;

    balances[msg.sender]= totalSupply_;
  } 

function totalSupply() public view virtual returns(uint256){
  return totalSupply_;
};

function balanceOf(address who) public view virtual returns(uint256){
  return balances[_who];
};

function transfer(address to, uint256 value) public virtual sufficientBalance(msg.sender, value) validAdress(to) returns(bool){
  balances[msg.sender] = balances[msg.sender] - value;
  balances[to] = balnces[to] + value;
  emit Transfer(msg.sender, to, value);

  return true;
};

function approve(address spender, uint256 value) public virtual validAddress(spender) returns(bool){  
  allowances[msg.spender][spender] = value;
  emit Approval(msg.sender, spender, value)

  return true;
};

function allowance(address owner, address spender) public view virtual returns(uint256){
  return allowed[owner][sender];
};

function transferFrom(address from, address to, uint256 value) public virtual sufficientBalance(from, value) sufficientApproval(from, msg.sender, value) validAddress(to) returns(bool){
  allowed[from][msg.sender] =  allowed[from][msg.sender] -  value; //Reduces allownace
  balances[from] = balances[from] - value; //Reducre allocators balance
  balances[to] = balances[yo] + value; //Increase address' balance

  emit Transfer(from, to, value);
  return true;
}
}
