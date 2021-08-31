//
//  YAxisLabel.swift
//  ColumnChart
//
//  Created by Dr. Simon Bogutzky.
//

import SwiftUI

struct YAxisLabel: Hashable {
    static func == (lhs: YAxisLabel, rhs: YAxisLabel) -> Bool {
        lhs.value == rhs.value
    }
    
    var value: Double
    var paddingFromTop: Double
    var lineColor: Color
}
