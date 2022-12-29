import Foundation

public extension HankoAPI {
    func initializeWebauthnRegistration(jwt: HankoJWT, hankoRequest: HankoInitializeWebauthnRegistrationRequest) async throws -> HankoInitializeWebauthnRegistrationResponse {
        var request = jsonRequest(for: "/webauthn/registration/initialize", method: .post)
        request.httpBody = try JSONEncoder().encode(hankoRequest)
        request.setValue("Bearer \(jwt)", forHTTPHeaderField: "Authorization")
        return try decode(try await urlSession.data(for: request))
    }
}
