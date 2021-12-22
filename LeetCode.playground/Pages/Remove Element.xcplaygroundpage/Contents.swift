/*
 Given an integer array nums and an integer val, remove all occurrences of val in nums in-place. The relative order of the elements may be changed.
 Return k after placing the final result in the first k slots of nums.
 Do not allocate extra space for another array. You must do this by modifying the input array in-place with O(1) extra memory.
*/

class Solution {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        for index in stride(from: nums.count - 1, to: -1, by: -1) {
            if nums[index] == val { nums.remove(at: index) }
        }
        return nums.count
    }
}

import XCTest

class Tests: XCTestCase {
    let solution = Solution()

    func testExample1() {
        var array = [3,2,2,3]
        XCTAssertEqual(solution.removeElement(&array, 3), 2)
        XCTAssertEqual(array, [2, 2])
    }
    
    func testExample2() {
        var array = [0,1,2,2,3,0,4,2]
        XCTAssertEqual(solution.removeElement(&array, 2), 5)
        XCTAssertEqual(array, [0,1,3,0,4])
    }
    
    func testExample3() {
        var array: [Int] = []
        XCTAssertEqual(solution.removeElement(&array, 0), 0)
        XCTAssertEqual(array, [])
    }
}

TestRunner.runTests(Tests.self)
