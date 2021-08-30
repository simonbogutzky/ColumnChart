//
//  ColumnChartViewModelTest.swift
//  ColumnChartTests
//
//  Created by Dr. Simon Bogutzky.
//

import XCTest
@testable import ColumnChart

class ColumnChartViewModelTest: XCTestCase {

    func testInitWithEmptyColumnsArray() throws {
        // given
        let sut = ColumnChartViewModel(columns: [], yAxisUnit: "kcal")
        
        // then
        XCTAssertEqual(sut.columnWidth, 30.0)
    }
    
    func testInit() throws {
        // given
        let sut = ColumnChartViewModel(columns: [Column(key: "mon", value: 120.0), Column(key: "tue", value: 160.0), Column(key: "wed", value: 100.0), Column(key: "thu", value: 80.0), Column(key: "fri", value: 80.0), Column(key: "sat", value: 100.0), Column(key: "sun", value: 0.0)], yAxisUnit: "kcal")
        
        // then
        XCTAssertEqual(sut.columnMaxValue, 160.0)
    }
}
