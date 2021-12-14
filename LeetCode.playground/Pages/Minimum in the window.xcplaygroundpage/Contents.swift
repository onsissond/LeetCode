/*
 https://stepik.org/lesson/41233/step/6?unit=19817
 Задача из курса Stepic
*/

class Solution {
    func minimumInWindow(_ array: [Int], windowSize m: Int) -> [Int] {
        let queue = Queue<Int>(size: UInt(m))!
        for i in 0..<m {
            while queue.last > array[i] {
                queue.popLast()
            }
            queue.pushBack(array[i])
        }
        for i in m..<array.count {
            print(queue.first)
            while queue.last > array[i] {
                queue.popLast()
            }
            queue.pushBack(array[i])
        }
    }
}

struct Queue<T> {
    private var _array: [T?]
    private var _left = 0
    private var _right = 0
    
    init?(size: UInt) {
        guard size > 0 else { return nil }
        _array = [T?](repeating: nil, count: 64)
    }
    
    mutating func pushBack(_ element: T) {
        _array[_right] = element
        _right = (_right + 1) % _array.count
    }
    
    mutating func popFront() -> T {
        defer { _left = (_left + 1) % _array.count }
        return _array[_left]!
    }
    
    var last: T {
        _array[_right]!
    }
}

import XCTest

class Tests: XCTestCase {
    let solution = Solution()

    func testExample1() {
        XCTAssertEqual(
            solution.minimumInWindow(
                [5, 1, 3, 2, 4, 6, 1, 7, 3, 2, 8],
                windowSize: 3
            ),
                      [1, 1, 2, 2, 1, 1, 1, 2, 3]
        )
    }
}

TestRunner.runTests(Tests.self)
