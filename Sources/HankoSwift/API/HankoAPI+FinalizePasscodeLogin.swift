import Foundation

typealias HankoJWT = String

extension HankoAPI {
    func finalizePasscodeLogin(for id: String, code: String) async throws -> (HankoFinalizePasscodeLoginResponse, HankoJWT) {
        var request = jsonRequest(for: "/passcode/login/finalize", method: .post)
        request.httpBody = try JSONEncoder().encode(["id": id, "code": code])
        let response = try await urlSession.data(for: request)
        
        guard let xAuthToken = (response.1 as? HTTPURLResponse)?.value(forHTTPHeaderField: "X-Auth-Token") else {
            throw APIError.noXAuthToken
        }
        
        return (try decode(response), xAuthToken)
    }
}
