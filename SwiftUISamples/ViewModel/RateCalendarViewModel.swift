import SwiftUI

class RateCalendarViewModel: ObservableObject {
    @Published var models = [LeniencyRate]()
    @Published var transaction: Transaction = Transaction(name: "", equipmentId: "", imageUrl: nil)
    @Published var estimatedCost: Double = 0.0
    @Published var day: Date = Date.distantPast
    @Published var hour: Date = Date.distantPast
    
    func fetchTransaction() {
        transaction = Transaction(
            name: "4-wheel Drive Heavy-duty Articulating Boom Lift, 45 ft.",
            equipmentId: "0123456789",
            imageUrl: URL(string: "https://www.unitedrentals.com/sites/default/files/styles/square_1_1_414x414/public/2020-01/300-1000.jpg"))
    }
    
    func fetchLeniencyRates() {
        models = [
            LeniencyRate(price: 60.0, type: LeniencyRate.LeniencyType.normal, date: "01/01"),
            LeniencyRate(price: 10.0, type: LeniencyRate.LeniencyType.normal, date: "01/02"),
            LeniencyRate(price: 110.0, type: LeniencyRate.LeniencyType.normal, date: "01/03"),
            LeniencyRate(price: 120.0, type: LeniencyRate.LeniencyType.normal, date: "01/04"),
            LeniencyRate(price: 11.0, type: LeniencyRate.LeniencyType.normal, date: "01/05"),
            LeniencyRate(price: 30.0, type: LeniencyRate.LeniencyType.normal, date: "01/06"),
            LeniencyRate(price: 40.0, type: LeniencyRate.LeniencyType.normal, date: "01/07"),
            LeniencyRate(price: 99.0, type: LeniencyRate.LeniencyType.normal, date: "01/08"),
            LeniencyRate(price: 660.0, type: LeniencyRate.LeniencyType.normal, date: "01/09"),
            LeniencyRate(price: 99.0, type: LeniencyRate.LeniencyType.normal, date: "01/10"),
            LeniencyRate(price: 99.0, type: LeniencyRate.LeniencyType.normal, date: "01/11"),
            LeniencyRate(price: 99.0, type: LeniencyRate.LeniencyType.normal, date: "01/12"),
            LeniencyRate(price: 12.0, type: LeniencyRate.LeniencyType.normal, date: "01/13"),
            LeniencyRate(price: 3.0, type: LeniencyRate.LeniencyType.normal, date: "01/14"),
            LeniencyRate(price: 6.0, type: LeniencyRate.LeniencyType.normal, date: "01/15"),
            LeniencyRate(price: 7.0, type: LeniencyRate.LeniencyType.normal, date: "01/16"),
            LeniencyRate(price: 70.0, type: LeniencyRate.LeniencyType.normal, date: "01/17"),
            LeniencyRate(price: 12360.0, type: LeniencyRate.LeniencyType.normal, date: "01/18"),
            LeniencyRate(price: 778.0, type: LeniencyRate.LeniencyType.normal, date: "01/19"),
            LeniencyRate(price: 9.0, type: LeniencyRate.LeniencyType.normal, date: "01/20")
        ]
    }
    
    func setEstimatedCost(cost: Double) {
        estimatedCost = cost
    }
}
