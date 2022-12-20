import Foundation

extension HankoAPI {
    func getUserDetails(byEmail email: String) async throws -> HankoUserDetailsResponse {
        var request = jsonRequest(for: "/user", method: .post)
        request.httpBody = try JSONEncoder().encode(["email": email])
        return try decode(try await urlSession.data(for: request))
    }
}
