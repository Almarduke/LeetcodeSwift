// I chose to count the number of "1" on each digit
// The number of "1" on each digit can only be 3x or 3x + 1. (x is a non-negative integer)
// bin and unit are composition of counter, a counter for each digit.
// bin means binary digit, unit means unit digit.
// Once the counter reaches 3, it should be reset to 0. (variable threeToZero)
class Solution137 {
    func singleNumber(_ nums: [Int]) -> Int {
        var unit = 0
        var bin = 0
        for num in nums {
            bin = bin | (unit & num)
            unit = unit ^ num
            let threeToZero = ~(bin & unit)
            unit = unit & threeToZero
            bin = bin & threeToZero
        }
        return unit
    }
}

// Given a non-empty array of integers, every element appears three times except for one, which appears exactly once. Find that single one.
//
// Note:
// Your algorithm should have a linear runtime complexity. Could you implement it without using extra memory?
//
// Example 1:
// Input: [2,2,3,2]
// Output: 3
//
// Example 2:
// Input: [0,1,0,1,0,1,99]
// Output: 99
