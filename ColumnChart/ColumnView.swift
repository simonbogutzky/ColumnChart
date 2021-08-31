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
    var maxColumnHeight: CGFloat = 200.0
    var columnWidth: CGFloat = 30.0
    var cornerRadius: CGFloat = 0.0
    var foregroundColor: Color = .blue
    var backgroundColor: Color = .white
    @State var columnHeight: CGFloat = 0.0
    
    var body: some View {
        VStack {
            ZStack (alignment: .bottom) {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .frame(width: columnWidth, height: maxColumnHeight).foregroundColor(backgroundColor)
                RoundedRectangle(cornerRadius: cornerRadius)
                    .frame(width: columnWidth, height: columnHeight)
                    .foregroundColor(foregroundColor)
            }
        }.onAppear{
            withAnimation(.easeOut(duration: 1.0)) {
                self.columnHeight = value / maxValue * maxColumnHeight
            }
        }
    }
}

struct ColumnView_Previews: PreviewProvider {
    static var previews: some View {
        ColumnView(value: 60.0, maxValue: 100.0, cornerRadius: 5.0)
    }
}
