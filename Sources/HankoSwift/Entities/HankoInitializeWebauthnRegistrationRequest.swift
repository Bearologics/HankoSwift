import Foundation

public struct HankoInitializeWebauthnRegistrationRequest: Encodable {
    public struct User: Encodable {
        public let id: String
        public let name: String?
        public let displayName: String?
        
        public init(id: String, name: String?, displayName: String?) {
            self.id = id
            self.name = name
            self.displayName = displayName
        }
    }
    
    public enum ConveyancePreference: String, Encodable {
        case none, indirect, direct
    }
    
    public struct Options: Encodable {
        public let authenticatorSelection: AuthenticatorSelection
        public let attestation: ConveyancePreference
        
        public init(authenticatorSelection: AuthenticatorSelection, attestation: ConveyancePreference) {
            self.authenticatorSelection = authenticatorSelection
            self.attestation = attestation
        }
    }
    
    public enum UserVerificationRequirement: String, Encodable {
        case required, preferred, discouraged
    }
    
    public struct AuthenticatorSelection: Encodable {
        public let authenticatorAttachment: String?
        public let requireResidentKey: Bool?
        public let userVerification: UserVerificationRequirement?
        
        public init(authenticatorAttachment: String?, requireResidentKey: Bool?, userVerification: UserVerificationRequirement?) {
            self.authenticatorAttachment = authenticatorAttachment
            self.requireResidentKey = requireResidentKey
            self.userVerification = userVerification
        }
    }
    
    public let user: User
    public let options: Options
    
    public init(user: User, options: Options) {
        self.user = user
        self.options = options
    }
}
