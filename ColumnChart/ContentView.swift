//
//  ContentView.swift
//  ColumnChart
//
//  Created by Dr. Simon Bogutzky.
//

import SwiftUI

struct ContentView: View {
    
    @State var pickerSelection = 0
    var viewModels = [
        ColumnChartViewModel(columns: [Column(key: "mon", value: 120.0), Column(key: "tue", value: 160.0), Column(key: "wed", value: 100.0), Column(key: "thu", value: 80.0), Column(key: "fri", value: 80.0), Column(key: "sat", value: 100.0), Column(key: "sun", value: 0.0)], yAxisUnit: "kcal"),
        ColumnChartViewModel(columns: [Column(key: "jan", value: 2000.0), Column(key: "feb", value: 2300.0), Column(key: "mar", value: 1800.0), Column(key: "apr", value: 1900.0), Column(key: "may", value: 1300.0), Column(key: "jun", value: 1900.0), Column(key: "jul", value: 2000.0), Column(key: "aug", value: 2100.0), Column(key: "sep", value: 2100.0), Column(key: "oct", value: 2200.0), Column(key: "nov", value: 2200.0), Column(key: "dec", value: 1300.0)], yAxisUnit: "kcal")
    ]
    
    var body: some View {
        VStack {
            Picker(selection: $pickerSelection, label: Text(LocalizedStringKey("selection"))) {
                Text(LocalizedStringKey("weekly_balance")).tag(0)
                Text(LocalizedStringKey("annual_balance")).tag(1)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.horizontal, 10)
            
            ColumnChartView(viewModel: viewModels[self.pickerSelection])
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}