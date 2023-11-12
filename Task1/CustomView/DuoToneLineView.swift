//
//  DuoToneLineView.swift
//  Task1
//
//  Created by sujal on 10/11/2023.
//

import SwiftUI

struct DuotoneLineView: View {
    var body: some View {
        let duotoneColor1 = Color(hex: "937EE5").opacity(0.1)
        let duotoneColor2 = Color(hex: "6D82F2").opacity(0.1)
        
        LinearGradient(gradient: Gradient(colors: [duotoneColor1, duotoneColor2]), startPoint: .leading, endPoint: .trailing)
            .mask(
                Rectangle()
            )
            .frame(height: 1)
    }
}
