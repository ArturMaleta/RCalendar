import Foundation

struct Transaction {
    public let name: String
    public let equipmentId: String
    public let imageUrl: URL?
    
    init(
        name: String,
        equipmentId: String,
        imageUrl: URL?) {
            self.name = name
            self.equipmentId = equipmentId
            self.imageUrl = imageUrl
        }
}
