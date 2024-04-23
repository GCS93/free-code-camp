// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleStorage{

    //this number will get initialized to 0!
    uint256  favoriteNumber;

    //bool favoriteBool = false;
    //string favoriteString = "String";
    //int256 favoriteInt = -5;
    //address favoriteAdress = ;
    //bytes32 favoriteBytes = "cat";

    struct People {
        uint256 favoriteNumber;
        string name;
    }

    People public person = People({favoriteNumber: 2, name: "Patrick"});

    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    }

    function retrieve() public view returns(uint256){
        return favoriteNumber;
    }

    People[] public people;

    function addPerson(string memory _name, uint256 _favoriteNumber) public returns (People[] memory){
        //people.push(People({favoriteNumber: _favoriteNumber, name: _name})); one way of populating the array
        
        //if we know the order of the array, we can pass the variables straight to it
        people.push(People(_favoriteNumber, _name));
        nametoFavoriteNumber[_name] = _favoriteNumber;

        return people;
        
    }

    mapping(string => uint256) public nametoFavoriteNumber;

}