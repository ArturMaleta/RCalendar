import SwiftUI

struct RadioButton: View {

    let id: String
    let callback: () -> ()
    let selectedID : String
    let size: CGFloat
    let color: Color

    init(
        _ id: String,
        callback: @escaping () -> (),
        selectedID: String,
        size: CGFloat = 20,
        color: Color = Color.primary
    ) {
        self.id = id
        self.size = size
        self.color = color
        self.selectedID = selectedID
        self.callback = callback
    }

    var body: some View {
        Button(action:{
            self.callback()
        }) {
            HStack(alignment: .center, spacing: 10) {
                Image(systemName: self.selectedID == self.id ? "largecircle.fill.circle" : "circle")
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: self.size, height: self.size)
            }.foregroundColor(self.color)
        }
        .foregroundColor(self.color)
    }
}
