// https://leetcode.com/problems/roman-to-integer/

class Solution {
    // Соотнести сиволы и пары сиволов с численным эквивалентом
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
}


let romanToInt = Solution().romanToInt

func test1() {
    19 == romanToInt("XIX")
}

func test2() {
    9 == romanToInt("IX")
}

func test3() {
    403 == romanToInt("CDIII")
}

func test4() {
    414 == romanToInt("CDXIV")
}

func test5() {
    1695 == romanToInt("MDCXCV")
    // MD + DC + CX + XC + CV
    // 1000 + DC + CX + XC + CV
    // 1000 + 500 + CX + XC + CV
    // 1000 + 500 + 100 + XC + CV
    // 1000 + 500 + 100 + 90 + CV
}

let tests = [
    test1,
    test2,
    test3,
    test4,
    test5
]

tests.forEach { $0() }
