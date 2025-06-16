//
//  LiquidGlass.swift
//  SwiftUI-WWDC25
//
//  Created by Nonprawich I. on 16/6/25.
//

import SwiftUI

struct LiquidGlass: View {
    @State private var offsetY: CGFloat = 150
    @State private var animate = false
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                Rectangle()
                    .fill(Color.black)
                    .frame(width: 300, height: 300)
                
                Rectangle()
                    .fill(Color(white: 0.95))
                    .frame(width: 300, height: 300)
            }
            .offset(y: offsetY)
            .onAppear {
                withAnimation(Animation.easeInOut(duration: 3).repeatForever(autoreverses: true)) {
                    offsetY = -150
                }
            }
            
            VStack {
                Button("Button") { }
                    .buttonStyle(.glass)
                
                Image(systemName: "suit.heart.fill")
                    .font(.largeTitle)
                    .foregroundStyle(.red.gradient)
                    .frame(width: 80, height: 50)
                //                    .glassEffect(.regular, in: .capsule)
                    .glassEffect(.regular.tint(.yellow.opacity(0.35)).interactive(), in: .capsule)
            }
        }
    }
}

#Preview {
    LiquidGlass()
}
