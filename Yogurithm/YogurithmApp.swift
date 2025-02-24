//
//  YogurithmApp.swift
//  Yogurithm
//
//  Created by Sakshi Shashiraj on 2/23/25.
//

import SwiftUI
import SwiftData

@main
struct YogurithmApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Yogurt.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            NavigationStack {
                HomeView()  // Now it loads the Home View first
            }
            .onAppear {
                preloadYogurts(modelContext: sharedModelContainer.mainContext)
            }
        }
        .modelContainer(sharedModelContainer)
    }

    func preloadYogurts(modelContext: ModelContext) {
        let existingYogurts = try? modelContext.fetch(FetchDescriptor<Yogurt>())
        existingYogurts?.forEach { modelContext.delete($0) }

        let yogurts = [
            Yogurt(name: "Vanilla Greek Yogurt", brand: "Chobani", rating: 0),
            Yogurt(name: "Strawberry Yogurt", brand: "Yoplait", rating: 0),
            Yogurt(name: "Plain Yogurt", brand: "FAGE", rating: 0),
            Yogurt(name: "Blueberry Greek Yogurt", brand: "Oikos", rating: 0),
            Yogurt(name: "Peach Yogurt", brand: "Dannon", rating: 0),
            Yogurt(name: "Raspberry Greek Yogurt", brand: "Siggi's", rating: 0),
            Yogurt(name: "Honey Greek Yogurt", brand: "Chobani", rating: 0),
            Yogurt(name: "Coconut Yogurt", brand: "So Delicious", rating: 0),
            Yogurt(name: "Mango Greek Yogurt", brand: "Oikos", rating: 0),
            Yogurt(name: "Lemon Yogurt", brand: "Noosa", rating: 0),
            Yogurt(name: "Strawberry Banana Yogurt", brand: "Yoplait", rating: 0),
            Yogurt(name: "Almondmilk Vanilla Yogurt", brand: "Silk", rating: 0),
            Yogurt(name: "Cherry Greek Yogurt", brand: "Chobani", rating: 0),
            Yogurt(name: "Mixed Berry Yogurt", brand: "Dannon", rating: 0),
            Yogurt(name: "Key Lime Yogurt", brand: "Noosa", rating: 0),
            Yogurt(name: "Raspberry Coconut Yogurt", brand: "So Delicious", rating: 0),
            Yogurt(name: "Pineapple Yogurt", brand: "Oikos", rating: 0),
            Yogurt(name: "Pumpkin Spice Greek Yogurt", brand: "Chobani", rating: 0),
            Yogurt(name: "Black Cherry Greek Yogurt", brand: "Siggi's", rating: 0),
            Yogurt(name: "Coffee Yogurt", brand: "Brown Cow", rating: 0),
            Yogurt(name: "Caramelized Banana Greek Yogurt", brand: "Noosa", rating: 0),
            Yogurt(name: "Passionfruit Greek Yogurt", brand: "Chobani", rating: 0),
            Yogurt(name: "Chocolate Yogurt", brand: "Two Good", rating: 0),
            Yogurt(name: "Maple Yogurt", brand: "Siggi's", rating: 0),
            Yogurt(name: "Vanilla Bean Yogurt", brand: "Stonyfield Organic", rating: 0)
        ]

        for yogurt in yogurts {
            modelContext.insert(yogurt)
        }
    }
}
