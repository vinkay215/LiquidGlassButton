//
//  ContentView.swift
//  LiquidGlass Button
//
//  Created by Nguyễn Quốc Vinh (Github:Vinkay215) on 06/11/2025.
//

import SwiftUI
import UIKit

// Custom Blur View với blur radius có thể điều chỉnh
struct BlurView: UIViewRepresentable {
    var style: UIBlurEffect.Style = .systemMaterial
    var intensity: CGFloat = 1.0
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: style))
        return view
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        // Điều chỉnh blur intensity nếu cần
    }
}

struct InnerShadow: View {
    var color: Color
    var radius: CGFloat
    var x: CGFloat
    var y: CGFloat
    var cornerRadius: CGFloat
    var startPoint: UnitPoint = .top
    var endPoint: UnitPoint = .bottom
    var spread: CGFloat = 0.5
    
    var body: some View {
        GeometryReader { geometry in
            // Tạo shadow với gradient có thể điều chỉnh hướng
            RoundedRectangle(cornerRadius: cornerRadius)
                .fill(
                    LinearGradient(
                        gradient: Gradient(stops: [
                            .init(color: color, location: 0),
                            .init(color: color.opacity(0.5), location: 0.15),
                            .init(color: .clear, location: 0.3)
                        ]),
                        startPoint: startPoint,
                        endPoint: endPoint
                    )
                )
                .blur(radius: radius)
                .offset(x: x, y: y)
                .frame(width: geometry.size.width, height: geometry.size.height)
                .mask(
                    // Mask với spread để shadow lan rộng vào bên trong
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .fill(
                            LinearGradient(
                                gradient: Gradient(stops: [
                                    .init(color: .black, location: 0),
                                    .init(color: .black.opacity(0.7), location: spread),
                                    .init(color: .clear, location: spread + 0.2)
                                ]),
                                startPoint: startPoint,
                                endPoint: endPoint
                            )
                        )
                )
        }
    }
}

// Glass Button Component
struct GlassButton: View {
    var title: String
    var scale: CGFloat = 1.0
    
    var body: some View {
        Button(title) {
        }
        .font(.system(size: 17 * scale))
        .padding(.horizontal, 20 * scale)
        .padding(.vertical, 14 * scale)
        .background(
            ZStack {
                Color.white.opacity(0.01)
                BlurView(style: .systemUltraThinMaterial)
                    .opacity(0.2)
            }
            .clipShape(RoundedRectangle(cornerRadius: 23 * scale))
        )
        .foregroundColor(.white)
        .cornerRadius(23 * scale)
        // Inner Shadow: position x: 0, y: 2, blur: 4, color FFFFFF 40%, inside: 0.5
        .overlay(
            InnerShadow(
                color: Color.white.opacity(0.4),
                radius: 4 * scale,
                x: 0,
                y: 2 * scale,
                cornerRadius: 23 * scale,
                startPoint: .top,
                endPoint: .bottom,
                spread: 0.5
            )
        )
        // Inner Shadow phía dưới: position x: 0, y: -2, blur: 4, color 000000 25%, inside: 0.5
        .overlay(
            InnerShadow(
                color: Color.black.opacity(0.2),
                radius: 4 * scale,
                x: 0,
                y: -2 * scale,
                cornerRadius: 23 * scale,
                startPoint: .bottom,
                endPoint: .top,
                spread: 0.5
            )
        )
        // Stroke với linear gradient
        .overlay(
            RoundedRectangle(cornerRadius: 23 * scale)
                .stroke(
                    LinearGradient(
                        stops: [
                            // Stop 0%: màu trắng opacity 5%
                            .init(color: Color.white.opacity(0.05), location: 0.0),
                            // Stop 50%: màu trắng opacity 100%
                            .init(color: Color.white.opacity(1.0), location: 0.5),
                            // Stop 100%: màu trắng opacity 5%
                            .init(color: Color.white.opacity(0.05), location: 1.0)
                        ],
                        // Gradient góc 45 độ: từ góc trên phải đến góc dưới trái
                        startPoint: .topTrailing,
                        endPoint: .bottomLeading
                    ),
                    lineWidth: 1 * scale
                )
        )
    }
}

struct ContentView: View {
    var body: some View {
        ZStack {
            Image("Background")
                .resizable()
                .scaledToFill()
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .ignoresSafeArea(.all)
            
            VStack(spacing: 20) {
                GlassButton(title: "Vinkay", scale: 1.0)
                
                // Button với kích thước x2
                GlassButton(title: "button", scale: 2.0)
                
                // Button với kích thước x3
                GlassButton(title: "button", scale: 3.0)
            }
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
