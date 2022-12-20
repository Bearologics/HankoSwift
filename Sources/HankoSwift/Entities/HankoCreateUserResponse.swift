import Foundation

struct HankoCreateUserResponse: Decodable {
    
    struct WebauthnCredentials: Decodable {
        let id: String
    }
    
    let id: String
    let email: String
    let createdAt: Date
    let updatedAt: Date
    let verified: Bool
    let webauthnCredentials: WebauthnCredentials
    
    private enum CodingKeys: String, CodingKey {
        case id
        case email
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case verified
        case webauthnCredentials = "webauthn_credentials"
    }
}
