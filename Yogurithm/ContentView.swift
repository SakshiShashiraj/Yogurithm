//
//  ContentView.swift
//  Yogurithm
//
//  Created by Sakshi Shashiraj on 2/23/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var yogurts: [Yogurt] // Fetches all yogurts

    var body: some View {
        NavigationStack {
            List {
                ForEach(yogurts) { yogurt in
                    NavigationLink(destination: YogurtDetailView(yogurt: yogurt)) {
                        VStack(alignment: .leading) {
                            Text(yogurt.name)
                                .font(.headline)
                            Text(yogurt.brand)
                                .font(.subheadline)
                            Text("⭐️ Rating: \(yogurt.rating)")
                                .font(.caption)
                        }
                    }
                }
                .onDelete(perform: deleteYogurts)
            }
            .navigationTitle("Yogurithm 🍦")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: addYogurt) {
                        Image(systemName: "plus")
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
            }
        }
    }

    func deleteYogurts(at offsets: IndexSet) {
        for index in offsets {
            modelContext.delete(yogurts[index])
        }
    }

    func addYogurt() {
        let newYogurt = Yogurt(name: "New Yogurt", brand: "Brand", rating: 3)
        modelContext.insert(newYogurt)
    }
}
