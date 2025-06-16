//
//  ToolBarSpacer.swift
//  SwiftUI-WWDC25
//
//  Created by Nonprawich I. on 17/6/25.
//

import SwiftUI

struct ToolBarSpacer: View {
    var body: some View {
        NavigationStack {
            List {
                
            }
            .navigationTitle("Todo's")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    HStack {
                        Button("", systemImage: "heart.fill") { }
                        
                        Button("", systemImage: "magnifyingglass") { }
                    }
                }
                
                ToolbarSpacer(.fixed, placement: .topBarTrailing)
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button("", systemImage: "person.fill") { }
                }
            }
        }
    }
}

#Preview {
    ToolBarSpacer()
}
