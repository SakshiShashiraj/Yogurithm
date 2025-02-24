//
//  HomeView.swift
//  Yogurithm
//
//  Created by Sakshi Shashiraj on 2/23/25.
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
            }
            .padding()
        }
    }
}
