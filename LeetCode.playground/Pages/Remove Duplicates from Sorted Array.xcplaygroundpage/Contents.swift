/*
 https://leetcode.com/problems/remove-duplicates-from-sorted-array/
 Given an integer array nums sorted in non-decreasing order, remove the duplicates in-place such that each unique element appears only once. The relative order of the elements should be kept the same.

 Since it is impossible to change the length of the array in some languages, you must instead have the result be placed in the first part of the array nums. More formally, if there are k elements after removing the duplicates, then the first k elements of nums should hold the final result. It does not matter what you leave beyond the first k elements.

 Return k after placing the final result in the first k slots of nums.

 Do not allocate extra space for another array. You must do this by modifying the input array in-place with O(1) extra memory.
 */

class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        var i = nums.count - 1
        while i > 0 {
            if nums[i] == nums[i - 1] { nums.remove(at: i) }
            i -= 1
        }
        return nums.count
    }
}

import XCTest

class Tests: XCTestCase {
    let solution = Solution()

    func testExample1() {
        var array = [1,1,2]
        XCTAssertEqual(solution.removeDuplicates(&array), 2)
        XCTAssertEqual(array, [1,2])
    }
    
    func testExample2() {
        var array = [0,0,1,1,1,2,2,3,3,4]
        XCTAssertEqual(solution.removeDuplicates(&array), 5)
        XCTAssertEqual(array, [0,1,2,3,4])
    }
    
    func testExample3() {
        var array = [1]
        XCTAssertEqual(solution.removeDuplicates(&array), 1)
        XCTAssertEqual(array, [1])
    }
    
    func testExample4() {
        var array: [Int] = []
        XCTAssertEqual(solution.removeDuplicates(&array), 0)
        XCTAssertEqual(array, [])
    }
}

TestRunner.runTests(Tests.self)
