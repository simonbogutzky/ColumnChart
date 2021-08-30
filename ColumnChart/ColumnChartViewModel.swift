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
    
    var foregroundColor: Color = .blue
    var backgroundColor: Color = .blue
    var textColor: Color = .black
    var cornerRadius = 0.0
    var yAxisUnit: String
    
    private let defaultColumnCount = 7.0
    private let defaultColumnWidth = 30.0
    
    // MARK: Initializer
    init(columns: [Column], yAxisUnit: String, foregroundColor: Color = .blue, backgroundColor: Color = .white, textColor: Color = .black, cornerRadius: Double = 0.0) {
        self.columns = columns
        self.yAxisUnit = yAxisUnit
        self.foregroundColor = foregroundColor
        self.backgroundColor = backgroundColor
        self.textColor = textColor
        self.cornerRadius = cornerRadius
        
        guard columns.count != 0 else {
            self.columnMaxValue = 0.0
            self.columnWidth = defaultColumnWidth
            return
        }
        
        computeColumnMaxValue()
        computeColumnWidth()
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
}
