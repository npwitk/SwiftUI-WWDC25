//
//  GlassEffectTransitionView.swift
//  SwiftUI-WWDC25
//
//  Created by Nonprawich I. on 6/8/25.
//

import SwiftUI

struct GlassEffectTransitionView: View {
    @State private var isShown: Bool = true
    
    var body: some View {
        ZStack {
            Image(.applePark)
                .ignoresSafeArea()
            
            GlassEffectContainer {
                VStack(spacing: 20) {
                    
                    if isShown {
                        Text("Glassssssyyy!")
                            .font(.largeTitle)
                            .bold()
                            .padding(30)
                            .glassEffect(.clear)
                            .glassEffectTransition(.materialize)
                    }
                }
            }
            
            Button(isShown ? "Hide" : "Show") {
                withAnimation {
                    isShown.toggle()
                }
            }
            .offset(y: 100)
            .buttonStyle(.glassProminent)
        }
        
    }
}

#Preview {
    GlassEffectTransitionView()
}
