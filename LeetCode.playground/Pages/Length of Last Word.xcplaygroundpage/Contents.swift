/*
 Given a string s consisting of some words separated by some number of spaces, return the length of the last word in the string.

 A word is a maximal substring consisting of non-space characters only.
 */

class Solution {
    func lengthOfLastWord(_ s: String) -> Int {
        var prevChar: Character?
        var length = 0
        s.forEach { ch in
            if ch != " " {
                if prevChar == " " { length = 0 }
                length += 1
            }
            prevChar = ch
        }
        return length
    }
}

import XCTest

class Tests: XCTestCase {
    let solution = Solution()

    func testExample1() {
        XCTAssertEqual(solution.lengthOfLastWord(" abc"), 3)
    }
    
    func testExample2() {
        XCTAssertEqual(solution.lengthOfLastWord("ab "), 2)
    }
    
    func testExample3() {
        XCTAssertEqual(solution.lengthOfLastWord(" a  "), 1)
    }
    
    func testExample4() {
        XCTAssertEqual(solution.lengthOfLastWord(" a   bbd  "), 3)
    }
    
    func testExample5() {
        XCTAssertEqual(solution.lengthOfLastWord("a"), 1)
    }
}

TestRunner.runTests(Tests.self)
