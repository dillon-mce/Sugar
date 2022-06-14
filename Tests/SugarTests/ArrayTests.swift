//
//  ArrayTests.swift
//  
//
//  Created by Dillon McElhinney on 6/13/22.
//

import Sugar
import XCTest

final class ArrayTests: XCTestCase {

    private var sut: [Int] = []

    override func setUp() {
        sut = []
    }

    func test_SafeSubscript_ValidIndex() {
        // given
        let expectedResult = 0
        sut.append(contentsOf: (expectedResult..<10))

        // when
        let result = sut[safe: 0]

        // then
        XCTAssertEqual(expectedResult, result)
    }

    func test_SafeSubscript_InvalidIndex() {
        // given
        let invalidIndex = 10
        sut.append(contentsOf: (0..<invalidIndex))

        // when
        let result = sut[safe: invalidIndex]

        // then
        XCTAssertNil(result)
    }
}
