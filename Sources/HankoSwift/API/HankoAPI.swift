import Foundation

public class HankoAPI {
    let baseURL: URL
    let urlSession: URLSession
    
    enum HttpMethod: String {
        case get = "GET"
        case post = "POST"
    }
    
    public enum APIError: Error {
        case invalidResponse
        case httpError(Int?, String?)
    }

    public init(baseURL: URL, urlSession: URLSession = .shared) {
        self.baseURL = baseURL
        self.urlSession = urlSession
    }
    
    func jsonRequest(for path: String, method: HttpMethod) -> URLRequest {
        var request = URLRequest(url: baseURL.appendingPathComponent(path))
        request.httpMethod = method.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        return request
    }
    
    func decode<T: Decodable>(_ from: (Data, URLResponse)) throws -> T {
        let (data, response) = from
        guard let response = response as? HTTPURLResponse else {
            throw APIError.invalidResponse
        }
        
        switch response.statusCode {
        case 200:
            return try JSONDecoder().decode(T.self, from: data)
        default:
            let error = try JSONDecoder().decode(HankoAPIError.self, from: data)
            throw HankoAPI.APIError.httpError(error.code, error.message)
        }
    }
}
