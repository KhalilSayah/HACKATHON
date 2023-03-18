//SPDX-License-Identifier: MIT

pragma solidity >=0.6.0 <=0.9.0;

contract Car{

    string niv;
    string infos;
    address owner;
    string matriculation;
    string[] cacheMatriculationsList;
    string[] reports;
    string[] accidents;
    address[] cacheOwnersList;

    string transaction;
    string[] listPreviousTransactions;
    
    bool exists;
    bool signalisation;



    constructor(string memory _niv, string memory _infos){
        niv = _niv;
        exists = true;
        infos = _infos;
    }

    function getInfos() public view returns(string memory){
        return infos;
    }

    function addAccident(string memory _accident) public{
        accidents.push(_accident);
    }

    function accidentsList() public view returns (string[] memory) {
        return accidents;
    }

    function addReport(string memory _rapport) public{
        reports.push(_rapport);
    }

    function getReport() public view returns(string[] memory){
        return reports;
    }

    function setOwner(address _owner) public{
        require(owner != _owner, "The old owner and new one can't be the same");
        owner = _owner;
        cacheOwnersList.push(owner);
    }

    function setMatriculation(string memory _matriculation) public{
        require(keccak256(bytes(_matriculation)) != keccak256(bytes(matriculation)), "The old matriculation and new matriculation can't be the same");
        matriculation = _matriculation;
        cacheMatriculationsList.push(matriculation);
    }

    function getOwnerList() public view returns(address[] memory){
        return cacheOwnersList;
    }

    function setTransaction(string memory _transaction) public{
        transaction = _transaction;
        listPreviousTransactions.push(transaction);
    }

    function getPreviousTransactions() public view returns(string[] memory){
        return listPreviousTransactions;
    }

    function setSignalisation(bool _signalisation) public{
        signalisation = _signalisation;
    }

    function getSignalisation() public view returns(bool){
        return signalisation;
    }

    function getAllInfos() public view returns(bool, string memory, string[] memory, address[] memory, string[] memory, string[] memory, string[] memory, bool){
        return (exists, infos, accidents, cacheOwnersList, cacheMatriculationsList ,reports, listPreviousTransactions, signalisation);
    }

    function doesExist() public view returns(bool ){
        return exists;
    }

    function destroyCar() public{
        exists = false;
    }

}


