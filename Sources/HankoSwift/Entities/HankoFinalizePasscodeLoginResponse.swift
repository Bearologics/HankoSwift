import Foundation

public struct HankoFinalizePasscodeLoginResponse: Decodable {
    public let id: String
    public let ttl: Int
    public let createdAt: Date
    
    private enum CodingKeys: String, CodingKey {
        case id
        case ttl
        case createdAt = "created_at"
    }
}
