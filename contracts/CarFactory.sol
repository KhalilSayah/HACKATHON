//SPDX-License-Identifier: MIT

import "./Car.sol";
pragma solidity >=0.6.0 <=0.9.0;


contract CarFactory{

    Car car;
    string niv;
    //Using mapping

    mapping(string => Car) listCars;

    function createCar(string memory _niv,string memory _infos) public{
        car = new Car(_niv,_infos);
        listCars[_niv] = car;
    }

    // function destroyCar(string memory _niv) public{
    //     Car(address(listCars[_niv]).exists = false;
    // }

    function carListMapping(string memory _niv) public view returns(Car){
        return Car(address(listCars[_niv]));
    }
}