//
//  CustomLabelView.swift
//  Task1
//
//  Created by sujal on 10/11/2023.
//

import SwiftUI

struct CustomLabelView: View {
    var title: String?
    var hexColor: String?
    var hourValue: String?
    var minValue: String?
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Circle()
                    .fill(Color(hex: hexColor ?? ""))
                    .frame(width: 8, height: 8)
                Text(title ?? "")
                    .font(.custom("GraphikMedium", size: 14))
                    .foregroundColor(Color(hex: "F3F2EE"))
            }
            
            HStack(spacing: 0) {
                if let hourValue = hourValue {
                    Text(hourValue)
                        .font(.custom("ProductSans-Medium", size: 24))
                        .foregroundColor(Color(hex: "F3F2EE"))
                    Text("h")
                        .font(.custom("ProductSans-Medium", size: 20))
                        .foregroundColor(Color(hex: "F3F2EE"))
                        .opacity(0.7)
                }
                
                if let minValue = minValue {
                    Text(minValue)
                        .font(.custom("ProductSans-Medium", size: 24))
                        .foregroundColor(Color(hex: "F3F2EE"))
                    Text("m")
                        .font(.custom("ProductSans-Medium", size: 20))
                        .foregroundColor(Color(hex: "F3F2EE"))
                        .opacity(0.7)
                }
            }
            .frame(width: 80)
        }
        .frame(width: 65, height: 45)
        .padding()
    }
}
