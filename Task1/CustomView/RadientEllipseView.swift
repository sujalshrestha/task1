//
//  RadientEllipseView.swift
//  Task1
//
//  Created by sujal on 11/11/2023.
//

import SwiftUI

struct RadientEllipseView: View {
    var body: some View {
        RadialGradient(gradient: Gradient(colors: [ Color(hex: "7ACCCC").opacity(1), Color(hex: "5CA3E5").opacity(0.00), Color(hex: "556EF2").opacity(0.00), Color(hex: "8167E5").opacity(0.00)]),
                       center: .center,
                       startRadius: 20,
                       endRadius: 600)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .opacity(0.3)
    }
}
