import Foundation

struct User: Identifiable, Decodable {
    let id: Int
    let name: String
    let email: String
}
