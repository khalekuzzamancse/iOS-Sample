import Foundation


final class HttpNetworkClient: NetworkClient {

    func getOrThrow(url: String,headers: Headers?) async throws -> String {
        try await request(url: url,method: "GET",data: nil,headers: headers)
        
    }

    func postOrThrow(url: String,data: String,headers: Headers?) async throws -> String {
        try await request(url: url,method: "POST",data: data,headers: headers)
    }

    func putOrThrow(url: String,data: String?,headers: Headers?) async throws -> String {
        try await request(url: url,method: "PUT",data: data,headers: headers)
    }

    func patchOrThrow(url: String,data: String,headers: Headers?) async throws -> String {
        try await request(url: url,method: "PATCH",data: data,headers: headers)
    }

    func deleteOrThrow(url: String,headers: Headers?) async throws -> String {
        try await request(url: url,method: "DELETE",data: nil,headers: headers)
    }

    private func request(url: String,method: String,data: String?,headers: Headers?) async throws -> String {

        guard let requestURL = URL(string: url) else {
            throw NetworkClientError.invalidURL
        }

        var request = URLRequest(url: requestURL)
        request.httpMethod = method
        request.setValue("application/json; charset=UTF-8",forHTTPHeaderField: "Content-Type")

        if let headers {
            for header in headers.headers {
                request.setValue(header.value,forHTTPHeaderField: header.key )
            }
        }

        if let data {
            request.httpBody = data.data(using: .utf8)
        }

        let (responseData, response) = try await URLSession.shared.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkClientError.invalidResponse
        }

        guard let responseBody = String(data: responseData,encoding: .utf8) else {
            throw NetworkClientError.invalidResponseBody
        }

        guard (200...299).contains(httpResponse.statusCode) else {
            throw NetworkClientError.httpError(
                statusCode: httpResponse.statusCode,
                body: responseBody
            )
        }

        return responseBody
    }
}
