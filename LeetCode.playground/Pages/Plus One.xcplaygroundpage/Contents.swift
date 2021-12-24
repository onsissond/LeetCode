/*
 You are given a large integer represented as an integer array digits, where each digits[i] is the ith digit of the integer. The digits are ordered from most significant to least significant in left-to-right order. The large integer does not contain any leading 0's.

 Increment the large integer by one and return the resulting array of digits.
*/

class Solution {
    func plusOne(_ digits: [Int]) -> [Int] {
        var output = digits
        var i = output.count - 1
        while i >= 0 && output[i] == 9 {
            output[i] = 0
            i -= 1
        }
        if i >= 0 {
            output[i] += 1
        } else {
            output = Array(repeating: 0, count: output.count + 1)
            output[0] = 1
        }
        return output
    }
}

import XCTest

class Tests: XCTestCase {
    let solution = Solution()

    func testExample1() {
        XCTAssertEqual(solution.plusOne([1,2,3]), [1, 2, 4])
    }
    
    func testExample2() {
        XCTAssertEqual(solution.plusOne([4,3,2,1]), [4,3,2,2])
    }
    
    func testExample3() {
        XCTAssertEqual(solution.plusOne([9]), [1, 0])
    }
    
    func testExample4() {
        XCTAssertEqual(solution.plusOne([9, 9]), [1, 0, 0])
    }
}

TestRunner.runTests(Tests.self)
