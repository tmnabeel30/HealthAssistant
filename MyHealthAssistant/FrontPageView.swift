//
//  FrontPageView.swift
//  MyHealthAssistant
//
//  Created by Nabeel on 15/05/24.
//

import SwiftUI

struct FrontPageView: View {
    var body: some View {
        ZStack {
            Image("Walkthrough_Screen-3")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .overlay(
                    LinearGradient(
                        gradient: Gradient(colors: [Color.black.opacity(0.6), Color.black.opacity(0.3)]),
                        startPoint: .bottom,
                        endPoint: .top
                    )
                )
            
            VStack(alignment: .leading, spacing: 30) {
                Spacer()
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Don't waste your time.")
                        .font(.system(size: 20, weight: .medium))
                        .foregroundColor(.white)
                    
                    Text("Make a doctor appointment")
                        .font(.system(size: 36, weight: .bold))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.leading)
                }
                .padding(.horizontal, 20)
                
                Image("doctor")
                    .resizable()
                    .padding(.top,80)
                    .aspectRatio(contentMode: .fit)
                    .padding(.horizontal, 20)
                    .shadow(radius: 10)
                
                Spacer()
                
                HStack {
                    Spacer()
                    Button(action: {
                        // Perform action for making an appointment
                    }) {
                        Text("Let's start")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .cornerRadius(12)
                            .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 5)
                    }
                    .padding(.horizontal, 40)
                    Spacer()
                }
                .padding(.bottom, 40)
            }
        }
    }
}

#Preview {
    FrontPageView()
}
