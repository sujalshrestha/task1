//
//  SubDetailView.swift
//  Task1
//
//  Created by sujal on 10/11/2023.
//

import SwiftUI

struct SubDetailView: View {
    var value: String
    var text: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(value)
                .font(.custom("ProductSans-Medium", size: 24))
                .foregroundColor(.white)
            
            Text(text)
                .font(.custom("GraphikSemibold", size: 14))
                .foregroundColor(Color("SubTitleTextColor"))
                .lineLimit(2)
        }
        .frame(width: 98, height: 102)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Gradient(colors: [Color(hex: "937EE5").opacity(0.1),
                                          Color(hex: "6D82F2").opacity(0.1)]), lineWidth: 2)
        )
        .background(Color("BoxBgColor"))
        .cornerRadius(16)
    }
}
