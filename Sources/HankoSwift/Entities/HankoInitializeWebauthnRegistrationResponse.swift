import Foundation

struct HankoInitializeWebauthnRegistrationResponse: Decodable {
    
    struct PublicKey: Decodable {
        
        struct Rp: Decodable {
            let name: String
            let id: String
        }
        
        struct User: Decodable {
            let id: String
            let name: String
            let displayName: String
        }
        
        struct PubKeyCredParam: Decodable {
            let type: String
            let alg: Int
        }
        
        struct AuthenticatorSelection: Decodable {
            enum AuthenticatorAttachment: String, Decodable {
                case platform, crossPlatform = "cross-platform"
            }
            
            enum ResidentKey: String, Decodable {
                case discouraged, preferred, required
            }
            
            let authenticatorAttachment: AuthenticatorAttachment
            let requireResidentKey: Bool
            let residentKey: ResidentKey
            let userVerification: ResidentKey
        }
        
        enum Attestation: String, Decodable {
            case none, indirect, direct, enterprise
        }
        
        let rp: Rp
        let user: User
        let challenge: String
        let pubKeyCredParams: [PubKeyCredParam]
        let timeout: Int
        let authenticatorSelection: AuthenticatorSelection
        let attestation: Attestation
    }
    
    let publicKey: PublicKey
}
