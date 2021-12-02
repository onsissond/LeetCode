/*
 https://leetcode.com/problems/search-insert-position/
 Given a sorted array of distinct integers and a target value, return the index if the target is found. If not, return the index where it would be if it were inserted in order.

 You must write an algorithm with O(log n) runtime complexity.
 */

class Solution {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        if nums.first! > target { return 0 }
        if nums.last! < target { return nums.count }
        return nums.searchIndex(
            target: target,
            leftIndex: 0,
            rightIndex: nums.count - 1
        )
    }
}

extension Array where Element == Int {
    func searchIndex(target: Int, leftIndex: Int, rightIndex: Int) -> Int {
        let middleIndex = leftIndex + (rightIndex - leftIndex) / 2
        if self[middleIndex] < target {
            if middleIndex + 1 > rightIndex { return middleIndex + 1 }
            return searchIndex(
                target: target,
                leftIndex: middleIndex + 1,
                rightIndex: rightIndex
            )
        } else if self[middleIndex] > target {
            if middleIndex - 1 < leftIndex { return leftIndex }
            return searchIndex(
                target: target,
                leftIndex: leftIndex,
                rightIndex: middleIndex - 1
            )
        }
        return middleIndex
    }
}
    
import XCTest

class Tests: XCTestCase {
    let solution = Solution()

    func testExample1() {
        XCTAssertEqual(solution.searchInsert([1,3,5,6], 5), 2)
    }
    
    func testExample2() {
        XCTAssertEqual(solution.searchInsert([1,3,5,6], 2), 1)
    }
    
    func testExample3() {
        XCTAssertEqual(solution.searchInsert([1,3,5,6], 7), 4)
    }
    
    func testExample4() {
        XCTAssertEqual(solution.searchInsert([1,3,5,6], 0), 0)
    }
    
    func testExample5() {
        XCTAssertEqual(solution.searchInsert([1], 0), 0)
    }
    
    func testExample6() {
        XCTAssertEqual(solution.searchInsert([-10, 0, 9], -9), 1)
    }
    
    func testExample7() {
        XCTAssertEqual(solution.searchInsert([-10, -9, 1, 8, 9], 9), 4)
    }
}

TestRunner.runTests(Tests.self)
