import Foundation

public struct HankoCreateUserResponse: Decodable {
    
    public struct WebauthnCredentials: Decodable {
        let id: String
    }
    
    public let id: String
    public let email: String
    public let createdAt: String
    public let updatedAt: String
    public let verified: Bool
    public let webauthnCredentials: WebauthnCredentials
    
    private enum CodingKeys: String, CodingKey {
        case id
        case email
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case verified
        case webauthnCredentials = "webauthn_credentials"
    }
}
