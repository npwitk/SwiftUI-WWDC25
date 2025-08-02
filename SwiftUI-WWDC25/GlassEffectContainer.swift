//
//  GlassEffectContainer.swift
//  SwiftUI-WWDC25
//
//  Created by Nonprawich I. on 16/6/25.
//

import SwiftUI

/// Used for Morphing and Grouping
struct GlassEffectContainerView: View {
    @State private var isExpanded: Bool = false
    @Namespace private var namespace
    let symbolSet: [String] = ["cloud.bolt.rain.fill", "sun.rain.fill", "moon.stars.fill", "moon.fill"]

    var body: some View {
        ZStack {
            Image(.applePark)
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                GlassEffectContainer(spacing: 20) {
                    HStack(spacing: 20) {
                        ForEach(symbolSet.indices, id: \.self) { item in
                            Image(systemName: symbolSet[item])
                                .frame(width: 80, height: 80)
                                .font(.system(size: 36))
                                .glassEffect()
                                .glassEffectUnion(id: item < 2 ? "1" : "2", namespace: namespace)
                        }
                    }
                }

                GlassEffectContainer(spacing: 40) {
                    HStack(spacing: 40) {
                        Image(systemName: "scribble.variable")
                            .frame(width: 80, height: 80)
                            .font(.system(size: 36))
                            .glassEffect(.regular.interactive())
                            .offset(x: 20)

                        Image(systemName: "eraser.fill")
                            .frame(width: 80, height: 80)
                            .font(.system(size: 36))
                            .glassEffect(.regular.interactive())
                            .offset(x: -20)
                    }
                }

                GlassEffectContainer(spacing: 40) {
                    HStack(spacing: 30) {
                        Image(systemName: "scribble.variable")
                            .frame(width: 60, height: 60)
                            .font(.system(size: 24))
                            .glassEffect()
                            .glassEffectID("pencil", in: namespace)

                        if isExpanded {
                            Image(systemName: "eraser.fill")
                                .frame(width: 60, height: 60)
                                .font(.system(size: 24))
                                .glassEffect()
                                .glassEffectID("eraser", in: namespace)
                        }
                    }
                }
                
                Button("Toggle") {
                    withAnimation {
                        isExpanded.toggle()
                    }
                }
                .buttonStyle(.glassProminent)
            }
        }
    }
}

#Preview {
    GlassEffectContainerView()
}
