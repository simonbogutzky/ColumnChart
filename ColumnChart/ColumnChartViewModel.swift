//
//  ColumnChartViewModel.swift
//  ColumnChart
//
//  Created by Dr. Simon Bogutzky.
//

import SwiftUI

class ColumnChartViewModel: ObservableObject {
    
    // MARK: Properties
    @Published var columns: [Column]
    @Published var columnWidth: Double!
    @Published var columnMaxValue: Double!
    @Published var yAxisLabels: [YAxisLabel]
    
    var maxColumnHeight: Double {
        _maxColumnHeight
    }
    var foregroundColor: Color = .blue
    var backgroundColor: Color = .blue
    var textColor: Color = .black
    var cornerRadius = 0.0
    var yAxisUnit: String
    var axisLineColor: Color = .black
    var zeroAxisLineColor: Color = .red
    
    private let defaultColumnCount = 7.0
    private let defaultColumnWidth = 30.0
    private var _maxColumnHeight = 200.0
    
    // MARK: Initializer
    init(columns: [Column], yAxisUnit: String, foregroundColor: Color = .blue, backgroundColor: Color = .white, textColor: Color = .black, cornerRadius: Double = 0.0, zeroAxisLineColor: Color = .red, axisLineColor: Color = .black, viewHeight: Double = 220.0) {
        self.columns = columns
        self.yAxisUnit = yAxisUnit
        self.foregroundColor = foregroundColor
        self.backgroundColor = backgroundColor
        self.textColor = textColor
        self.cornerRadius = cornerRadius
        self.yAxisLabels = []
        self.zeroAxisLineColor = zeroAxisLineColor
        self.axisLineColor = axisLineColor
        self._maxColumnHeight = viewHeight - 20.0
        
        guard columns.count != 0 else {
            self.columnMaxValue = 0.0
            self.columnWidth = defaultColumnWidth
            return
        }
        
        computeColumnMaxValue()
        computeColumnWidth()
        computeAxisLabels()
    }
    
    // MARK: Methods
    private func computeColumnMaxValue() {
        self.columnMaxValue = columns.map {
            $0.value
        }.max()
    }
    
    private func computeColumnWidth() {
        self.columnWidth = defaultColumnCount / Double(columns.count) * defaultColumnWidth
    }
    
    private func computeAxisLabels() {
        let axisHelper = AxisHelper()
        let axisValues = axisHelper.computeAxisValues(min: 0, max: self.columnMaxValue)
        
        let maxAxisValue = axisValues.max()!
        let minAxisValue = axisValues.min()!
        let factor = maxColumnHeight / maxAxisValue
        
        yAxisLabels.removeAll()
        
        for axisValue in axisValues {
            let lineColor = axisValue == minAxisValue ? self.zeroAxisLineColor : self.axisLineColor
            yAxisLabels.append(YAxisLabel(value: axisValue, paddingFromTop: abs(axisValue * factor - maxColumnHeight) - 5, lineColor: lineColor))
        }
    }
}
