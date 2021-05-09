//
//  UIViewTests.swift
//  
//
//  Created by Dillon McElhinney on 5/9/21.
//

import Sugar
import UIKit
import XCTest

final class UIViewTests: XCTestCase {

    private var sut: UIView!

    override func setUp() {
        sut = UIView()
    }

    func test_AddSubviews_NoViews() {
        // given
        let originalCount = sut.subviews.count

        // when
        sut.addSubviews()

        // then
        XCTAssertEqual(originalCount, sut.subviews.count)
    }

    func test_AddSubviews_OneView() {
        // given
        let view1 = UIView()

        // when
        sut.addSubviews(view1)

        // then
        XCTAssertEqual([view1], sut.subviews.suffix(1))
    }

    func test_AddSubviews_TwoViews() {
        // given
        let view1 = UIView()
        let view2 = UIView()

        // when
        sut.addSubviews(view1, view2)

        // then
        XCTAssertEqual([view1, view2], sut.subviews.suffix(2))
        XCTAssertNotEqual([view2, view1], sut.subviews.suffix(2))
    }

}
