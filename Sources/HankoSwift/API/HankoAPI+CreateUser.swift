import Foundation

public extension HankoAPI {
    func createUser(email: String) async throws -> HankoCreateUserResponse {
        var request = jsonRequest(for: "/users", method: .post)
        request.httpBody = try JSONEncoder().encode(["email": email])
        return try decode(try await urlSession.data(for: request))
    }
}
