//
//  AxisHelperTests.swift
//  ColumnChartTests
//
//  Created by Dr. Simon Bogutzky.
//

import XCTest
@testable import ColumnChart

class AxisHelperTests: XCTestCase {

    // MARK: Properties
    private let sut = AxisHelper()
    private let minValue = 0.0
    
    // MARK: Tests
    func testComputeAxisValuesGivenMaxValue0() throws {
        // given
        let maxValue = 0.0
        let expected = [0.0, 1.0]
        
        // when
        let axisValues = sut.computeAxisValues(min: minValue, max: maxValue)
        
        // then
        XCTAssertEqual(expected, axisValues)
    }
    
    func testComputeAxisValuesGivenMaxValue1() throws {
        // given
        let maxValue = 1.0
        let expected = [0.0, 1.0]
        
        // when
        let axisValues = sut.computeAxisValues(min: minValue, max: maxValue)
        
        // then
        XCTAssertEqual(expected, axisValues)
    }
    
    func testComputeAxisValuesGivenMaxValue2() throws {
        // given
        let maxValue = 2.0
        let expected = [0.0, 1.0, 2.0]
        
        // when
        let axisValues = sut.computeAxisValues(min: minValue, max: maxValue)
        
        // then
        XCTAssertEqual(expected, axisValues)
    }
    
    func testComputeAxisValuesGivenMaxValue3() throws {
        // given
        let maxValue = 3.0
        let expected = [0.0, 1.0, 2.0, 3.0]
        
        // when
        let axisValues = sut.computeAxisValues(min: minValue, max: maxValue)
        
        // then
        XCTAssertEqual(expected, axisValues)
    }
    
    func testComputeAxisValuesGivenMaxValue4() throws {
        // given
        let maxValue = 4.0
        let expected = [0.0, 1.0, 2.0, 3.0, 4.0]
        
        // when
        let axisValues = sut.computeAxisValues(min: minValue, max: maxValue)
        
        // then
        XCTAssertEqual(expected, axisValues)
    }
    
    func testComputeAxisValuesGivenMaxValue5() throws {
        // given
        let maxValue = 5.0
        let expected = [0.0, 1.0, 2.0, 3.0, 4.0, 5.0]
        
        // when
        let axisValues = sut.computeAxisValues(min: minValue, max: maxValue)
        
        // then
        XCTAssertEqual(expected, axisValues)
    }
    
    func testComputeAxisValuesGivenMaxValue6() throws {
        // given
        let maxValue = 6.0
        let expected = [0.0, 2.0, 4.0, 6.0]
        
        // when
        let axisValues = sut.computeAxisValues(min: minValue, max: maxValue)
        
        // then
        XCTAssertEqual(expected, axisValues)
    }
    
    func testComputeAxisValuesGivenMaxValue7() throws {
        // given
        let maxValue = 7.0
        let expected = [0.0, 2.0, 4.0, 6.0, 8.0]
        
        // when
        let axisValues = sut.computeAxisValues(min: minValue, max: maxValue)
        
        // then
        XCTAssertEqual(expected, axisValues)
    }
    
    func testComputeAxisValuesGivenMaxValue8() throws {
        // given
        let maxValue = 8.0
        let expected = [0.0, 2.0, 4.0, 6.0, 8.0]
        
        // when
        let axisValues = sut.computeAxisValues(min: minValue, max: maxValue)
        
        // then
        XCTAssertEqual(expected, axisValues)
    }
    
    func testComputeAxisValuesGivenMaxValue44() throws {
        // given
        let maxValue = 44.0
        let expected = [0.0, 10.0, 20.0, 30.0, 40.0]
        
        // when
        let axisValues = sut.computeAxisValues(min: minValue, max: maxValue)
        
        // then
        XCTAssertEqual(expected, axisValues)
    }
    
    func testComputeAxisValuesGivenMaxValue45() throws {
        // given
        let maxValue = 45.0
        let expected = [0.0, 10.0, 20.0, 30.0, 40.0, 50.0]
        
        // when
        let axisValues = sut.computeAxisValues(min: minValue, max: maxValue)
        
        // then
        XCTAssertEqual(expected, axisValues)
    }
}
