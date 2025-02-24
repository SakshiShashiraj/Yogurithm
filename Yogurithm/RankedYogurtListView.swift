//
//  RankedYogurtListView.swift
//  Yogurithm
//
//  Created by Sakshi Shashiraj on 2/23/25.
//

import SwiftUI
import SwiftData

struct RankedYogurtListView: View {
    let yogurts: [Yogurt] // All yogurts are passed from ContentView

    @State private var selectedBrand: String = "All"
    @State private var minRating: Int = 1

    var rankedYogurts: [Yogurt] {
        yogurts.filter { $0.rating > 0 } // Show only ranked yogurts
    }

    var brands: [String] {
        ["All"] + Array(Set(rankedYogurts.map { $0.brand })).sorted()
    }

    var filteredYogurts: [Yogurt] {
        rankedYogurts.filter { yogurt in
            (selectedBrand == "All" || yogurt.brand == selectedBrand) && yogurt.rating >= minRating
        }
    }

    var body: some View {
        VStack {
            // MARK: - FILTER OPTIONS
            VStack {
                Text("Filter by Brand & Rating")
                    .font(.headline)
                    .padding(.top, 10)

                // BRAND FILTER
                Picker("Brand", selection: $selectedBrand) {
                    ForEach(brands, id: \.self) { brand in
                        Text(brand).tag(brand)
                    }
                }
                .pickerStyle(.segmented)
                .padding(.horizontal)

                // RATING FILTER
                VStack {
                    Text("Minimum Rating: \(minRating) ⭐️")
                        .font(.subheadline)
                    Slider(value: Binding(
                        get: { Double(minRating) },
                        set: { minRating = Int($0) }
                    ), in: 1...5, step: 1)
                        .padding(.horizontal)
                }
                .padding(.bottom, 10)
            }
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .padding()

            // MARK: - DISPLAY FILTERED YOGURTS
            if filteredYogurts.isEmpty {
                Text("No yogurts match your filters!")
                    .font(.headline)
                    .foregroundColor(.gray)
                    .padding()
            } else {
                List(filteredYogurts) { yogurt in
                    VStack(alignment: .leading) {
                        Text(yogurt.name)
                            .font(.headline)

                        Text("Brand: \(yogurt.brand)")
                            .font(.subheadline)
                            .foregroundColor(.secondary)

                        Text("Rating: \(yogurt.rating) ⭐️")
                            .font(.subheadline)
                            .foregroundColor(.blue)

                        if let review = yogurt.review, !review.isEmpty {
                            Text("Review: \(review)")
                                .font(.body)
                                .foregroundColor(.gray)
                                .padding(.top, 5)
                        }
                    }
                    .padding(.vertical, 5)
                }
            }
        }
        .navigationTitle("My Ranked Yogurts")
    }
}
