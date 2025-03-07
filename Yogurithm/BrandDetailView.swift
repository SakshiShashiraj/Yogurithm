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
    let yogurts: [Yogurt]
    
    var filteredYogurts: [Yogurt] {
        yogurts.filter { $0.brand == brand }
    }
    
    let columns = [GridItem(.flexible(), spacing: 15), GridItem(.flexible(), spacing: 15)]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 15) {
                ForEach(filteredYogurts) { yogurt in
                    NavigationLink(destination: YogurtDetailView(yogurt: yogurt)) {
                        VStack {
                            Image(systemName: "leaf") // Placeholder icon for yogurt
                                .font(.largeTitle)
                                .foregroundColor(.green)
                            
                            Text(yogurt.name)
                                .font(.headline)
                                .multilineTextAlignment(.center)
                                .padding(.top, 5)
                        }
                        .padding()
                        .frame(height: 100)
                        .frame(maxWidth: .infinity)
                        .background(Color(.systemGray6))
                        .cornerRadius(12)
                        .shadow(radius: 3)
                    }
                }
            }
            .padding()
        }
        .navigationTitle(brand)
    }
}
