//
//  DateFormatterHelperTests.swift
//  News AppTests
//
//  Created by Wildan Nafian on 9/24/24.
//

import XCTest
@testable import News_App

final class DateFormatterHelperTests: XCTestCase {

    private var sut: DateFormatterHelper!

    override func setUpWithError() throws {
        sut = DateFormatterHelper()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testFormatDate_whenInputValid() throws {
        let expected = "24 September 2024 | 07:26:10"
        let result = sut.formatDate(input: "2024-09-24T00:26:10Z")

        XCTAssertEqual(expected, result)
    }

    func testFormatDate_whenInputInvalid() throws {
        let expected = ""
        let result = sut.formatDate(input: "sdasf10Z")

        XCTAssertEqual(expected, result)
    }

    func testPerformanceExample() throws {
        self.measure {
            _ = sut.formatDate(input: "2024-09-24T00:26:10Z")
        }
    }

}
