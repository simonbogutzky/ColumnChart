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
            HStack(alignment: .center, spacing: 8) {
                ForEach(viewModel.columns, id: \.self) { column in
                    VStack {
                        ColumnView(value: CGFloat(column.value), maxValue: CGFloat(viewModel.columnMaxValue), maxColumnHeight: CGFloat(viewModel.maxColumnHeight), columnWidth: CGFloat(viewModel.columnWidth), cornerRadius: CGFloat(viewModel.cornerRadius), foregroundColor: viewModel.foregroundColor, backgroundColor: viewModel.backgroundColor)
                        Text(LocalizedStringKey(column.key))
                            .foregroundColor(viewModel.textColor)
                            .font(.caption)
                            .lineLimit(1)
                    }
                }
            }.padding(.leading, 64)

            ForEach(viewModel.yAxisLabels, id: \.self) { label in
                HStack {
                    Text(String(format:" %0.0f %@", label.value, viewModel.yAxisUnit))
                        .foregroundColor(viewModel.textColor)
                        .font(.caption)
                        .lineLimit(1)
                        .frame(width: 64, height: 10, alignment: .trailing)
                    Rectangle()
                        .foregroundColor(label.lineColor)
                        .frame(height: 0.5, alignment: .leading)
                }.padding(.top, CGFloat(label.paddingFromTop))
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
