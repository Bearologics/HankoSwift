import AuthenticationServices
import Foundation

public struct HankoFinalizeWebauthnRegistrationRequest: Encodable {
    public enum Transports: String, Encodable {
        case usb, nfc, ble, `internal`
    }
    
    public struct Response: Encodable {
        public let clientDataJson: String
        public let attestationObject: String
        public let transports: Transports
    }
    
    public let id: String
    public let rawId: String
    public let type: String = "public-key"
    public let response: Response
    
    public static func from(registration params: ASAuthorizationPlatformPublicKeyCredentialRegistration) -> Self {
        HankoFinalizeWebauthnRegistrationRequest(
            id: params.credentialID.toBase64Url(),
            rawId: params.credentialID.toBase64Url(),
            response: .init(
                clientDataJson: params.rawClientDataJSON.toBase64Url(),
                attestationObject: params.rawAttestationObject!.toBase64Url(),
                transports: .internal
            )
        )
    }
}
