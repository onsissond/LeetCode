/*
 https://leetcode.com/problems/reverse-integer/
 Given a signed 32-bit integer x, return x with its digits reversed. If reversing x causes the value to go outside the signed 32-bit integer range [-2^31, 2^31 - 1], then return 0.

 Assume the environment does not allow you to store 64-bit integers (signed or unsigned).
 */

class Solution {
    func reverse(_ x: Int) -> Int {
        var reversed = 0
        var currentX = x
        while currentX != 0 {
            guard let multiplay = multiplay(reversed, 10) else { return 0 }
            guard let sum = sum(multiplay, currentX % 10) else { return 0 }
            reversed = sum
            currentX /= 10
        }
        return reversed
    }

    func multiplay(_ x: Int, _ y: Int) -> Int? {
        if x == 0 || y == 0 {
            return 0
        } else if x > 0 && y > 0 {
            return multiplay(x, y - 1).flatMap { sum(x, $0) }
        } else if x < 0 && y < 0 {
            return multiplay(abs(x), abs(y))
        } else {
            return multiplay(abs(x), abs(y) - 1)
                .flatMap { sum(-abs(x), -abs($0)) }
        }
    }
    
    func sum(
        _ x: Int,
        _ y: Int,
        max: Int = Int(Int32.max),
        min: Int = Int(Int32.min)
    ) -> Int? {
        if x >= 0 && y >= 0 {
            guard x <= max - y else { return nil }
            return x + y
        } else if x < 0 && y < 0 {
            guard x >= min - y else { return nil }
            return x + y
        } else {
            return x + y
        }
    }
}

import XCTest

class Tests: XCTestCase {
    let solution = Solution()

    func testExample1() {
        XCTAssertEqual(solution.reverse(123), 321)
    }

    func testExample2() {
        XCTAssertEqual(solution.reverse(-123), -321)
    }

    func testExample3() {
        XCTAssertEqual(solution.reverse(120), 21)
    }

    func testExample4() {
        XCTAssertEqual(solution.reverse(0), 0)
    }

    func testExample5() {
        XCTAssertEqual(solution.reverse(2147483647), 0)
    }

    func testExample6() {
        XCTAssertEqual(solution.reverse(-2147483648), 0)
    }

    func testExample7() {
        XCTAssertEqual(solution.reverse(-2147447412), -2147447412)
    }

    func testExample9() {
        XCTAssertEqual(solution.multiplay(10, -5), -50)
        XCTAssertEqual(solution.multiplay(10, 5), 50)
        XCTAssertEqual(solution.multiplay(0, 5), 0)
        XCTAssertEqual(solution.multiplay(2147483647, 1), 2147483647)
        XCTAssertEqual(solution.multiplay(2147483647, 2), nil)
    }

    func testExample10() {
        XCTAssertEqual(solution.sum(2147483647, 0), 2147483647)
        XCTAssertEqual(solution.sum(2147483647, 1), nil)
        XCTAssertEqual(solution.sum(-1, -1), -2)
        XCTAssertEqual(solution.sum(-2147483647, -0), -2147483647)
        XCTAssertEqual(solution.sum(-2147483647, -1), -2147483648)
        XCTAssertEqual(solution.sum(-2147483648, 1), -2147483647)
        XCTAssertEqual(solution.sum(-2147483647, -2), nil)
    }
}

TestRunner.runTests(Tests.self)
