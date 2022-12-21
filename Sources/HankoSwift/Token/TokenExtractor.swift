import Foundation

class TokenExtractor {
    enum ExtractionError: Error {
        case invalidResponseType
        case noJwt
    }
    
    private let httpResponse: HTTPURLResponse
    private let xAuthEnabled: Bool
    
    init(response: URLResponse, xAuthEnabled: Bool = true) throws {
        guard let httpResponse = response as? HTTPURLResponse else {
            throw ExtractionError.invalidResponseType
        }
        
        self.httpResponse = httpResponse
        self.xAuthEnabled = xAuthEnabled
    }
    
    func extractJwt() throws -> HankoJWT {
        let regex = try NSRegularExpression(pattern: "hanko=(.*); Path=/; HttpOnly")
        var jsonWebToken: String?
        
        if xAuthEnabled, let xAuthToken = httpResponse.value(forHTTPHeaderField: "X-Auth-Token") {
            jsonWebToken = xAuthToken
        } else if let setCookieValue = httpResponse.value(forHTTPHeaderField: "Set-Cookie"), let regexMatch = regex.firstMatch(in: setCookieValue, range: NSRange(location: 0, length: setCookieValue.utf16.count)) {
           
            jsonWebToken = String(setCookieValue[Range(regexMatch.range(at: 1), in: setCookieValue)!])
        }
        
        guard let jsonWebToken = jsonWebToken else {
            throw ExtractionError.noJwt
        }
        
        return jsonWebToken
    }
}
