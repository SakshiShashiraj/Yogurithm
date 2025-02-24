//
//  BrandDetailView.swift
//  Yogurithm
//
//  Created by Sakshi Shashiraj on 2/23/25.
//

import SwiftUI
import SwiftData

struct BrandDetailView: View {
    let brand: String
    let yogurts: [Yogurt] // Yogurts are passed from ContentView
    
    var filteredYogurts: [Yogurt] {
        // Filter yogurts to only show those of the selected brand
        yogurts.filter { $0.brand == brand }
    }
    
    var body: some View {
        List(filteredYogurts) { yogurt in
            NavigationLink(destination: YogurtDetailView(yogurt: yogurt)) {
                VStack(alignment: .leading) {
                    Text(yogurt.name)
                        .font(.headline)
                    
                    Text("Rating: \(yogurt.rating) ⭐️")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
        }
        .navigationTitle(brand)
    }
}
