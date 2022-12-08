// SPDX-License-Identifier: MIT
pragma solidity 0.8.8;

// EVM, Ethereum Virtual Machine
// Avalanche, Fantom, Polygon
contract SimpleStorage {
    // This gets initialized to zero!
    // default visibility is internal
    uint256 public favoriteNumber;
    // People public person = People({favoriteNumber: 2, name: "Patrick"});

    mapping(string => uint256) public nameToFavoriteNumber;

    struct People {
        uint256 favoriteNumber;
        string name;
    }
    // Dynamic array
    People[] public people;

    function store(uint256 _favoriteNumber) public virtual {
        favoriteNumber = _favoriteNumber;
        // example vut if we call view o pure from here it will cost gas since calling store funtion cost gas
        // retieve();
    }

    // no necessary to declare this functio since public state variables 
    // create a getter
    // view, pure functions disallow modification of state (dont cost gas)
    // pure functions additionally disallow you to read from blockchain state
    function retrieve() public view returns(uint256) {
        return favoriteNumber;
    }

    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        // People memory newPerson = People({favoriteNumber: _favoriteNumber, name: _name});
        // People memory newPerson = People(_favoriteNumber, _name);
        // people.push(newPerson);
        people.push(People(_favoriteNumber, _name));
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }
}