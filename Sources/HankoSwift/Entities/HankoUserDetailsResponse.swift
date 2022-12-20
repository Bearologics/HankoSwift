public struct HankoUserDetailsResponse: Decodable {
    public let id: String
    public let verified: Bool
    public let hasWebauthnCredential: Bool
    
    private enum CodingKeys: String, CodingKey {
        case id
        case verified
        case hasWebauthnCredential = "has_webauthn_credential"
    }
}
