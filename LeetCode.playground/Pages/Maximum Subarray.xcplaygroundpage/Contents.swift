/*
 Given an integer array nums, find the contiguous subarray (containing at least one number) which has the largest sum and return its sum.

 A subarray is a contiguous part of an array.
 */

class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        var maxSum = nums[0]
        var curSubArraySum = maxSum
        for num in nums.dropFirst() {
            curSubArraySum = max(curSubArraySum + num, num)
            maxSum = max(maxSum, curSubArraySum)
        }
        return maxSum
    }
}

import XCTest

class Tests: XCTestCase {
    let solution = Solution()

    func tests() {
        XCTAssertEqual(
            solution.maxSubArray([-2,1,-3,4,-1,2,1,-5,4]), 6
        )
        XCTAssertEqual(
            solution.maxSubArray([1]), 1
        )
        XCTAssertEqual(
            solution.maxSubArray([5,4,-1,7,8]), 23
        )
    }
}

TestRunner.runTests(Tests.self)
