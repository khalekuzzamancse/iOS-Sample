
import Foundation

// MARK: - Protocol Definition
protocol NetworkClient {
    func getOrThrow(url: String, headers: Headers?) async throws -> String
    func postOrThrow(url: String, payload: Any, headers: Headers?) async throws -> String
    func putOrThrow(url: String, payload: Any?, headers: Headers?) async throws -> String
    func patchOrThrow(url: String, payload: Any, headers: Headers?) async throws -> String
    func deleteOrThrow(url: String, headers: Headers?) async throws -> String
}

// MARK: - Supporting Types
struct HttpHeader: CustomStringConvertible {
    let key: String
    let value: String
    
    var description: String {
        "\(key): \(value)"
    }
}

struct Headers: CustomStringConvertible {
    let headers: [HttpHeader]
    
    func toDictionary() -> [String: String] {
        Dictionary(uniqueKeysWithValues: headers.map { ($0.key, $0.value) })
    }
    
    var description: String {
        headers.map { $0.description }.joined(separator: ", ")
    }
    
    static func createJWTAuthHeader(token: String) -> Headers {
        Headers(headers: [HttpHeader(key: "Authorization", value: "Bearer \(token)")])
    }
    
    static func createAuthorizationHeader(token: String) -> Headers {
        Headers(headers: [HttpHeader(key: "Authorization", value: token)])
    }
}
