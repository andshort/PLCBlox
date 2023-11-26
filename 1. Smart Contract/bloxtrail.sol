// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "hardhat/console.sol";

contract BloxTrail {

    address private admin;
    address private user;
    address private superuser;

    int16 public Temperature;
    bool public OperationMode;

    modifier isAdmin() {
        require(msg.sender == admin, "Caller is not the admin");
        _;
    }
    modifier isUser() {
        require(msg.sender == user, "Invalid Permissions");
        _;
    }
    modifier isSuperUser() {
        require((msg.sender == user) || (msg.sender == superuser) , "Invalid Permissions");
        _;
    }
   
    constructor() {
        console.log("BloxTrail contract deployed by:", msg.sender);
        admin = msg.sender; // 'msg.sender' is sender of current call, contract deployer for a constructor
        user = admin;
        superuser = admin;
    }

    function changeUser(address newUser) public isAdmin {
        user = newUser;
    }
    function changeSuperUser(address newSuperUser) public isAdmin {
        superuser = newSuperUser;
    }

    function SetTemperature(int16 newTemperature) public isSuperUser {
        Temperature = newTemperature;
    }
    function SwitchON() public isUser {
        OperationMode = true;
    }
     function SwitchOFF() public isUser {
        OperationMode = false;
    }
} 