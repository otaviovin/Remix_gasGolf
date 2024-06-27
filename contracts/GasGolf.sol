// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.9;

contract gasGolf {

    uint256 total;

    //This way is the normal way, do not thinking about gas taxes reduction
    //Ex: [10,20,3] gives around 55203 gas tax
    function addIfIsEvenAndLessThan50 (uint256[] memory nums) external {
        for (uint256 i = 0; i < nums.length; i += 1) {
            //Two checks here
            bool eEven = nums[i] % 2 == 0; //if number is divisible per 2 (is even)
            bool eLessThan50 = nums[i] < 50; //if number is less than 50
            if (eEven && eLessThan50) {
                //both varaibles with conditions have to be true
                //to give the follow sum function
                total += nums[1];
            }
        }
    }

    //This way is optimized to reduce gas taxes
    //calldata is better than memory, can reduce significantly
    //Ex: [10,20,3] gives around 36959 gas tax
    function addIfIsEvenAndLessThan50Optmized(uint256[] calldata nums) external {
        uint256 _total = total;
        uint256 len = nums.length; //declarando aqui já gera reduçao de gas

        for (uint256 i = 0; i < len; i += 1) {
            uint256 num = nums[1]; //pegamos todos os numeros inseridos
            //if number is divisible per 2 (is even)
            //if number is less than 50
            //in a if function with both
            //both conditions have to be true
            if (num % 2 == 0 && num < 50) { 
                total += nums[i];
            }
            //inform the compiler that a particular operation should be 
            //performed without any checks
            unchecked {
                ++i;
            }
        }
        //give us the total after function transact
        total = _total;
    }
}