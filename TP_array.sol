// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract array_practice{

    uint[] numbers =[0,1,2,3,4];

    function add_num (uint num) public {
        numbers.push (num);
    }

    function remove_num () public {
        numbers.pop ();
    }

    function get_length () public view returns (uint) {
        return numbers.length;
    }

    function get_all_numbers () public view returns (uint [] memory) {
        return numbers;
    }

}
