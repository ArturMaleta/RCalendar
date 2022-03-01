import SwiftUI

struct EstimatedCostView: View {
    let cost: Double
    
    var body: some View {
        HStack {
            Text("Estimated Cost")
            Spacer()
            Text("$\(Int(cost))")
                .foregroundColor(Color(red: 60/255, green: 60/255, blue: 67/255))
                .opacity(0.6)
        }
        .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15))
    }
}
