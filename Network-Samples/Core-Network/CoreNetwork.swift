

protocol NetworkClient {
    func getOrThrow(url: String,headers: Headers?) async throws -> String
    func postOrThrow(url: String,data: String,headers: Headers?) async throws -> String
    func putOrThrow(url: String,data: String?,headers: Headers?) async throws -> String
    func patchOrThrow(url: String,data: String,headers: Headers?) async throws -> String
    func deleteOrThrow(url: String,headers: Headers?) async throws -> String
    
}
class NetworkFactory{
    //Factory method
    static func create()->NetworkClient{
        HttpNetworkClient()
    }
}

final class HttpHeader {
    let key: String
    let value: String

    init(_ key: String, _ value: String) {
        self.key = key
        self.value = value
    }

    func toString() -> String {
        "\(key): \(value)"
    }
}

final class Headers {
    let headers: [HttpHeader]

    init(_ headers: [HttpHeader]) {
        self.headers = headers
    }

    static func createAuthHeader(_ token: String) -> Headers {
        Headers([
            HttpHeader("Authorization", "Token \(token)")
        ])
    }

    func toMap() -> [String: String] {
        var map: [String: String] = [:]

        for header in headers {
            map[header.key] = header.value
        }

        return map
    }

    func toString() -> String {
        "\(headers.map { $0.toString() })"
    }
}
enum NetworkClientError: Error {
    case invalidURL
    case invalidResponse
    case invalidResponseBody
    case httpError(statusCode: Int, body: String)
}
