
import Foundation
final class NetworkClientImpl: NetworkClient {
    
    private let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func getOrThrow(url: String, headers: Headers? = nil) async throws -> String {
        try await request(url: url, method: "GET", headers: headers)
    }
    
    func postOrThrow(url: String, payload: Any, headers: Headers? = nil) async throws -> String {
        try await request(url: url, method: "POST", payload: payload, headers: headers)
    }
    
    func putOrThrow(url: String, payload: Any? = nil, headers: Headers? = nil) async throws -> String {
        try await request(url: url, method: "PUT", payload: payload, headers: headers)
    }
    
    func patchOrThrow(url: String, payload: Any, headers: Headers? = nil) async throws -> String {
        try await request(url: url, method: "PATCH", payload: payload, headers: headers)
    }
    
    func deleteOrThrow(url: String, headers: Headers? = nil) async throws -> String {
        try await request(url: url, method: "DELETE", headers: headers)
    }
    
    // MARK: - Core Request Function
    private func request(url: String, method: String, payload: Any? = nil, headers: Headers? = nil) async throws -> String {
        guard let requestURL = URL(string: url) else {
            throw URLError(.badURL)
        }
        
        var request = URLRequest(url: requestURL)
        request.httpMethod = method
        
        // Apply headers
        headers?.toDictionary().forEach { key, value in
            request.setValue(value, forHTTPHeaderField: key)
        }
        
        // Encode payload if present
        if let payload = payload {
            request.httpBody = try JSONSerialization.data(withJSONObject: payload, options: [])
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        }
        
        // Execute request
        let (data, response) = try await session.data(for: request)
        
        // Validate status code
        guard let httpResponse = response as? HTTPURLResponse,
              (200..<300).contains(httpResponse.statusCode) else {
            throw URLError(.badServerResponse)
        }
        
        guard let stringResponse = String(data: data, encoding: .utf8) else {
            throw URLError(.cannotDecodeContentData)
        }
        
        return stringResponse
    }
}
