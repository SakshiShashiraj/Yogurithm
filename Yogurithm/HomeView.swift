//
//  HomeView.swift
//  Yogurithm
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text("Welcome to Yogurithm")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)

                Text("Rank your favorite yogurts and keep track of your reviews!")
                    .font(.subheadline)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 20)

                // Start Ranking Button
                NavigationLink(destination: ContentView()) {
                    Text("Start Ranking")
                        .font(.title2)
                        .bold()
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(12)
                        .padding(.horizontal, 40)
                }

                Spacer() // Pushes content up so tab bar is visible
            }
            .padding()
        }
    }
}
