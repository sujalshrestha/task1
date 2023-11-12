//
//  ExtraView.swift
//  Task1
//
//  Created by sujal on 09/11/2023.
//

import SwiftUI
import Charts

struct HistoryView: View {
    @State private var isDailySelected = true
    @State private var bars = Bar.generateMockBars()
    @State private var selectedID: UUID = UUID()
    @State private var text = "Info"
    
    var body: some View {
        ScrollView {
            ZStack{
                //MARK: Ellipse Radient View
                RadientEllipseView()
                    .offset(x:0, y: -554)
                
                VStack(spacing: 0) {
                    //MARK: Title Tab Section
                    TitleTabSectionView(isDailySelected: $isDailySelected)
                        .padding(.bottom, 24)
                    
                    //MARK: Date picker
                    DatePickerSectionView()
                        .padding(.bottom, 24)
                    
                    //MARK: Detail Board
                    DetailBoardSectionView()
                        .padding(.bottom, 32)
                    
                    //MARK: Stack Bar chart
                    StackBarChartSectionView(bars: $bars, selectedID: $selectedID)
                        .padding(.horizontal, 24)
                        .padding(.bottom, 40)
                    
                    //MARK: Donut Chart
                    DonutChartSectionView().padding(.bottom, 32).padding(.horizontal, 24)
                }
            }
        }
        
    }
}

struct TitleTabSectionView: View {
    @Binding var isDailySelected: Bool
    
    var body: some View {
        VStack {
            HStack(spacing: 80) {
                Button(action: {
                    isDailySelected = true
                }, label: {
                    Text("Daily Stats".uppercased())
                        .font(.custom("GraphikSuper", size: 12))
                        .foregroundColor(Color.white)
                        .opacity(isDailySelected ? 1 : 0.7)
                })
                
                Button(action: {
                    isDailySelected = false
                }, label: {
                    Text("Weekly Stats".uppercased())
                        .foregroundColor(Color.white)
                        .font(.custom("GraphikSemibold", size: 12))
                        .opacity(!isDailySelected ? 1 : 0.7)
                })
            }.padding(.bottom, 20)
            
            DuotoneLineView()
                .overlay(
                    Rectangle()
                        .fill(Color("MainColor"))
                        .frame(width: 32, height:2)
                        .padding(.bottom, 0)
                        .offset(x: isDailySelected ? 140 : 300, y: 0),
                    alignment: .bottomLeading
                )
        }.padding(.bottom, 24)
    }
}

struct DatePickerSectionView: View {
    var body: some View {
        HStack(spacing: 0) {
            Button {
            } label: {
                Image("icn_left")
                    .frame(width: 20, height: 20)
            }
            
            Button {
            } label: {
                Text("Feb 15 - Feb 22")
                    .font(.custom("GraphikMedium", size: 14))
                    .foregroundColor(Color.white)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 13)
                    .overlay(
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(Color("BorderColor"), lineWidth: 1)
                            .frame(width: 142, height: 40))
                
            }.padding(.horizontal, 12)
            
            Button {
            } label: {
                Image("icn_right")
                    .frame(width: 20, height: 20)
            }
        }
    }
}

struct DetailBoardSectionView: View {
    var body: some View {
        HStack(spacing: 24){
            SubDetailView(value: "32", text: "Score Managed")
            SubDetailView(value: "8%", text: "Time Remaining")
            SubDetailView(value: "26", text: "Pillow      Moves")
        }
    }
}

struct StackBarChartSectionView: View {
    @Binding var bars: [Bar]
    @Binding var selectedID: UUID
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ZStack{
                //MARK: Line dividers
                VStack(alignment: .leading, spacing: 0){
                    Rectangle()
                        .foregroundColor(Color(hex: "F3F2EE"))
                        .frame(height: 0.5)
                        .offset(y: -135)
                        .opacity(0.15)
                    Rectangle()
                        .foregroundColor(Color(hex: "F3F2EE"))
                        .frame(height: 0.5)
                        .offset(y: -90)
                        .opacity(0.25)
                    Rectangle()
                        .foregroundColor(Color(hex: "F3F2EE"))
                        .frame(height: 0.5)
                        .offset(y: -45)
                        .opacity(0.15)
                    Rectangle()
                        .foregroundColor(Color(hex: "F3F2EE"))
                        .frame(height: 0.5)
                        .offset(y: 3)
                        .opacity(0.25)
                    Rectangle()
                        .foregroundColor(Color(hex: "F3F2EE"))
                        .frame(height: 0.5)
                        .offset(y: 45)
                        .opacity(0.15)
                }.padding(.horizontal, 48)
                
                HStack(alignment: .bottom, spacing: 24){
                    //MARK: Right Index
                    VStack(alignment: .leading, spacing: 27) {
                        ForEach([2.5, 2.0, 1.5, 1.0, 0.5], id: \.self) { value in
                            HStack(spacing: 0) {
                                Text(String(format: "%.1f", value))
                                    .foregroundColor(.white)
                            }
                        }
                        Text("Day")
                            .font(.custom("GraphikMedium", size: 12))
                            .foregroundColor(.white)
                    }
                    
                    //MARK: Bar Chart
                    ForEach(bars) { bar in
                        VStack {
                            VStack(spacing: 2) {
                                
                                //MARK: severe
                                Rectangle()
                                    .foregroundColor(Color(hex: "937EE5"))
                                    .frame(width: 8, height: bar.severeValue, alignment: .bottom)
                                    .cornerRadius(4, corners: [.topRight, .topLeft])
                                    .onTapGesture {
                                        self.selectedID = bar.id
                                    }
                                
                                //MARK: Loud
                                Rectangle()
                                    .foregroundColor(Color(hex: "6D82F2"))
                                    .frame(width: 8, height: bar.loudValue, alignment: .bottom)
                                    .cornerRadius(bar.severeValue == 0  ? 4 : 0, corners: [.topRight, .topLeft])
                                    .onTapGesture {
                                        self.selectedID = bar.id
                                    }
                                
                                //MARK: Light
                                Rectangle()
                                    .foregroundColor(Color(hex: "73AEE5"))
                                    .frame(width: 8, height: bar.lightValue, alignment: .bottom)
                                    .cornerRadius(bar.loudValue == 0  ? 4 : 0, corners: [.topRight, .topLeft])
                                    .onTapGesture {
                                        self.selectedID = bar.id
                                    }
                                
                                //MARK: Quiet
                                Rectangle()
                                    .foregroundColor(Color(hex: "8FCCCC"))
                                    .frame(width: 8, height: bar.quietValue, alignment: .bottom)
                                    .cornerRadius(bar.lightValue == 0  ? 4 : 0, corners: [.topRight, .topLeft])
                                    .onTapGesture {
                                        self.selectedID = bar.id
                                    }
                            }.overlay(
                                LinearGradient(
                                    gradient: Gradient(colors: [
                                        Color.clear,
                                        Color.white.opacity(selectedID == bar.id ? 0.1 : 0)
                                    ]),
                                    startPoint: .top,
                                    endPoint: .bottom
                                )
                                .frame(width: 40)
                            )
                            
                            .padding(.bottom, 14)
                            
                            Text(bar.day)
                                .font(.custom("GraphikMedium", size: 12))
                                .foregroundColor(Color.white)
                        }
                    }
                }.padding(.horizontal, 0)
            }
            .overlay {
                Rectangle()
                    .foregroundColor(Color(hex: "F3F2EE"))
                    .frame(height: 0.5)
                    .offset(y: 94)
                    .opacity(0.70)
                    .padding(.horizontal, 48)
            }
            .padding(.bottom, 32)
            
            //MARK: Indicator detail
            HStack(spacing: 0){
                CustomLabelView(title: "Quiet", hexColor: "8FCCCC", minValue: "34")
                CustomLabelView(title: "Light",  hexColor: "73AEE5", minValue: "48")
                CustomLabelView(title: "Loud",  hexColor: "6D82F2", hourValue: "1", minValue: "2")
                CustomLabelView(title: "Severe",  hexColor: "937EE5", minValue: "26")
            }.frame(height: 45)
                .padding(.horizontal, 28)
        }
    }
}

struct DonutChartSectionView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 0) {
                Text("Snoring")
                    .frame(alignment: .leading)
                    .font(.custom("ProductSans-Bold", size: 24))
                    .foregroundColor(Color(hex: "F3F2EE"))
                    .padding(.leading, 48)
                    .padding(.bottom, 16)
                
                Spacer()
                
                Image("icn_upArrow")
                    .resizable()
                    .frame(width: 10, height: 10)
                    .offset(y: -3)
                    .padding(.trailing, 3)
                Text("2% ")
                    .frame(alignment: .leading)
                    .font(.custom("GraphikMedium", size: 14))
                    .foregroundColor(Color(hex: "E55C75"))
                
                Text("Last week")
                    .font(.custom("GraphikMedium", size: 14))
                    .foregroundColor(Color(hex: "F3F2EE"))
                    .padding(.trailing, 48)
            }
            
            HStack(spacing: 0) {
                ZStack{
                    Chart(chartData) { item in
                        SectorMark(angle: .value("Label", item),
                                   innerRadius: .ratio(0.80),
                                   angularInset: 1)
                        .foregroundStyle(item.color)
                    }.padding(.leading, 24)
                    
                    VStack{
                        HStack(spacing: 0) {
                            Text("12")
                                .font(.custom("ProductSans-Medium", size: 24))
                                .foregroundColor(Color(hex: "F3F2EE"))
                            Text("h")
                                .font(.custom("ProductSans-Medium", size: 20))
                                .foregroundColor(Color(hex: "F3F2EE"))
                                .opacity(0.7)
                            Text("36")
                                .font(.custom("ProductSans-Medium", size: 24))
                                .foregroundColor(Color(hex: "F3F2EE"))
                            Text("m")
                                .font(.custom("ProductSans-Medium", size: 20))
                                .foregroundColor(Color(hex: "F3F2EE"))
                                .opacity(0.7)
                        }
                        
                        Text("Weekly Total")
                            .font(.custom("GraphikSemibold", size: 20))
                            .foregroundColor(.white)
                    }
                    .padding(.leading, 24)
                }
                
                VStack {
                    HStack(spacing:0) {
                        CustomLabelView(title: "Quiet", hexColor: "8FCCCC", hourValue: "1", minValue: "48")
                        
                        CustomLabelView(title: "Light", hexColor: "73AEE5", hourValue: "5", minValue: "22")
                    }
                    HStack(spacing:0) {
                        CustomLabelView(title: "Loud", hexColor: "6D82F2", hourValue: "2", minValue: "36")
                        CustomLabelView(title: "Severe", hexColor: "937EE5", hourValue: "2", minValue: "15")
                    }
                }
            }
            .padding(.horizontal, 28)
        }
    }
}


