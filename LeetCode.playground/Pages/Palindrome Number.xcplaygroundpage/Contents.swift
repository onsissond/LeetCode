/*
 https://leetcode.com/problems/palindrome-number/
 Given an integer x, return true if x is palindrome integer.

 An integer is a palindrome when it reads the same backward as forward. For example, 121 is palindrome while 123 is not.
 */

class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        if x < 0 || (x % 10 == 0 && x != 0) { return false }
        var reverseHalfNumber = 0
        var x = x
        while reverseHalfNumber < x {
            reverseHalfNumber = reverseHalfNumber * 10 + x % 10
            x /= 10
        }
        return x == reverseHalfNumber || reverseHalfNumber / 10 == x
    }
}

import XCTest

class Tests: XCTestCase {
    let solution = Solution()

    func testExample1() {
        XCTAssertTrue(solution.isPalindrome(121))
    }
    
    func testExample2() {
        XCTAssertFalse(solution.isPalindrome(-121))
    }
    
    func testExample3() {
        XCTAssertFalse(solution.isPalindrome(10))
    }

    func testExample4() {
        XCTAssertTrue(solution.isPalindrome(11))
    }

    func testExample5() {
        XCTAssertFalse(solution.isPalindrome(123))
    }
    
    func testExample6() {
        XCTAssertTrue(solution.isPalindrome(12321))
    }
    
    func testExample7() {
        XCTAssertTrue(solution.isPalindrome(1))
    }
    
    func testExample8() {
        XCTAssertTrue(solution.isPalindrome(0))
    }
    
    func testExample10() {
        XCTAssertTrue(solution.isPalindrome(11))
    }
}

TestRunner.runTests(Tests.self)
