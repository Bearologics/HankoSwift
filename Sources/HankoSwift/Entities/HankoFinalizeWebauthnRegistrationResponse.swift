import Foundation

struct HankoFinalizeWebauthnRegistrationResponse: Decodable {
    let credentialId: String
    let userId: String

    private enum CodingKeys: String, CodingKey {
        case credentialId = "credential_id"
        case userId = "user_id"
    }
}
