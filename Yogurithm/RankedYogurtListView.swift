//
//  RankedYogurtListView.swift
//  Yogurithm
//
//  Created by Sakshi Shashiraj on 2/23/25.
//

import SwiftUI
import SwiftData

struct RankedYogurtListView: View {
    let yogurts: [Yogurt]
    
    @State private var selectedBrand: String? = nil
    @State private var minRating: Int = 1
    
    var rankedYogurts: [Yogurt] {
        yogurts.filter { $0.rating > 0 }
    }
    
    var brands: [String] {
        Array(Set(rankedYogurts.map { $0.brand })).sorted()
    }
    
    var filteredYogurts: [Yogurt] {
        rankedYogurts.filter { yogurt in
            (selectedBrand == nil || yogurt.brand == selectedBrand) && yogurt.rating >= minRating
        }
    }
    
    var body: some View {
        VStack {
            HStack {
                Menu {
                    Button("All", action: { selectedBrand = nil })
                    ForEach(brands, id: \ .self) { brand in
                        Button(brand, action: { selectedBrand = brand })
                    }
                } label: {
                    Label("Filter by Brand", systemImage: "line.horizontal.3.decrease.circle")
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                }
                .padding(.leading)
                
                Spacer()
            }
            
            VStack {
                Text("Minimum Rating: \(minRating) ⭐️")
                Slider(value: Binding(
                    get: { Double(minRating) },
                    set: { minRating = Int($0) }
                ), in: 1...5, step: 1)
            }
            .padding()
            
            List(filteredYogurts) { yogurt in
                VStack(alignment: .leading) {
                    Text(yogurt.name)
                        .font(.headline)
                    Text("Brand: \(yogurt.brand)")
                        .font(.subheadline)
                    Text("Rating: \(yogurt.rating) ⭐️")
                        .font(.subheadline)
                        .foregroundColor(.blue)
                }
                .padding(.vertical, 5)
            }
        }
        .navigationTitle("My Ranked Yogurts")
    }
}

