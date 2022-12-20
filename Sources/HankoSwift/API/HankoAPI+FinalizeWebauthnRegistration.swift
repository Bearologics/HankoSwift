import Foundation

extension HankoAPI {
    func finalizeWebauthnRegistration(jwt: HankoJWT, hankoRequest: HankoFinalizeWebauthnRegistrationRequest) async throws -> HankoFinalizeWebauthnRegistrationResponse {
        var request = jsonRequest(for: "/webauthn/registration/finalize", method: .post)
        request.httpBody = try JSONEncoder().encode(hankoRequest)
        request.setValue("Bearer \(jwt)", forHTTPHeaderField: "Authorization")
        return try decode(try await urlSession.data(for: request))
    }
}
