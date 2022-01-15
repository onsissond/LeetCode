/*
 You are climbing a staircase. It takes n steps to reach the top.

 Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?
 */

class Solution {
    func climbStairs(_ n: Int) -> Int {
        var prevPrev = 1
        var prev = 1
        var k = n - 2
        while k >= 0 {
            prev = prevPrev + prev
            prevPrev = prev - prevPrev
            k -= 1
        }
        return prev
    }
}

import XCTest

class Tests: XCTestCase {
    let solution = Solution()

    func testExample1() {
        // 1 1
        XCTAssertEqual(solution.climbStairs(1), 1)
    }
    
    func testExample2() {
        // 1 1
        // 2
        XCTAssertEqual(solution.climbStairs(2), 2)
    }
    
    func testExample3() {
        // 1 1 1
        // 2 1
        // 1 2
        XCTAssertEqual(solution.climbStairs(3), 3)
    }
    
    func testExample4() {
        // 1 1 1 1
        // 2 1 1
        // 1 1 2
        // 1 2 1
        // 2 2
        XCTAssertEqual(solution.climbStairs(4), 5)
    }
    
    func testExample5() {
        // 1 1 1 1 1
        // 1 1 1 2
        // 1 1 2 1
        // 1 2 1 1
        // 2 1 1 1
        // 1 2 2
        // 2 1 2
        // 2 2 1
        XCTAssertEqual(solution.climbStairs(5), 8)
    }
    
    func testExample6() {
        // 1 1 1 1 1 1
        // 1 1 1 1 2
        // 1 1 1 2 1
        // 1 1 2 1 1
        // 1 2 1 1 1
        // 2 1 1 1 1
        // 1 1 2 2
        // 1 2 1 2
        // 2 1 1 2
        // 2 1 2 1
        // 2 2 1 1
        // 1 2 2 1
        // 2 2 2
        XCTAssertEqual(solution.climbStairs(6), 13)
    }
}

TestRunner.runTests(Tests.self)
