//
//  Task1App.swift
//  Task1
//
//  Created by sujal on 08/11/2023.
//

import SwiftUI

@main
struct TaskApp: App {
    init() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(Color("AppPrimaryColor"))
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = UITabBar.appearance().standardAppearance
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
