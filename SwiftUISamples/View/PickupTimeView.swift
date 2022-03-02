import SwiftUI

struct PickupTimeView: View {
    @ObservedObject var viewModel: RateCalendarViewModel
    
    var body: some View {
            VStack {
                TwoLineImageView(transaction: viewModel.transaction)
                    .onAppear {
                        viewModel.fetchTransaction()
                    }
                
                Divider()
                    .padding(EdgeInsets(top: 0, leading: 16, bottom: 32, trailing: 0))
                
                Text("Now, choose the time of day for your pickup.")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(EdgeInsets(top: 0, leading: 16, bottom: 16, trailing: 16))
                
                
                DatePicker(
                    selection: $viewModel.day,
                    in: Date()...,
                    displayedComponents: [.date]
                ) {
                    Text("Day")
                }
                    .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                    .frame(height: 50)
                
                Divider()
                    .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 0))
                
                DatePicker(
                    "Hour",
                    selection: $viewModel.hour,
                    displayedComponents: [.hourAndMinute]
                )
                    .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                    .frame(height: 50)
                
                Spacer()
                
                EstimatedCostView(cost: viewModel.estimatedCost)
                
                Divider()
                    .padding(EdgeInsets(top: 0, leading: 16, bottom: 8, trailing: 0))
                
                
                NavigationLink(destination: ConfirmationView(viewModel: viewModel)) {
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
