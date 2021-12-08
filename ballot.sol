// SPDX-License-Identifier: MIT
pragma solidity >=0.7.4;
contract Ballot {
int public ballot;
struct user { 
   string userAddr;
   int userballot;
}
user[] public listOfUser;

  function addBalot(string calldata addr) public{
    if (listOfUser.length == 0) {
        listOfUser.push(user(addr, 1));
    } else {
        uint useraddridx = 0;
        uint userIn = 0;
        for (uint i=0; i < listOfUser.length; i++){
            if(keccak256(abi.encodePacked(listOfUser[i].userAddr)) == keccak256(abi.encodePacked(addr))){
                userIn = 1;
                useraddridx = i;
            }
        }
        if (userIn == 0){
            listOfUser.push(user(addr, 1));
        } else {
            listOfUser[useraddridx].userballot++;
        }
    }
  }
  function display(string calldata addr) public view returns (int){
    int result = 0;
    for (uint i=0; i < listOfUser.length; i++){
        if(keccak256(abi.encodePacked(listOfUser[i].userAddr)) == keccak256(abi.encodePacked(addr))){
            result = listOfUser[i].userballot;
        }
    }
    return result;
  }
}