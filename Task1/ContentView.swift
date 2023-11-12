//
//  ContentView.swift
//  Task1
//
//  Created by sujal on 08/11/2023.
//

import SwiftUI
import Charts

struct ContentView: View {
    
    var body: some View {
        TabView() {
            // Tab 1
            Text("Tab 1 Content")
                .tabItem {
                    VStack{
                        Image("icn_home")
                            .renderingMode(.template)
                        Text("Home")
                    }.opacity(0.4)
                }
            
            // Tab 2
            Text("Tab 2 Content")
                .tabItem {
                    VStack{
                        Image("icn_night")
                            .renderingMode(.template)
                        Text("Tracker")
                    }.opacity(0.4)
                }
            
            HistoryView()
                .tabItem {
                    VStack{
                        Image( "icn_chart")
                            .renderingMode(.template)
                        Text("History")
                    }
                }  .background(Color("AppPrimaryColor"))
            
            // Tab 3
            Text("Tab 4 Content")
                .tabItem {
                    VStack{
                        Image("icn_user")
                            .renderingMode(.template)
                        Text("Setting")
                    }.opacity(0.4)
                }
        }
        .accentColor(Color(hex:"F3F2EE"))
    }
}

#Preview {
    ContentView()
}
