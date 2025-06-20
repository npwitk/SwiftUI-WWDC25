//
//  ContentView.swift
//  SwiftUI-WWDC25
//
//  Created by Nonprawich I. on 16/6/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, OS 26!")
                .bold()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
