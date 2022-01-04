/*
 The complement of an integer is the integer you get when you flip all the 0's to 1's and all the 1's to 0's in its binary representation.

 For example, The integer 5 is "101" in binary and its complement is "010" which is the integer 2.
 Given an integer n, return its complement.
 */

class Solution {
    func bitwiseComplement(_ n: Int) -> Int {
        var n = n
        var result = 0
        var lvl = 1
        repeat {
            result += (n % 2 == 0 ? 1 : 0) * lvl
            lvl = lvl << 1
            n = n >> 1
        } while n > 0
        return result
    }
}

import XCTest

class Tests: XCTestCase {
    let solution = Solution()

    func testExample1() {
        XCTAssertEqual(solution.bitwiseComplement(5), 2)
    }
    
    func testExample2() {
        XCTAssertEqual(solution.bitwiseComplement(7), 0)
    }
    
    func testExample3() {
        XCTAssertEqual(solution.bitwiseComplement(10), 5)
    }
    
    func testExample4() {
        XCTAssertEqual(solution.bitwiseComplement(0), 1)
    }
}

TestRunner.runTests(Tests.self)
