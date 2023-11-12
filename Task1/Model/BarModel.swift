//
//  TypShapeModel.swift
//  Task1
//
//  Created by sujal on 10/11/2023.
//

import Charts
import SwiftUI

struct Bar: Identifiable {
    let id = UUID()
    var day: String
    var quietValue: Double
    var lightValue: Double
    var loudValue: Double
    var severeValue: Double

    static func generateMockBars() -> [Bar] {
        var tempBars = [Bar]()
        let days = ["Thu", "Fri", "Sat", "Sun", "Mon", "Tues", "Wed"]

        for day in days {
            let quiet = Double.random(in: 0...50)
            let light = Double.random(in: 0...50)
            let loud = Double.random(in: 0...50)
            let severe = Double.random(in: 0...50)

            let bar = Bar(day: day, quietValue: quiet, lightValue: light, loudValue: loud, severeValue: severe)
            tempBars.append(bar)
        }
        return tempBars
    }
}

public struct PieChartData: Identifiable, Plottable {
    public var id = UUID()
    public let primitivePlottable: Int
    let color: Color
    
    public init?(primitivePlottable: PrimitivePlottable) {
        self.primitivePlottable = primitivePlottable
        self.color = .blue
    }
    
    public init?(primitivePlottable: PrimitivePlottable, color: Color) {
        self.primitivePlottable = primitivePlottable
        self.color = color
    }
}

public let chartData: [PieChartData] = [
    .init(primitivePlottable: 12, color: Color(hex: "8FCCCC")),
    .init(primitivePlottable: 16, color: Color(hex:  "73AEE5")),
    .init(primitivePlottable: 23, color: Color(hex: "6D82F2")),
    .init(primitivePlottable: 12, color: Color(hex: "937EE5"))
].compactMap({$0})
