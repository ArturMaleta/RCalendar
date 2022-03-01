import SwiftUI

struct EquipmentDetails: View {
    let transaction: Transaction
    
    var body: some View {
        HStack {
            AsyncImage(url: transaction.imageUrl) { phase in
                if let image = phase.image {
                    image.resizable()
                } else if phase.error != nil {
                    Color.red
                } else {
                    Color.blue
                }
            }
            .frame(width: 60, height: 60)
            .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15))
            VStack {
                Text("Equipment ID: \(transaction.equipmentId)")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(Color(red: 142/255, green: 142/255, blue: 147/255))
                Text(transaction.name)
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(EdgeInsets(top: 0, leading: -5, bottom: 0, trailing: 15))
        }
        .padding(EdgeInsets(top: 16, leading: 0, bottom: 10, trailing: 0))
    }
}
