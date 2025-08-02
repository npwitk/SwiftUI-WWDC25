//
//  ConcentricRectangle.swift
//  SwiftUI-WWDC25
//
//  Created by Nonprawich I. on 2/8/25.
//

import SwiftUI

struct ConcentricRectangleView: View {
    @State private var padding: CGFloat = 10
    
    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .fill(.black.gradient)
                    .clipShape(.rect(corners: .concentric(), isUniform: true))
                
                Rectangle()
                    .fill(.blue.gradient)
                    .clipShape(.rect(corners: .concentric(), isUniform: true))
                    .padding(padding)
            }
            .frame(height: 500)
            .containerShape(.rect(cornerRadius: 60))
            
            Spacer()
            
            Slider(value: $padding, in: 0...20)
        }
        .padding()
    }
}

struct ConcentricRectangleView2: View {
    @State private var padding: CGFloat = 10
    
    var body: some View {
        Spacer()
        
        Slider(value: $padding, in: 0...20)
            .padding()
        
        VStack {
            Spacer()
            
            ZStack(alignment: .bottom) {
                Rectangle()
                    .fill(.gray.gradient)
                    .frame(height: 500)
                    .clipShape(.rect(corners: .concentric(), isUniform: true))
                
                Rectangle()
                    .fill(.white.gradient)
                    .frame(height: 70)
                    .clipShape(.rect(corners: .concentric(), isUniform: true))
                    .padding()
                    
            }
        }
        .padding(padding)
        .ignoresSafeArea()
    }
}

#Preview {
    ConcentricRectangleView()
}

#Preview {
    ConcentricRectangleView2()
}
