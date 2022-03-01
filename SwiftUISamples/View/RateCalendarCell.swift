import SwiftUI

struct RateCalendarCell: View {
    let leniencyRate: LeniencyRate
    let callback: () -> ()
    
    var body: some View {
            VStack(alignment: .center) {
                Text("\(leniencyRate.date)")
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("September")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 5)
                ZStack {
                    Rectangle()
                        .fill(Color.blue)
                        .frame(height: 20, alignment: .leading)
                        .cornerRadius(25)
                        .padding(EdgeInsets(top: 0, leading: -7, bottom: 0, trailing: -7))
                    Text("$\(Int(leniencyRate.price))")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 10)
                }
                RadioButton("1", callback: callback, selectedID: "123")
                    .frame(width: 20, alignment: .center)
            }
            .frame(width: 100, alignment: .center)
            .padding(10)
            .border(width: 1, edges: [.leading], color: Color.gray)
        }
}

extension View {
    func border(width: CGFloat, edges: [Edge], color: Color) -> some View {
        overlay(EdgeBorder(width: width, edges: edges).foregroundColor(color))
    }
}

struct EdgeBorder: Shape {
    var width: CGFloat
    var edges: [Edge]
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        for edge in edges {
            var x: CGFloat {
                switch edge {
                case .top, .bottom, .leading: return rect.minX
                case .trailing: return rect.maxX - width
                }
            }
            
            var y: CGFloat {
                switch edge {
                case .top, .leading, .trailing: return rect.minY
                case .bottom: return rect.maxY - width
                }
            }
            
            var w: CGFloat {
                switch edge {
                case .top, .bottom: return rect.width
                case .leading, .trailing: return self.width
                }
            }
            
            var h: CGFloat {
                switch edge {
                case .top, .bottom: return self.width
                case .leading, .trailing: return rect.height
                }
            }
            path.addPath(Path(CGRect(x: x, y: y, width: w, height: h)))
        }
        return path
    }
}
