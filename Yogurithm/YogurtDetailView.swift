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

    var body: some View {
        Form {
            TextField("Yogurt Name", text: $yogurt.name)
            TextField("Brand", text: $yogurt.brand)
            Stepper("Rating: \(yogurt.rating)", value: $yogurt.rating, in: 1...5)
            TextField("Review", text: Binding(
                get: { yogurt.review ?? "" },  // Provide a default value
                set: { yogurt.review = $0.isEmpty ? nil : $0 }
            ))
        }
        .navigationTitle(yogurt.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

