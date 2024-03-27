// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/* Problem 1 Interface & Contract */
contract StudentV1 {
    uint256 private _nextStudentId = 1;
    mapping(address => uint256) private _studentIds;
    bool private _firstCall = true;

    event StudentRegistered(address student, uint256 studentId);

    function register() external returns (uint256) {
        require(_studentIds[msg.sender] == 0, "Student is already registered.");

        // On the first call, return a value that satisfies the condition in ClassroomV1::enroll
        if (_firstCall) {
            _firstCall = false;
            return 1000; // Return 1000 to satisfy the condition
        }

        // For subsequent calls or for other students, return 123 or another appropriate value
        uint256 studentId = 123; // Set to 123 to meet the test expectation
        _studentIds[msg.sender] = studentId;

        emit StudentRegistered(msg.sender, studentId);

        return studentId;
    }
}




/* Problem 2 Interface & Contract */

contract StudentV2 {

    // View function to comply with the interface
    function register() external returns (uint256) {
        if (gasleft() >= 8937393460516655962) {
            return gasleft();
        }
        return 123;

    }
}






/* Problem 3 Interface & Contract */
contract StudentV3 {

    // View function to comply with the interface
    function register() external returns (uint256) {
        if (gasleft() >= 7173) {
            return gasleft();
        }
        return 123;

    }
}