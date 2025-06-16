//
//  GlassEffectContainer.swift
//  SwiftUI-WWDC25
//
//  Created by Nonprawich I. on 16/6/25.
//

import SwiftUI

/// Used for Morphing and Grouping
struct GlassEffectContainer: View {
    @Namespace private var namespace
    let symbolSet: [String] = ["cloud.bolt.rain.fill", "sun.rain.fill", "moon.stars.fill", "moon.fill"]
    
    var body: some View {
//        GlassEffectContainer(spacing: 20.0) { // Maybe a bug for beta 1?
            HStack(spacing: 20.0) {
                ForEach(symbolSet.indices, id: \.self) { item in
                    Image(systemName: symbolSet[item])
                        .frame(width: 50, height: 50)
                        .font(.system(size: 18))
                        .glassEffect()
                        .glassEffectUnion(id: item < 2 ? "1" : "2", namespace: namespace)
                }
            }
//        }
    }
}

#Preview {
    GlassEffectContainer()
}
