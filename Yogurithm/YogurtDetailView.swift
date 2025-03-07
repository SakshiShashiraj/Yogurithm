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
    @Environment(\ .modelContext) private var modelContext
    
    var body: some View {
        VStack(spacing: 20) {
            TextField("Yogurt Name", text: $yogurt.name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            
            TextField("Brand", text: $yogurt.brand)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            
            Stepper("Rating: \(yogurt.rating) ⭐️", value: $yogurt.rating, in: 0...5, step: 1)
                .padding(.horizontal)
            
            TextField("Review", text: Binding(
                get: { yogurt.review ?? "" },
                set: { yogurt.review = $0.isEmpty ? nil : $0 }
            ))
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding(.horizontal)
            
            Button(action: {
                do {
                    try modelContext.save()
                } catch {
                    print("Failed to save yogurt: \(error)")
                }
            }) {
                Text("Log This Yogurt")
                    .bold()
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.horizontal)
            }
        }
        .navigationTitle(yogurt.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}
