// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StudentGrade {

    function getGrade(uint marks) public pure returns (string memory) {

        if (marks >= 90) {
            return "A";
        }
        else if (marks >= 75) {
            return "B";
        }
        else if (marks >= 60) {
            return "C";
        }
        else {
            return "Fail";
        }
    }
}
