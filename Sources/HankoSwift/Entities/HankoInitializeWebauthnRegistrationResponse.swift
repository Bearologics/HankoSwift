import Foundation

public struct HankoInitializeWebauthnRegistrationResponse: Decodable {
    public struct PublicKey: Decodable {
        public struct Rp: Decodable {
            public let name: String
            public let id: String
        }
        
        public struct User: Decodable {
            public let id: String
            public let name: String
            public let displayName: String
        }
        
        public struct PubKeyCredParam: Decodable {
            public let type: String
            public let alg: Int
        }
        
        public struct AuthenticatorSelection: Decodable {
            public enum AuthenticatorAttachment: String, Decodable {
                case platform, crossPlatform = "cross-platform"
            }
            
            public enum ResidentKey: String, Decodable {
                case discouraged, preferred, required
            }
            
            public let authenticatorAttachment: AuthenticatorAttachment
            public let requireResidentKey: Bool
            public let residentKey: ResidentKey
            public let userVerification: ResidentKey
        }
        
        public enum Attestation: String, Decodable {
            case none, indirect, direct, enterprise
        }
        
        public let rp: Rp
        public let user: User
        public let challenge: String
        public let pubKeyCredParams: [PubKeyCredParam]
        public let timeout: Int
        public let authenticatorSelection: AuthenticatorSelection
        public let attestation: Attestation
    }
    
    public let publicKey: PublicKey
}
