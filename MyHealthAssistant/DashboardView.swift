//
//  Dashboard.swift
//  MyHealthAssistant
//
//  Created by Nabeel on 13/06/24.
//

import SwiftUI

struct DashboardView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    
                    // Search Bar
                    HStack {
                        TextField("Search health assistants, prescriptions,...", text: .constant(""))
                            .padding(10)
                            .background(Color(.systemGray6))
                            .cornerRadius(8)
                            .padding(.horizontal)
                            .overlay(
                                HStack {
                                    Spacer()
                                    Image(systemName: "magnifyingglass")
                                        .padding(.trailing, 16)
                                        .foregroundColor(.gray)
                                }
                            )
                    }
                    
                    // Chat with Health Assistants
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Chat with Health Assistants")
                                .font(.headline)
                            Spacer()
                            Button(action: {}) {
                                Text("Manage")
                                    .foregroundColor(.blue)
                            }
                        }
                        Button(action: {}) {
                            Text("Chat with AI Health Assistant")
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }
                        .padding(.top, 8)
                    }
                    .padding(.horizontal)
                    
                    // Medication Schedule
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Medication Schedule")
                                .font(.headline)
                            Spacer()
                            Button(action: {}) {
                                Text("View")
                                    .foregroundColor(.blue)
                            }
                        }
                        LazyVGrid(columns: [GridItem(), GridItem(), GridItem()], spacing: 20) {
                            DashboardItem(icon: "pills", title: "Painkiller", tag: 1)
                            DashboardItem(icon: "capsule", title: "Antibiotic",tag: 2)
                            DashboardItem(icon: "bandage", title: "Medical",tag: 3)
                        }
                    }
                    .padding(.horizontal)
                    
                    // Upload Prescription
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Upload Medical Record")
                                .font(.headline)
                            Spacer()
                            Button(action: {}) {
                                Text("View")
                                    .foregroundColor(.blue)
                            }
                        }
                        LazyVGrid(columns: [GridItem(), GridItem(), GridItem()], spacing: 20) {
                            DashboardItem(icon: "heart.text.square", title: "Prescription", tag: 4)
                            DashboardItem(icon: "waveform.path.ecg", title: "ECG", tag: 5)
                            DashboardItem(icon: "dna", title: "X-Ray", tag: 6)
                            DashboardItem(icon: "stethoscope", title: "MRI", tag: 7)
                            DashboardItem(icon: "microscope", title: "Pathology", tag: 8)
                            DashboardItem(icon: "heart", title: "Cardiology", tag: 9)
                        }
                    }
                    .padding(.horizontal)
                }
                .padding(.top)
            }
            .navigationTitle("Medication Assistant")
            .navigationBarItems(leading: Button(action: {
                // Add action for menu button
            }) { 
                Image(systemName: "line.horizontal.3")
                    .foregroundColor(.black)
            })
        }
    }
}

struct DashboardItem: View {
    let icon: String
    let title: String
    let tag: Int
    
    var body: some View {
        VStack {
            Button(action: {
                print(tag)
                // Perform action for making an appointment
                switch tag {
                case 1:
                    print("Action 1")
                    // Perform action for tag 1
                case 2:
                    print("Action 2")
                    // Perform action for tag 2
                case 3:
                    print("Action 3")
                    // Perform action for tag 3
                case 4:
                    print("Action 4")
                    // Perform action for tag 4
                default:
                    print("Error: Unknown tag")
                }
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

#Preview {
    DashboardView()
}
//struct ContentView: View {
//    var body: some View {
//        DashboardView()
//    }
//}

//@main
//struct MedicationAssistantApp: App {
//    var body: some Scene {
//        WindowGroup {
//            ContentView()
//        }
//    }
//}
