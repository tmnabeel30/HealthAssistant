import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    private let apiKey = ""
    private let endpoint = "https://api.openai.com/v1/chat/completions"

    private init() {}

    func sendMessage(message: String, completion: @escaping (String?) -> Void) {
        guard let url = URL(string: endpoint) else {
            completion(nil)
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")

        let body: [String: Any] = [
            "model": "gpt-4o",
            "messages": [
                ["role": "user", "content": message]
            ]
        ]

        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil, let data = data else {
                completion(nil)
                return
            }

            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                   let choices = json["choices"] as? [[String: Any]],
                   let firstChoice = choices.first,
                   let messageDict = firstChoice["message"] as? [String: Any],
                   let text = messageDict["content"] as? String {
                    completion(text)
                } else {
                    completion(nil)
                }
            } catch {
                completion(nil)
            }
        }

        task.resume()
    }
}
