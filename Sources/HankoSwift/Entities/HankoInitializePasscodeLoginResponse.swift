import Foundation

struct HankoInitializePasscodeLoginResponse: Decodable {
    let id: String
    let ttl: Int
    let createdAt: Date
    
    private enum CodingKeys: String, CodingKey {
        case id
        case ttl
        case createdAt = "created_at"
    }
}
