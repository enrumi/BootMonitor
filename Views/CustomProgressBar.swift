import SwiftUI

struct CustomProgressBar: View {
    var value: Double
    var total: Double
    var title: String
    var usedText: String
    var totalText: String
    
    var progress: Double {
        guard total > 0 else { return 0 }
        return min(value / total, 1.0)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(title)
                    .font(.headline)
                    .fontWeight(.semibold)
                
                Spacer()
                
                Text("\(usedText) / \(totalText)")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    // Background
                    Rectangle()
                        .fill(Color.gray.opacity(0.3))
                        .cornerRadius(8)
                    
                    // Progress
                    Rectangle()
                        .fill(LinearGradient(
                            gradient: Gradient(colors: [.blue, .purple]),
                            startPoint: .leading,
                            endPoint: .trailing)
                        )
                        .cornerRadius(8)
                        .frame(width: CGFloat(progress) * geometry.size.width)
                        .animation(.easeInOut(duration: 0.5), value: progress)
                }
            }
            .frame(height: 16)
            
            Text("\(Int(progress * 100))%")
                .font(.caption)
                .foregroundColor(.secondary)
                .frame(maxWidth: .infinity, alignment: .trailing)
        }
    }
}