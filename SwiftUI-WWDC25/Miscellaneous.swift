//
//  Miscellaneous.swift
//  SwiftUI-WWDC25
//
//  Created by Nonprawich I. on 22/6/25.
//

import SwiftUI

struct Miscellaneous: View {
    var body: some View {
        Label("Hello Planet!", systemImage: "globe")
            .labelIconToTitleSpacing(50)
        
        VStack {
            Button("Example", systemImage: "plus") { }
            Button("Example", systemImage: "envelope.front") { }
        }
        .font(.largeTitle)
        .labelReservedIconWidth(50)
    }
}

#Preview {
    Miscellaneous()
}
