import Foundation

struct HankoFinalizeWebauthnRegistrationRequest: Encodable {
    struct Response: Encodable {
        let clientDataJson: String
        let attestationObject: String
        let transports: String = "internal"
    }
    
    let id: String
    let rawId: String
    let type: String = "public-key"
    let response: Response
}
