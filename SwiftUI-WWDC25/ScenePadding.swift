//
//  ScenePadding.swift
//  SwiftUI-WWDC25
//
//  Created by Nonprawich I. on 22/6/25.
//

import SwiftUI

struct ScenePadding: View {
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 24) {
                Text("General")
                    .font(.headline)
                
                Toggle("Enable Notifications", isOn: .constant(true))
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("About")
                        .font(.headline)
                    Text("App version 1.0.3 (Build 42)")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
                
                Spacer()
            }
            .scenePadding(.horizontal)
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    ScenePadding()
}
