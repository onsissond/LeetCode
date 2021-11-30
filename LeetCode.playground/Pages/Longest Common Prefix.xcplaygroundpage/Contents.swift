/*
 https://leetcode.com/problems/longest-common-prefix/
 Write a function to find the longest common prefix string amongst an array of strings.

 If there is no common prefix, return an empty string "".
 */

class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        guard let firstWord = strs.first else { return "" }
        var maxIndex: String.Index?
        outerLoop: for index in firstWord.indices {
            let currentCharacter = firstWord[index]
            for i in 1..<strs.count {
                let str = strs[i]
                if index == str.endIndex { break outerLoop }
                if currentCharacter != str[index] { break outerLoop }
            }
            maxIndex = index
        }
        return maxIndex.map { String(firstWord[...$0]) } ?? ""
    }
}

import XCTest

class Tests: XCTestCase {
    let solution = Solution()

    func testExample1() {
        XCTAssertEqual(
            solution.longestCommonPrefix(["flower","flow","flight"]),
            "fl"
        )
    }
 
    func testExample2() {
        XCTAssertEqual(
            solution.longestCommonPrefix(["dog","racecar","car"]),
            ""
        )
    }
    
    func testExample3() {
        XCTAssertEqual(
            solution.longestCommonPrefix(["dog","dacecar","car"]),
            ""
        )
    }
    
    func testExample4() {
        XCTAssertEqual(
            solution.longestCommonPrefix([]),
            ""
        )
    }
}

TestRunner.runTests(Tests.self)
