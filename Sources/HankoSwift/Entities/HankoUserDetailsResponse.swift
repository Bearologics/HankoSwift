struct HankoUserDetailsResponse: Decodable {
    let id: String
    let verified: Bool
    let hasWebauthnCredential: Bool
    
    private enum CodingKeys: String, CodingKey {
        case id
        case verified
        case hasWebauthnCredential = "has_webauthn_credential"
    }
}
