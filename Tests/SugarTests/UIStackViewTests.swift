//
//  UIStackViewTests.swift
//  
//
//  Created by Dillon McElhinney on 5/9/21.
//

import Sugar
import UIKit
import XCTest

final class UIStackViewTests: XCTestCase {

    private var sut: UIStackView!

    override func setUp() {
        sut = UIStackView()
    }

    func test_AddArrangedSubviews_NoViews() {
        // given
        let originalCount = sut.arrangedSubviews.count

        // when
        sut.addArrangedSubviews()

        // then
        XCTAssertEqual(originalCount, sut.arrangedSubviews.count)
    }

    func test_AddArrangedSubviews_OneView() {
        // given
        let view1 = UIView()

        // when
        sut.addArrangedSubviews(view1)

        // then
        XCTAssertEqual([view1], sut.arrangedSubviews.suffix(1))
    }

    func test_AddArrangedSubviews_TwoViews() {
        // given
        let view1 = UIView()
        let view2 = UIView()

        // when
        sut.addArrangedSubviews(view1, view2)

        // then
        XCTAssertEqual([view1, view2], sut.arrangedSubviews.suffix(2))
        XCTAssertNotEqual([view2, view1], sut.arrangedSubviews.suffix(2))
    }
}
