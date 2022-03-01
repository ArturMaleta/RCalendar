import SwiftUI

struct ConfirmationView: View {
    @ObservedObject var viewModel: RateCalendarViewModel
    @Environment(\.presentationMode) var presentation
    
    var dayFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter
    }
    
    var hourFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter
    }
    
    var body: some View {
        VStack {
            EquipmentDetails(transaction: viewModel.transaction)
                .onAppear {
                    viewModel.fetchTransaction()
                }
            
            Divider()
                .padding(EdgeInsets(top: 0, leading: 15, bottom: 30, trailing: 0))
            
            Text("Day is - \(dayFormatter.string(from: viewModel.day))")
                .padding(30)

            Text("Hour is - \(hourFormatter.string(from: viewModel.hour))")
                .padding(30)
            
            Spacer()
            
            EstimatedCostView(cost: viewModel.estimatedCost)
            
            Divider()
                .padding(EdgeInsets(top: 0, leading: 15, bottom: 10, trailing: 0))
            
            
            VStack {
                Text("Next")
                    .frame(maxWidth: 400, maxHeight: 40)
                    .background(Color.blue.opacity(0.6))
                    .cornerRadius(25)
            }
            .padding(EdgeInsets(top: 0, leading: 16, bottom: 16, trailing: 16))

        }
        .navigationBarItems(
            trailing: Button("Cancel") {
                print("close whole request pickup")
            })
        .navigationTitle("Request Pickup")
        .navigationBarTitleDisplayMode (.inline)
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
