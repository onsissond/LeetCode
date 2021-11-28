// https://leetcode.com/problems/roman-to-integer/

class Solution {
    let alphabet = [
        "I": 1,
        "V": 5,
        "X": 10,
        "L": 50,
        "C": 100,
        "D": 500,
        "M": 1000,
        "IV": 4,
        "IX": 9,
        "XL": 40,
        "XC": 90,
        "CD": 400,
        "CM": 900
    ]

    // 20 ms
    func romanToInt(_ s: String) -> Int {
        guard s.count > 1 else { return alphabet[s]! }
        return zip(s.indices, s.indices.dropFirst())
            .reduce((sum: 0, skip: false)) { result, indices in
                let (sum, skip) = result
                let (index1, index2) = indices
                let pair = alphabet[String(s[index1...index2])]
                let last = pair == nil && index2 == s.index(before: s.endIndex)
                ? alphabet[String(s[index2])] ?? 0
                : 0
                guard !skip else { return (sum + last, false) }
                let stepResult = sum + (pair ?? alphabet[String(s[index1])] ?? 0) + last
                return (stepResult, pair != nil)
            }.sum
    }
    
    // 28 ms
    func romanToInt_recursive(_ s: String) -> Int {
        guard s.count > 1 else { return alphabet[s]! }
        let firstSymbolIndex = s.startIndex
        let secondSymbolIndex = s.index(after: s.startIndex)
        guard let pair = alphabet[String(s[firstSymbolIndex...secondSymbolIndex])] else {
            return alphabet[String(s.first!)]! + romanToInt(String(s.dropFirst()))
        }
        return secondSymbolIndex == s.index(before: s.endIndex)
        ? pair
        : pair + romanToInt(String(s[s.index(after: secondSymbolIndex)...]))
    }
}


let romanToInt = Solution().romanToInt


19 == romanToInt("XIX")
9 == romanToInt("IX")
403 == romanToInt("CDIII")
414 == romanToInt("CDXIV")
1695 == romanToInt("MDCXCV")
10 == romanToInt("X")
