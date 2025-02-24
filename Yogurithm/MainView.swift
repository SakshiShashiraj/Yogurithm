//
//  MainView.swift
//  Yogurithm
//
//  Created by Sakshi Shashiraj on 2/23/25.
//

import SwiftUI
import SwiftData

struct MainView: View {
    @Query private var yogurts: [Yogurt] // Fetch all yogurts

    var body: some View {
        TabView {
            // Home Tab
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }

            // Random Yogurt Tab 🎲
            RandomYogurtView()
                .tabItem {
                    Label("Random", systemImage: "dice.fill")
                }

            // Streak Tracker Tab 🔥
            StreakTrackerView()
                .tabItem {
                    Label("Stats", systemImage: "flame.fill")
                }

            // Ranked Yogurts Tab 🏆
            RankedYogurtListView(yogurts: yogurts)
                .tabItem {
                    Label("Ranked", systemImage: "star.fill")
                }
        }
        .accentColor(.blue) // Customize tab bar color
    }
}
