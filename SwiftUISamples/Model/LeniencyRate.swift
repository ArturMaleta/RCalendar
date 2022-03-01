import Foundation

class LeniencyRate: Identifiable {
    public let price: Double
    public let type: LeniencyType
    public let date: String

    public init(price: Double = .zero,
                type: LeniencyType = .normal,
                date: String = "01/01/2000") {
        self.price = price
        self.type = type
        self.date = date
    }
    
    public enum LeniencyType {
        case normal
        case singleLeniency
        case startLeniency
        case middleLeniency
        case endLenienicy
    }
}
