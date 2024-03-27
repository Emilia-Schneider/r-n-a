// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Tournament {
    // Define tournament structure
    struct Tournament {
        uint256 id;
        string name;
        uint256 startTime;
        uint256 registrationDeadline;
        uint256 prizePool;
        mapping(address => bool) registeredPlayers;
        // Add more properties as needed
    }

    // Array to store tournaments
    Tournament[] public tournaments;

    // Event to emit when a new tournament is created
    event TournamentCreated(uint256 indexed id, string name, uint256 startTime, uint256 registrationDeadline, uint256 prizePool);

    // Function to create a new tournament
    function createTournament(string memory _name, uint256 _startTime, uint256 _registrationDeadline, uint256 _prizePool) external {
        // Ensure registration deadline is before start time
        require(_registrationDeadline < _startTime, "Registration deadline must be before start time");

        // Create new tournament
        Tournament memory newTournament = Tournament({
            id: tournaments.length,
            name: _name,
            startTime: _startTime,
            registrationDeadline: _registrationDeadline,
            prizePool: _prizePool
        });

        // Add tournament to array
        tournaments.push(newTournament);

        // Emit event
        emit TournamentCreated(newTournament.id, newTournament.name, newTournament.startTime, newTournament.registrationDeadline, newTournament.prizePool);
    }

    // Add more functions as needed
}
