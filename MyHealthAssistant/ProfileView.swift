//
//  ProfileView.swift
//  MyHealthAssistant
//
//  Created by Nabeel on 15/06/24.
//

import SwiftUI

struct ProfileView: View {
    @State private var firstName: String = "John"
    @State private var lastName: String = "Doe"
    @State private var dateOfBirth: String = "01-01-1990"
    @State private var medicalEmail: String = "john.doe@healthconnect.com"

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                // Profile Picture Section
                VStack {
                    Image("profile_picture") // Replace with your image name or URL
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.blue, lineWidth: 2))
                        .shadow(radius: 5)
                    Text("Upload Profile Picture")
                        .foregroundColor(.gray)
                }
                .padding(.top, 30)
                
                // Text Fields Section
                VStack(alignment: .leading, spacing: 10) {
                    CustomTextField(placeholder: "First Name", text: $firstName)
                    CustomTextField(placeholder: "Last Name", text: $lastName)
                    CustomTextField(placeholder: "Date of Birth", text: $dateOfBirth)
                    CustomTextField(placeholder: "Medical Email", text: $medicalEmail)
                }
                .padding(.horizontal)

                Spacer()
                
                // Update Profile Button
                Button(action: {
                    // Handle update profile action
                }) {
                    Text("Update Profile")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding(.horizontal)
                .padding(.bottom, 20)
            }
            .navigationTitle("HealthConnect Profile")
            .navigationBarItems(leading: Button(action: {
                // Handle back action
            }) {
                HStack {
                    Image(systemName: "chevron.left")
                    Text("Back")
                }
                .foregroundColor(.gray)
                .padding(.vertical, 10)
                .padding(.horizontal, 20)
                .background(Color(.systemGray5))
                .cornerRadius(10)
            })
        }
    }
}

struct CustomTextField: View {
    var placeholder: String
    @Binding var text: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(placeholder)
                .font(.subheadline)
                .foregroundColor(.gray)
            TextField("", text: $text)
                .padding(10)
                .background(Color(.systemGray6))
                .cornerRadius(8)
        }
    }
}
//
//struct ProfileView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileView()
//    }
//}


#Preview {
    ProfileView()
}
