/*
 Write a function checking that the given string is valid. We consider a string
 to be valid if all the characters of the string have exactly the same frequency.

 Examples:
 "aaaaaaaaa" O(n)
 "aabbcc" is a valid string
 "aabbccc" is an invalid string
 "" is a valid

 Check if the string is valid as it is (same condition as before) or if one character
 at one position can be removed from the string so it will become valid.
 "aabbcc" is a valid string
 "aabbccc" is an valid string
*/

class Solution {
    func checkStringIsValid(
        _ string: String,
        droppedCount: Int = 1
    ) -> Bool {
        var droppedCount = droppedCount
        let frequencyCharacters = string.frequency
        var frequencyNumbers = frequencyCharacters.values.frequency
        var keys = Array(frequencyNumbers.keys).sorted(by: >)
        while frequencyNumbers.count > 1 && droppedCount >= 0 {
            let larger = keys[0]
            let smaller = keys[1]
            
            let largerToSmallerCost = (larger - smaller) * frequencyNumbers[larger]!
            let smallerToZeroCost = smaller * frequencyNumbers[smaller]!
            droppedCount -= min(largerToSmallerCost, smallerToZeroCost)
            if largerToSmallerCost < smallerToZeroCost {
                frequencyNumbers[smaller] = frequencyNumbers[smaller]! + frequencyNumbers[larger]!
                frequencyNumbers[larger] = nil
                keys.remove(at: 0)
            } else {
                frequencyNumbers[smaller] = nil
                keys.remove(at: 1)
            }
        }
        return frequencyNumbers.count <= 1 && droppedCount >= 0
    }
}

extension Sequence where Element: Hashable {
    var frequency: [Element: Int] {
        var result: [Element: Int] = [:]
        forEach { frequency in
            result[frequency] = (result[frequency] ?? 0) + 1
        }
        return result
    }
}

import XCTest

class Tests: XCTestCase {
    let solution = Solution()

    func testExample1() {
        // Для одного удаления
        // TRUE
        XCTAssertTrue(solution.checkStringIsValid(""))
        XCTAssertTrue(solution.checkStringIsValid("a"))
        XCTAssertTrue(solution.checkStringIsValid("aabb"))
        XCTAssertTrue(solution.checkStringIsValid("abc"))

        // Сокращаем наидлиннейшую
        XCTAssertTrue(solution.checkStringIsValid("aaabb"))
        XCTAssertTrue(solution.checkStringIsValid("aabbb"))
        XCTAssertTrue(solution.checkStringIsValid("aabbbcc"))

        // Сокращаем самую короткую
        XCTAssertTrue(solution.checkStringIsValid("abbbccc"))
        XCTAssertTrue(solution.checkStringIsValid("aaabccc"))
        XCTAssertTrue(solution.checkStringIsValid("aaabbbc"))

        // FALSE
        XCTAssertFalse(solution.checkStringIsValid("aaaabb"))
        XCTAssertFalse(solution.checkStringIsValid("aabbbb"))
        XCTAssertFalse(solution.checkStringIsValid("aaaabbbbcc"))
        XCTAssertFalse(solution.checkStringIsValid("abbbc"))
        XCTAssertFalse(solution.checkStringIsValid("aaabcdefg"))

        // Для двух удалений
        // TRUE
        XCTAssertTrue(solution.checkStringIsValid("aaaabb", droppedCount: 2))
        XCTAssertTrue(solution.checkStringIsValid("aabbbb", droppedCount: 2))
        XCTAssertTrue(solution.checkStringIsValid("aaaabbbbcc", droppedCount: 2))
        XCTAssertTrue(solution.checkStringIsValid("aaaabbbbccc", droppedCount: 2))

        XCTAssertTrue(solution.checkStringIsValid("abbbc", droppedCount: 2))
        XCTAssertTrue(solution.checkStringIsValid("aaabcdefg", droppedCount: 2))
        XCTAssertTrue(solution.checkStringIsValid("aabbcdefg", droppedCount: 2))


        XCTAssertFalse(solution.checkStringIsValid("aaabbcdefg", droppedCount: 2))
    }
}

TestRunner.runTests(Tests.self)
