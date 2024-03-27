// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PlayerRegistry {
    // Mapping to track registered players
    mapping(address => bool) public registeredPlayers;

    // Event to emit when a player is registered
    event PlayerRegistered(address indexed player);

    // Function to register a player
    function registerPlayer() external {
        // Ensure player is not already registered
        require(!registeredPlayers[msg.sender], "Player is already registered");

        // Register player
        registeredPlayers[msg.sender] = true;

        // Emit event
        emit PlayerRegistered(msg.sender);
    }

    // Add more functions as needed
}
