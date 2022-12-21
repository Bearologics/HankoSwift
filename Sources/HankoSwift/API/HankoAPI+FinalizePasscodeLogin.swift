import Foundation

public typealias HankoJWT = String

public extension HankoAPI {
    func finalizePasscodeLogin(for id: String, code: String) async throws -> (HankoFinalizePasscodeLoginResponse, HankoJWT) {
        var request = jsonRequest(for: "/passcode/login/finalize", method: .post)
        request.httpBody = try JSONEncoder().encode(["id": id, "code": code])
        let response = try await urlSession.data(for: request)
        let jsonWebToken = try TokenExtractor(response: response.1).extractJwt()
        return (try decode(response), jsonWebToken)
    }
}
