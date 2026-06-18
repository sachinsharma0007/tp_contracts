// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// contract ForLoopExample {

//     function sumNumbers() public pure returns (uint) {
//         uint sum = 0;

//         for (uint i = 1; i <= 5; i++) {
//             sum += i;
//         }

//         return sum;
//     }
// }




contract Numbers {

    function getNumbers() public pure returns(uint[] memory) {
        uint[] memory nums = new uint[](5);

        for(uint i = 0; i < 5; i++) {
            nums[i] = i + 1;
        }

        return nums;
    }
}
