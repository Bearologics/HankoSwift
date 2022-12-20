import Foundation

public struct HankoFinalizeWebauthnRegistrationResponse: Decodable {
    public let credentialId: String
    public let userId: String

    private enum CodingKeys: String, CodingKey {
        case credentialId = "credential_id"
        case userId = "user_id"
    }
}
