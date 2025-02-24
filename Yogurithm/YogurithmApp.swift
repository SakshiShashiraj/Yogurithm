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
            MainView()  // ✅ Loads MainView with a persistent tab bar
                .onAppear {
                    preloadYogurts(modelContext: sharedModelContainer.mainContext)
                }
                .modelContainer(sharedModelContainer)
        }
    }

    func preloadYogurts(modelContext: ModelContext) {
        let existingYogurts = try? modelContext.fetch(FetchDescriptor<Yogurt>())

        // If yogurts already exist, do nothing
        if let existingYogurts, !existingYogurts.isEmpty {
            return
        }

        let yogurts = [
            // Chobani
            Yogurt(name: "Vanilla Greek Yogurt", brand: "Chobani", rating: 0),
            Yogurt(name: "Strawberry Greek Yogurt", brand: "Chobani", rating: 0),
            Yogurt(name: "Blueberry Greek Yogurt", brand: "Chobani", rating: 0),
            Yogurt(name: "Honey Greek Yogurt", brand: "Chobani", rating: 0),
            Yogurt(name: "Peach Greek Yogurt", brand: "Chobani", rating: 0),
            Yogurt(name: "Mango Greek Yogurt", brand: "Chobani", rating: 0),
            Yogurt(name: "Black Cherry Greek Yogurt", brand: "Chobani", rating: 0),

            // Siggi's
            Yogurt(name: "Vanilla Icelandic Yogurt", brand: "Siggi's", rating: 0),
            Yogurt(name: "Mixed Berry Icelandic Yogurt", brand: "Siggi's", rating: 0),
            Yogurt(name: "Raspberry Icelandic Yogurt", brand: "Siggi's", rating: 0),
            Yogurt(name: "Pumpkin & Spice Icelandic Yogurt", brand: "Siggi's", rating: 0),
            Yogurt(name: "Coconut Icelandic Yogurt", brand: "Siggi's", rating: 0),
            Yogurt(name: "Maple Icelandic Yogurt", brand: "Siggi's", rating: 0),

            // Oikos
            Yogurt(name: "Triple Zero Vanilla Greek Yogurt", brand: "Oikos", rating: 0),
            Yogurt(name: "Triple Zero Strawberry Greek Yogurt", brand: "Oikos", rating: 0),
            Yogurt(name: "Blueberry Greek Yogurt", brand: "Oikos", rating: 0),
            Yogurt(name: "Peach Greek Yogurt", brand: "Oikos", rating: 0),
            Yogurt(name: "Banana Crème Greek Yogurt", brand: "Oikos", rating: 0),
            Yogurt(name: "Pineapple Greek Yogurt", brand: "Oikos", rating: 0),

            // Yoplait
            Yogurt(name: "Original Strawberry Yogurt", brand: "Yoplait", rating: 0),
            Yogurt(name: "Original French Vanilla Yogurt", brand: "Yoplait", rating: 0),
            Yogurt(name: "Original Key Lime Yogurt", brand: "Yoplait", rating: 0),
            Yogurt(name: "Strawberry Banana Yogurt", brand: "Yoplait", rating: 0),
            Yogurt(name: "Harvest Peach Yogurt", brand: "Yoplait", rating: 0),
            Yogurt(name: "Blackberry Yogurt", brand: "Yoplait", rating: 0),

            // Noosa
            Yogurt(name: "Vanilla Bean Yogurt", brand: "Noosa", rating: 0),
            Yogurt(name: "Strawberry Rhubarb Yogurt", brand: "Noosa", rating: 0),
            Yogurt(name: "Key Lime Yogurt", brand: "Noosa", rating: 0),
            Yogurt(name: "Coconut Yogurt", brand: "Noosa", rating: 0),
            Yogurt(name: "Passionfruit Yogurt", brand: "Noosa", rating: 0),
            Yogurt(name: "Caramelized Banana Yogurt", brand: "Noosa", rating: 0),

            // So Delicious (Dairy-Free)
            Yogurt(name: "Vanilla Coconutmilk Yogurt", brand: "So Delicious", rating: 0),
            Yogurt(name: "Strawberry Coconutmilk Yogurt", brand: "So Delicious", rating: 0),
            Yogurt(name: "Raspberry Coconutmilk Yogurt", brand: "So Delicious", rating: 0),
            Yogurt(name: "Blueberry Coconutmilk Yogurt", brand: "So Delicious", rating: 0),
            Yogurt(name: "Chocolate Coconutmilk Yogurt", brand: "So Delicious", rating: 0),

            // Silk (Plant-Based)
            Yogurt(name: "Vanilla Almondmilk Yogurt", brand: "Silk", rating: 0),
            Yogurt(name: "Strawberry Almondmilk Yogurt", brand: "Silk", rating: 0),
            Yogurt(name: "Peach Mango Almondmilk Yogurt", brand: "Silk", rating: 0),
            Yogurt(name: "Blueberry Almondmilk Yogurt", brand: "Silk", rating: 0),
            Yogurt(name: "Dark Chocolate Coconut Yogurt", brand: "Silk", rating: 0),

            // FAGE
            Yogurt(name: "Total 5% Plain Greek Yogurt", brand: "FAGE", rating: 0),
            Yogurt(name: "Total 2% Honey Greek Yogurt", brand: "FAGE", rating: 0),
            Yogurt(name: "Total 0% Blueberry Acai Greek Yogurt", brand: "FAGE", rating: 0),
            Yogurt(name: "Total 2% Strawberry Greek Yogurt", brand: "FAGE", rating: 0),
            Yogurt(name: "Total 5% Cherry Greek Yogurt", brand: "FAGE", rating: 0),

            // Two Good
            Yogurt(name: "Vanilla Greek Yogurt", brand: "Two Good", rating: 0),
            Yogurt(name: "Strawberry Greek Yogurt", brand: "Two Good", rating: 0),
            Yogurt(name: "Peach Greek Yogurt", brand: "Two Good", rating: 0),
            Yogurt(name: "Mixed Berry Greek Yogurt", brand: "Two Good", rating: 0),
            Yogurt(name: "Coconut Greek Yogurt", brand: "Two Good", rating: 0),

            // Stonyfield Organic
            Yogurt(name: "Vanilla Organic Yogurt", brand: "Stonyfield Organic", rating: 0),
            Yogurt(name: "Strawberry Organic Yogurt", brand: "Stonyfield Organic", rating: 0),
            Yogurt(name: "Blueberry Organic Yogurt", brand: "Stonyfield Organic", rating: 0),
            Yogurt(name: "Banana Mango Organic Yogurt", brand: "Stonyfield Organic", rating: 0),
            Yogurt(name: "Peach Organic Yogurt", brand: "Stonyfield Organic", rating: 0)
        ]

        for yogurt in yogurts {
            modelContext.insert(yogurt)
        }
    }
}
