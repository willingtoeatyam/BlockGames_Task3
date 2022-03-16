// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

abstract contract ERC20Interface {
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);

    function totalSupply() public view virtual returns(uint256);

    function balanceOf(address who) public view virtual returns(uint256);

    function transfer(address to, uint256 value) public virtual returns(bool);

    function approve(address spender, uint256 value) public virtual returns(bool);

    function allowance(address owner, address spender) public view virtual returns(uint256);

    function transferFrom(address from, address to, uint256 value) public virtual returns(bool);
}