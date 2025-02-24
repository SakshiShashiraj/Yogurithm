import SwiftUI
import SwiftData
import Charts

struct StreakTrackerView: View {
    @Query private var yogurts: [Yogurt] // Fetch all yogurts

    @State private var streakCount: Int = UserDefaults.standard.integer(forKey: "streakCount")
    @State private var lastRatedDate: Date = UserDefaults.standard.object(forKey: "lastRatedDate") as? Date ?? Date()

    // 🏆 Fetch Top 3 Ranked Yogurts
    var topYogurts: [Yogurt] {
        Array(
            yogurts
                .filter { $0.rating > 0 } // Only ranked yogurts
                .sorted { $0.rating > $1.rating } // Sort by highest rating
                .prefix(3) // Take the top 3
        )
    }


    // 📊 Get Average Ratings by Brand
    var brandRatings: [(brand: String, avgRating: Double)] {
        let brandGroups = Dictionary(grouping: yogurts.filter { $0.rating > 0 }, by: { $0.brand })
        return brandGroups.map { brand, yogurts in
            let avgRating = yogurts.map { Double($0.rating) }.reduce(0, +) / Double(yogurts.count)
            return (brand, avgRating)
        }
        .sorted { $0.avgRating > $1.avgRating } // Sort highest-rated brands first
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // 🔥 Streak Counter Section
                VStack {
                    Text("🔥 Streak Tracker")
                        .font(.largeTitle)
                        .fontWeight(.bold)

                    Text("Current Streak: \(streakCount) days")
                        .font(.title2)
                        .padding()

                    
                    .font(.title2)
                    .bold()
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.orange)
                    .cornerRadius(12)
                    .padding(.horizontal, 40)
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(12)

                // 🏆 Top 3 Ranked Yogurts Section
                if !topYogurts.isEmpty {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("🏆 Top 3 Ranked Yogurts")
                            .font(.headline)
                            .padding(.top, 10)

                        ForEach(topYogurts, id: \.id) { yogurt in
                            HStack {
                                Text("\(yogurt.name) - \(yogurt.rating) ⭐️")
                                    .font(.subheadline)
                                Spacer()
                            }
                            .padding(.horizontal)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(12)
                }

                // 📊 Favorite Brands Chart
                if !brandRatings.isEmpty {
                    VStack {
                        Text("📊 Favorite Brands")
                            .font(.headline)
                            .padding(.top, 10)

                        Chart {
                            ForEach(brandRatings, id: \.brand) { brand in
                                BarMark(
                                    x: .value("Brand", brand.brand),
                                    y: .value("Avg Rating", brand.avgRating)
                                )
                                .foregroundStyle(Color.blue)
                            }
                        }
                        .frame(height: 300)
                        .padding()
                    }
                    .background(Color(.systemGray6))
                    .cornerRadius(12)
                }

                Spacer()
            }
            .padding()
        }
    }

    // 🔥 Update Streak Logic
    func updateStreak() {
        let today = Date()
        let calendar = Calendar.current

        if calendar.isDateInToday(lastRatedDate) {
            return // Already counted today
        }

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
