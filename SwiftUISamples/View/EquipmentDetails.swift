import SwiftUI

struct TwoLineImageView: View {
    let imageURL: URL?
    let title: String
    let subtitle: String
    
    var body: some View {
        
        HStack(spacing: .zero) {
            AsyncImage(url: imageURL) { phase in
                if let image = phase.image {
                    image.resizable()
                } else if phase.error != nil {
                    Color.red
                } else {
                    Color.blue
                }
            }
            .frame(width: Constants.imageSize, height: Constants.imageSize)
            .padding(.horizontal, URPaddings.medium)
            
            VStack(alignment: .leading) {
                Text(subtitle)
                    .foregroundColor(.secondary)
                    .font(.subheadline)
                Text(title)
                    .multilineTextAlignment(.leading)
                    .font(.title)
            }
            .padding(.trailing, URPaddings.medium)
            
            Spacer()
        }
        .padding(.vertical, URPaddings.medium)
    }
    
    private enum Constants {
        static var imageSize: CGFloat = 60.0
    }
}

extension TwoLineImageView {
    init(transaction: Transaction) {
        self.init(imageURL: transaction.imageUrl, title: transaction.name, subtitle: "Equipment ID: \(transaction.equipmentId)")
    }
}

struct URPaddings {
    static let small: CGFloat = 8.0
    static let medium: CGFloat = 16.0
    static let large: CGFloat = 32.0
}
