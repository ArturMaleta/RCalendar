import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = RateCalendarViewModel()
    
    init() {
        let coloredAppearance = UINavigationBarAppearance()
          coloredAppearance.backgroundColor = .blue
          coloredAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
          coloredAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        UINavigationBar.appearance().standardAppearance = coloredAppearance
        UINavigationBar.appearance().compactAppearance = coloredAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
        
        UINavigationBar.appearance().tintColor = .white
    }
    
    var body: some View {
        NavigationView {
            VStack {
                EquipmentDetails(transaction: viewModel.transaction)
                    .onAppear {
                        viewModel.fetchTransaction()
                    }
                
                Divider()
                    .padding(EdgeInsets(top: 0, leading: 15, bottom: 30, trailing: 0))
                
                Text("First, choose the date you’d like to return the selected equipment.")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(EdgeInsets(top: 0, leading: 15, bottom: 15, trailing: 0))
                
                HStack {
                    Text("Pickup Date")
                    Spacer()
                    Image("ic_small_calendar")
                }
                .padding(EdgeInsets(top: 5, leading: 15, bottom: 0, trailing: 15))
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 0) {
                        ForEach(viewModel.models) { leniencyRate in
                            RateCalendarCell(leniencyRate: leniencyRate, callback: {
                                viewModel.setEstimatedCost(cost: leniencyRate.price)})
                        }
                    }
                    .border(Color.gray, width: 2)
                    .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15))
                }
                .onAppear(perform: viewModel.fetchLeniencyRates)
                
                Spacer()
                
                EstimatedCostView(cost: viewModel.estimatedCost)
                
                Divider()
                    .padding(EdgeInsets(top: 0, leading: 15, bottom: 10, trailing: 0))
                
                NavigationLink(destination: PickupTimeView(viewModel: viewModel)) {
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
        .statusBar(hidden: true)
    }
}

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
