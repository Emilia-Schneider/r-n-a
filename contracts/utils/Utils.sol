// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Utils {
    // Function to convert string to bytes32
    function stringToBytes32(string memory _source) internal pure returns (bytes32 result) {
        assembly {
            result := mload(add(_source, 32))
        }
    }

    // Add more utility functions as needed
}
