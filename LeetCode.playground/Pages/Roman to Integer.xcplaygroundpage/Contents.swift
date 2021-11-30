// https://leetcode.com/problems/roman-to-integer/

class Solution {
    let alphabet: [Character: Int] = [
        "I": 1,
        "V": 5,
        "X": 10,
        "L": 50,
        "C": 100,
        "D": 500,
        "M": 1000
    ]
    /// Runtime: 12 ms, faster than 94.59% of Swift online submissions for Roman to Integer.
    func romanToInt(_ s: String) -> Int {
        var previous: Int = Int.max
        return s.reduce(0) { sum, ch in
            let value = alphabet[ch]!
            defer { previous = value }
            guard value > previous else {
                return sum + value
            }
            return sum + value - 2 * previous
        }
    }
}

let romanToInt = Solution().romanToInt

19 == romanToInt("XIX")
9 == romanToInt("IX")
403 == romanToInt("CDIII")
414 == romanToInt("CDXIV")
1695 == romanToInt("MDCXCV")
10 == romanToInt("X")
