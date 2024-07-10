import SwiftUI

struct HealthAssistantChatView: View {
    @State private var newMessage: String = ""
    @State private var messages: [Message] = [
        Message(sender: "Med", time: "11:43 AM", content: "Don't forget your pills. Stay healthy!", type: .med)
    ]
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        ForEach(messages) { message in
                            MessageRow(message: message)
                        }
                    }
                    .padding()
                }
                
                HStack {
                    TextField("Enter a new medication note...", text: $newMessage)
                        .padding(10)
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                    
                    Button(action: {
                        sendMessage()
                    }) {
                        Image(systemName: "paperplane.fill")
                            .foregroundColor(.blue)
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(8)
                    }
                }
                .padding()
                .background(Color(.systemGray5))
            }
            .navigationTitle("Health Assistant")
            .navigationBarItems(leading: HStack {
                Button(action: {
                    // Handle back action
                }) {
                    Image(systemName: "chevron.left")
                }
                Spacer()
            })
        }
    }
    
    private func sendMessage() {
        let userMessage = newMessage
        let timestamp = DateFormatter.localizedString(from: Date(), dateStyle: .none, timeStyle: .short)
        
        // Clear the newMessage text field
        newMessage = ""
        
        // Add user message to messages
        messages.append(Message(sender: "You", time: timestamp, content: userMessage, type: .pati))
        
        // Use local variable to avoid capturing self in escaping closure
        let currentMessages = messages
        
        NetworkManager.shared.sendMessage(message: userMessage) { response in
            if let response = response {
                DispatchQueue.main.async {
                    var updatedMessages = currentMessages
                    updatedMessages.append(Message(sender: "AI", time: timestamp, content: response, type: .med))
                    self.messages = updatedMessages
                }
            }
        }
    }
}

struct MessageRow: View {
    let message: Message
    
    var body: some View {
        HStack {
            if message.type == .med {
                Image(systemName: "heart.fill")
                    .foregroundColor(.red)
            } else if message.type == .heal {
                Image(systemName: "cross.fill")
                    .foregroundColor(.blue)
            } else if message.type == .pati {
                Image(systemName: "person.fill")
                    .foregroundColor(.green)
            }
            VStack(alignment: .leading) {
                Text(message.sender)
                    .font(.subheadline)
                    .fontWeight(.bold)
                Text(message.time)
                    .font(.caption)
                    .foregroundColor(.gray)
                Text(message.content)
                    .font(.body)
            }
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(10)
    }
}

struct HealthAssistantChatView_Previews: PreviewProvider {
    static var previews: some View {
        HealthAssistantChatView()
    }
}

struct Message: Identifiable {
    let id = UUID()
    let sender: String
    let time: String
    let content: String
    let type: MessageType
}

enum MessageType {
    case med, heal, pati
}
