/*
 https://leetcode.com/problems/valid-parentheses/
 Given a string s containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.

 An input string is valid if:

 Open brackets must be closed by the same type of brackets.
 Open brackets must be closed in the correct order.
 */

class Solution {
    func isValid(_ s: String) -> Bool {
        guard s.count % 2 == 0 else { return false }
        let parentheses: [Character: Character] = [
            "(": ")",
            "{": "}",
            "[": "]"
        ]
        var stack: [Character] = []
        for ch in s {
            guard parentheses[ch] == nil else {
                stack.append(ch)
                continue
            }
            guard let last = stack.popLast(), parentheses[last] == ch else {
                return false
            }
        }
        return stack.isEmpty
    }
}

import XCTest

class Tests: XCTestCase {
    let solution = Solution()

    func testExample1() {
        XCTAssertTrue(solution.isValid("()"))
    }
    
    func testExample2() {
        XCTAssertTrue(solution.isValid("()[]{}"))
    }
    
    func testExample3() {
        XCTAssertFalse(solution.isValid("(]"))
    }
    
    func testExample4() {
        XCTAssertFalse(solution.isValid("([)]"))
    }
    
    func testExample5() {
        XCTAssertTrue(solution.isValid("{[]}"))
    }
    
    func testExample6() {
        XCTAssertFalse(solution.isValid("("))
    }
}

TestRunner.runTests(Tests.self)
