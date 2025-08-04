//
//  Navigation.swift
//  SwiftUI-WWDC25
//
//  Created by Nonprawich I. on 22/6/25.
//

import SwiftUI

struct Navigation: View {
    var body: some View {
        Text("SwiftUI")
            .navigationTitle("Welcome")
            .navigationSubtitle("Select an option")
    }
}

#Preview {
    NavigationStack {
        Navigation()
    }
}
