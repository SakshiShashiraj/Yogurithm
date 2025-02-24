//
//  ContentView.swift
//  Yogurithm
//
//  Created by Sakshi Shashiraj on 2/23/25.
//



import SwiftUI
import SwiftData

struct ContentView: View {
    @Query var yogurts: [Yogurt] // Fetch all yogurts

    var brands: [String] {
        Set(yogurts.map { $0.brand }).sorted() // Extract unique brands
    }

    var body: some View {
        NavigationStack {
            List(brands, id: \.self) { brand in
                NavigationLink(destination: BrandDetailView(brand: brand, yogurts: yogurts)) {
                    Text(brand)
                        .font(.headline)
                        .padding(.vertical, 5)
                }
            }
            .navigationTitle("Yogurt Brands")
        }
    }
}
