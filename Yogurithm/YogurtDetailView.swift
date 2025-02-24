//
//  YogurtDetailView.swift
//  Yogurithm
//
//  Created by Sakshi Shashiraj on 2/23/25.
//

import SwiftUI
import SwiftData

struct YogurtDetailView: View {
    @Bindable var yogurt: Yogurt
    @Environment(\.modelContext) private var modelContext

    var body: some View {
        Form {
            TextField("Yogurt Name", text: $yogurt.name)
            TextField("Brand", text: $yogurt.brand)
            Stepper("Rating: \(yogurt.rating) ⭐️", value: $yogurt.rating, in: 0...5, step: 1)
            TextField("Review", text: Binding(
                get: { yogurt.review ?? "" },
                set: { yogurt.review = $0.isEmpty ? nil : $0 }
            ))
        }
        .navigationTitle(yogurt.name)
        .navigationBarTitleDisplayMode(.inline)
        .onDisappear {
            do {
                try modelContext.save() // Explicitly save changes
            } catch {
                print("Failed to save yogurt: \(error)")
            }
        }
    }
}
