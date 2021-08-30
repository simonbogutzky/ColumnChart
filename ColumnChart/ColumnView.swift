//
//  ColumnView.swift
//  ColumnChart
//
//  Created by Dr. Simon Bogutzky.
//

import SwiftUI

struct ColumnView: View{

    // MARK: Properties
    var value: CGFloat
    var maxValue: CGFloat
    var columnWidth: CGFloat = 30.0
    var cornerRadius: CGFloat = 0.0
    var foregroundColor: Color = .blue
    var backgroundColor: Color = .white
    
    var body: some View {
        VStack {
            ZStack (alignment: .bottom) {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .frame(width: columnWidth, height: 200).foregroundColor(backgroundColor)
                RoundedRectangle(cornerRadius: cornerRadius)
                    .frame(width: columnWidth, height: (value / maxValue * 200.0)).foregroundColor(foregroundColor)
            }
        }
    }
}

struct ColumnView_Previews: PreviewProvider {
    static var previews: some View {
        ColumnView(value: 60.0, maxValue: 100.0, cornerRadius: 5.0)
    }
}
