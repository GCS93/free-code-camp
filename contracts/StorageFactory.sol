// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./SimpleStorage.sol";

contract StorageFactory is SimpleStorage { //"is contract_X" makes the new contract inherite all the functions and objects in contract_x

    SimpleStorage[] public simpleStorageArray;

    function createSimpleStorageContract() public {
        SimpleStorage simpleStorage = new SimpleStorage();
        simpleStorageArray.push(simpleStorage);
    }

    function sfStore(uint256 _simpleStorageIndex, uint256 _simpleStorageNumber) public {
        //Para interagir com outro contrato é necessário Address e ABI
        SimpleStorage(address(simpleStorageArray[_simpleStorageIndex])).store(_simpleStorageNumber);
        //same as this
        //SimpleStorage simpleStorage = SimpleStorage(address(simpleStorageArray[_simpleStorageIndex]));
        //simpleStorage.store(_simpleStorageNumber);
        
    }

    function sfGet(uint256 _simpleStorageIndex) public view returns(uint256) {
        return SimpleStorage(address(simpleStorageArray[_simpleStorageIndex])).retrieve();
        //same as this
        //SimpleStorage simpleStorage = SimpleStorage(address(simpleStorageArray[_simpleStorageIndex]));
        //return simpleStorage.retrieve();
    }    
}