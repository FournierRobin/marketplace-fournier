// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract MarketPlace {
    address public owner;
    address public customer;

    enum ShippingStatus {
        Pending,
        Shipped,
        Delivered
    }
    ShippingStatus public status;

    event MissionComplete(address indexed customer);

    constructor() {
        status = ShippingStatus.Pending;
        owner = msg.sender;
    }

    function Shipped() public {
        require(msg.sender == owner, "Owner seulement");
        status = ShippingStatus.Shipped;
    }

    function Delivered() public {
        require(msg.sender == owner, "Owner seulement");
        status = ShippingStatus.Delivered;
    }

    function getStatus() public view returns (ShippingStatus) {
        require(msg.sender == owner, "Owner seulement");
        return status;
    }

    function Status() public payable returns (ShippingStatus) {
        require(msg.sender == customer, "Customer seulement");
        require(
            msg.value >= 0.00001 ether,
            "Veuillez payer pour utiliser la fonction"
        );
        return status;
    }
}
