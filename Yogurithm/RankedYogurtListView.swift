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

    var rankedYogurts: [Yogurt] {
        yogurts.filter { $0.rating > 0 } // Show only ranked yogurts
    }

    var body: some View {
        VStack {
            if rankedYogurts.isEmpty {
                Text("You haven't ranked any yogurts yet!")
                    .font(.headline)
                    .foregroundColor(.gray)
                    .padding()
            } else {
                List(rankedYogurts) { yogurt in
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
