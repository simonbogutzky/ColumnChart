//
//  AxisHelper.swift
//  ColumnChart
//
//  Created by Dr. Simon Bogutzky.
//

import Foundation

struct AxisHelper {
    
    // MARK: Methods
    func computeAxisValues(min: Double, max: Double) -> [Double] {
        let labelCount = 4
        let granularity = 1.0
        
        let range = abs(min - max)
        if range <= 0 {
            return [0.0, 1.0]
        }
        
        let rawInterval = range / Double(labelCount)
        var interval = roundToNextSignificant(number: rawInterval)
        interval = interval < granularity ? granularity : interval
        
        let intervalMagnitude = roundToNextSignificant(number: pow(10, log10(interval)))
        let intervalSigDigit = Int(interval / intervalMagnitude)
        if (intervalSigDigit > 5) {
            interval = floor(10.0 * intervalMagnitude) == 0.0 ? interval : floor(10.0 * intervalMagnitude)
        }
        
        let first = interval == 0.0 ? 0.0 : ceil(min / interval) * interval
        let last = interval == 0.0 ? 0.0 : round(max / interval) * interval
        
        var f = first
        var n = 0
        if (interval != 0.0 && last != first) {
            while f <= last {
                n += 1
                f += interval
            }
        } else if (last == first && n == 0) {
            n = 1
        }
        
        var values = [Double](repeating: 0.0, count: n)
        
        f = first
        var i = 0
        while i < n {
            values[i] = f
            f += interval
            i += 1
        }
        
        return values
    }
    
    func roundToNextSignificant(number: Double) -> Double {
        guard number != 0.0 else {
            return 0.0
        }
        let d = ceil(log10(number < 0 ? -number : number))
        let pw = 1 - d
        let magnitude = pow(10, pw)
        let shifted = round(number * magnitude)
        return shifted / magnitude
    }
}
