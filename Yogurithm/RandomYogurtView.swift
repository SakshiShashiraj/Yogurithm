//
//  RandomYogurtView.swift
//  Yogurithm
//
//  Created by Sakshi Shashiraj on 2/24/25.
//

import SwiftUI
import SwiftData

struct RandomYogurtView: View {
    @Query private var yogurts: [Yogurt] // Fetch all yogurts
    @State private var selectedYogurt: Yogurt?

    var body: some View {
        VStack(spacing: 20) {
            Text("Random Yogurt 🎲")
                .font(.largeTitle)
                .fontWeight(.bold)

            if let yogurt = selectedYogurt {
                Text("Try this one: \(yogurt.name) from \(yogurt.brand)!")
                    .font(.title2)
                    .multilineTextAlignment(.center)
                    .padding()
            } else {
                Text("Press the button to get a random yogurt!")
                    .font(.title2)
                    .multilineTextAlignment(.center)
                    .padding()
            }

            Button("Pick a Random Yogurt 🎲") {
                selectedYogurt = yogurts.randomElement() // ✅ Select a random yogurt
            }
            .font(.title2)
            .bold()
            .foregroundColor(.white)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.green)
            .cornerRadius(12)
            .padding(.horizontal, 40)

            }
        .padding()
    }
}
