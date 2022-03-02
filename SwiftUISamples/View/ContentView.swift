import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = RateCalendarViewModel()
    
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
                TwoLineImageView(transaction: viewModel.transaction)
                    .onAppear {
                        viewModel.fetchTransaction()
                    }
                
                Divider()
                    .padding(.bottom, URPaddings.large)
                
                Text("First, choose the date you’d like to return the selected equipment.")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 15)
                
                HStack {
                    Text("Pickup Date")
                    Spacer()
                    Image("ic_small_calendar")
                }
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 0) {
                        ForEach(viewModel.models) { leniencyRate in
                            RateCalendarCell(leniencyRate: leniencyRate, callback: {
                                viewModel.setEstimatedCost(cost: leniencyRate.price)})
                        }
                    }
                    .border(Color.gray, width: 2)
                }
                .onAppear(perform: viewModel.fetchLeniencyRates)
                .padding(.horizontal, -15)
                
                Spacer()
                
                EstimatedCostView(cost: viewModel.estimatedCost)
                
                Divider()
                    .padding(EdgeInsets(top: 0, leading: URPaddings.medium, bottom: URPaddings.small, trailing: 0))
                
                NavigationLink(destination: PickupTimeView(viewModel: viewModel)) {
                    Text("Next")
                        .frame(maxWidth: 400, maxHeight: 40)
                        .background(Color.blue.opacity(0.6))
                        .cornerRadius(25)
                }
                .padding(EdgeInsets(top: 0, leading: 16, bottom: 16, trailing: 16))
            }
            .padding(.horizontal, URPaddings.medium)
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
