//
//  ColumnChartView.swift
//  ColumnChart
//
//  Created by Dr. Simon Bogutzky.
//

import SwiftUI

struct ColumnChartView: View {
    
    // MARK: Properties
    @ObservedObject var viewModel: ColumnChartViewModel
    
    var body: some View {
        ZStack(alignment: .top) {
            HStack(alignment: .center, spacing: 10) {
                ForEach(viewModel.columns, id: \.self) { column in
                    VStack {
                        ColumnView(value: CGFloat(column.value), maxValue: CGFloat(viewModel.columnMaxValue), columnWidth: CGFloat(viewModel.columnWidth))
                        Text(LocalizedStringKey(column.key)).lineLimit(1)
                    }
                }
            }
        }
    }
}

struct ColumnChartView_Previews: PreviewProvider {
    static var viewModel = ColumnChartViewModel(columns: [Column(key: "mon", value: 120.0), Column(key: "tue", value: 160.0), Column(key: "wed", value: 100.0), Column(key: "thu", value: 80.0), Column(key: "fri", value: 80.0), Column(key: "sat", value: 100.0), Column(key: "sun", value: 0.0)], yAxisUnit: "kcal")
    
    static var previews: some View {
        ColumnChartView(viewModel: viewModel)
    }
}
