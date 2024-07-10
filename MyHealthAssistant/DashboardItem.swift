//
//  DashboardItem.swift
//  MyHealthAssistant
//
//  Created by Nabeel on 15/06/24.
//

import SwiftUI

struct DashboardItem: View {
    let icon: String
    let title: String
    let tag: Int
    @ObservedObject var viewModel: DashboardViewModel

    var body: some View {
        VStack {
            Button(action: {
                viewModel.performAction(for: tag)
            }) {
                Image(systemName: icon)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
                    .padding()
                    .background(Color(.systemGray5))
                    .cornerRadius(10)
            }

            Text(title)
                .font(.caption)
                .padding(.top, 5)
        }
    }
}
