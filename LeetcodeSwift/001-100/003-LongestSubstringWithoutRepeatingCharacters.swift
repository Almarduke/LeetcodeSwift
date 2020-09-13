// https://leetcode.com/problems/longest-substring-without-repeating-characters/solution/
// sliding window optimized
// index: current index of certain char
// startIndex: start index of substr, if s[index] has occurred in substr at index i(i >= startIndex),
//             the new substr should start at index (k + 1), else at startIndex.
class Solution003 {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var charIndex = Dictionary<Character, Int>();
        var longest = 0
        var startIndex = 0
        for (index, char) in s.enumerated() {
            let i = charIndex[char] ?? -1
            startIndex = i >= startIndex ? i + 1 : startIndex
            longest = max(longest, index - startIndex + 1)
            charIndex[char] = index
        }
        return longest
    }
}

//    My own solution, a little naive
//    func lengthOfLongestSubstring(_ s: String) -> Int {
//        var substr = ""
//        var longest = 0
//        for char in s {
//            let index = substr.firstIndex(of: char)
//            let splitIndex = (index != nil) ? substr.index(after: index!) : substr.startIndex
//            substr = String(substr[splitIndex...]) + String(char)
//            longest = max(longest, substr.count)
//        }
//        return longest
//    }


// Given a string s, find the length of the longest substring without repeating characters.
//
// Example 1:
// Input: s = "abcabcbb", Output: 3
// Explanation: The answer is "abc", with the length of 3.
//
// Example 2:
// Input: s = "bbbbb", Output: 1
// Explanation: The answer is "b", with the length of 1.
//
// Example 3:
// Input: s = "pwwkew", Output: 3
// Explanation: The answer is "wke", with the length of 3.
// Notice that the answer must be a substring, "pwke" is a subsequence and not a substring.
//
// Example 4:
// Input: s = ""
// Output: 0
//
// Constraints:
//
// 0 <= s.length <= 5 * 104
// s consists of English letters, digits, symbols and spaces.
