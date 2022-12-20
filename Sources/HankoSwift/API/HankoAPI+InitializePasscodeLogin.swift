import Foundation

extension HankoAPI {
    func initializePasscodeLogin(for userId: String) async throws -> HankoInitializePasscodeLoginResponse {
        var request = jsonRequest(for: "/passcode/login/initialize", method: .post)
        request.httpBody = try JSONEncoder().encode(["user_id": userId])
        return try decode(try await urlSession.data(for: request))
    }
}
