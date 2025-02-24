//
//  StreakTrackerView.swift
//  Yogurithm
//

import SwiftUI

struct StreakTrackerView: View {
    @State private var streakCount: Int = UserDefaults.standard.integer(forKey: "streakCount")
    @State private var lastRatedDate: Date = UserDefaults.standard.object(forKey: "lastRatedDate") as? Date ?? Date()

    var body: some View {
        VStack(spacing: 20) {
            Text("🔥 Streak Tracker 🔥")
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("Current Streak: \(streakCount) days")
                .font(.title2)
                .padding()

            Button("Rank a Yogurt Today ✅") {
                updateStreak()
            }
            .font(.title2)
            .bold()
            .foregroundColor(.white)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.orange)
            .cornerRadius(12)
            .padding(.horizontal, 40)

            NavigationLink(destination: HomeView()) {
                Text("Home 🏠")
                    .font(.title2)
                    .bold()
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(12)
                    .padding(.horizontal, 40)
            }
        }
        .padding()
    }

    func updateStreak() {
        let today = Date()
        let calendar = Calendar.current

        // Check if last rating was today
        if calendar.isDateInToday(lastRatedDate) {
            return // Already counted today
        }

        // Check if last rating was yesterday (continuing streak)
        if let previousDay = calendar.date(byAdding: .day, value: -1, to: today),
           calendar.isDate(previousDay, inSameDayAs: lastRatedDate) {
            streakCount += 1
        } else {
            streakCount = 1 // Reset streak if more than a day passed
        }

        lastRatedDate = today
        UserDefaults.standard.set(streakCount, forKey: "streakCount")
        UserDefaults.standard.set(today, forKey: "lastRatedDate")
    }
}
