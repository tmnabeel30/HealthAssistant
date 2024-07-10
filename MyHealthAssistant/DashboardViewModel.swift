//
//  DashboardViewModel.swift
//  MyHealthAssistant
//
//  Created by Nabeel on 15/06/24.
//

import SwiftUI
import Combine

class DashboardViewModel: ObservableObject {
    @Published var selectedTag: Int? = nil
    
    func performAction(for tag: Int) {
        // Perform any logic here if needed
        // Then set the selectedTag to trigger the navigation
        selectedTag = tag
    }
}

