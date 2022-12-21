import XCTest
@testable import HankoSwift

final class TokenExtractorTests: XCTestCase {
    let mockURL = URL(string: "http://localhost")!
    let mockJwt = "ey123456789="
    lazy var mockCookie: String = {
        "hanko=\(mockJwt); Path=/; HttpOnly"
    }()
    
    func test_extractsJwt_fromXAuthTokenHeader() throws {
        let response = HTTPURLResponse(
            url: mockURL,
            statusCode: 200,
            httpVersion: nil,
            headerFields: ["X-Auth-Token": mockJwt]
        )!
        
        let extractor = try TokenExtractor(response: response)
        let jsonWebToken = try extractor.extractJwt()
        
        XCTAssertEqual(jsonWebToken, "ey123456789=")
    }
    
    func test_extractsJwt_fromSetCookie() throws {
        let response = HTTPURLResponse(
            url: mockURL,
            statusCode: 200,
            httpVersion: nil,
            headerFields: ["Set-Cookie": mockCookie]
        )!
        
        let extractor = try TokenExtractor(response: response)
        let jsonWebToken = try extractor.extractJwt()
        
        XCTAssertEqual(jsonWebToken, "ey123456789=")
    }
}
