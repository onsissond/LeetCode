/*
 https://leetcode.com/problems/implement-strstr/
 Implement strStr().

 Return the index of the first occurrence of needle in haystack, or -1 if needle is not part of haystack.

 Clarification:

 What should we return when needle is an empty string? This is a great question to ask during an interview.

 For the purpose of this problem, we will return 0 when needle is an empty string. This is consistent to C's strstr() and Java's indexOf().
 */

class Solution {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        if needle.isEmpty { return 0 }
        for offset in 0..<haystack.count {
            let startIndex = haystack.index(haystack.startIndex, offsetBy: offset)
            guard let endIndex = haystack.index(
                haystack.startIndex,
                offsetBy: offset + needle.count,
                limitedBy: haystack.endIndex
            ) else { return -1 }
            if haystack[startIndex..<endIndex] == needle { return offset }
        }
        return -1
    }
}

extension String {
    subscript(offsetBy: Int) -> Character {
        self[index(startIndex, offsetBy: offsetBy)]
    }
}
    
import XCTest

class Tests: XCTestCase {
    let solution = Solution()

    func testExample1() {
        XCTAssertEqual(solution.strStr("hello", "ll"), 2)
    }

    func testExample2() {
        XCTAssertEqual(solution.strStr("aaaaa", "bba"), -1)
    }

    func testExample3() {
        XCTAssertEqual(solution.strStr("", ""), 0)
    }

    func testExample4() {
        XCTAssertEqual(solution.strStr("heloll", "ll"), 4)
    }

    func testExample5() {
        XCTAssertEqual(solution.strStr("lll", "l"), 0)
    }

    func testExample6() {
        XCTAssertEqual(solution.strStr("lll", "lll"), 0)
    }

    func testExample7() {
        XCTAssertEqual(solution.strStr("abc", "c"), 2)
    }

    func testExample8() {
        XCTAssertEqual(solution.strStr("abc", "abcd"), -1)
    }

    func testExample9() {
        XCTAssertEqual(solution.strStr("mississippi", "issip"), 4)
    }
}

TestRunner.runTests(Tests.self)
