import Foundation

public struct HankoFinalizeWebauthnRegistrationRequest: Encodable {
    public struct Response: Encodable {
        public let clientDataJson: String
        public let attestationObject: String
        public let transports: String = "internal"
    }
    
    public let id: String
    public let rawId: String
    public let type: String = "public-key"
    public let response: Response
}
