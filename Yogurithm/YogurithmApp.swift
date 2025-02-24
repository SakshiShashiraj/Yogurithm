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
            Yogurt.self, // Make sure you reference the correct model
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
            ContentView()
                .onAppear {
                    preloadYogurts(modelContext: sharedModelContainer.mainContext) 
                }
        }
        .modelContainer(sharedModelContainer)
    }

    func preloadYogurts(modelContext: ModelContext) {
        let existingYogurts = try? modelContext.fetch(FetchDescriptor<Yogurt>())
        
        if existingYogurts?.isEmpty == true {
            let defaultYogurts = [
                Yogurt(name: "Vanilla Greek Yogurt", brand: "Chobani", rating: 0),
                Yogurt(name: "Strawberry Yogurt", brand: "Yoplait", rating: 0),
                Yogurt(name: "Plain Yogurt", brand: "FAGE", rating: 0)
            ]
            
            for yogurt in defaultYogurts {
                modelContext.insert(yogurt)
            }
        }
    }
}

