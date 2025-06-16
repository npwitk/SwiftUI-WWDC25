//
//  SFSymbolEffects.swift
//  SwiftUI-WWDC25
//
//  Created by Nonprawich I. on 17/6/25.
//

import SwiftUI

struct SFSymbolEffects: View {
    @State private var isActive: Bool = false
    
    var body: some View {
        Image(systemName: "arrow.counterclockwise")
            .font(.system(size: 300))
            .symbolEffect(.drawOn, isActive: isActive)
            .onTapGesture {
                isActive.toggle()
            }
    }
}

#Preview {
    SFSymbolEffects()
}
