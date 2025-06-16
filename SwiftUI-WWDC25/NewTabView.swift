//
//  NewTabView.swift
//  SwiftUI-WWDC25
//
//  Created by Nonprawich I. on 16/6/25.
//

import SwiftUI

struct NewTabView: View {
    var body: some View {
        TabView {
            Tab("Home", systemImage: "house") {
                ScrollView {
                    Text("Home")
                        .containerRelativeFrame([.horizontal])
                        .containerRelativeFrame(.vertical) { value, _ in
                            value * 2
                        }
                }
            }
            
            Tab("Profile", systemImage: "person") {
                Text("Profile")
            }
            
            Tab("Settings", systemImage: "gear") {
                Text("Settings")
            }
            
            Tab("Search", systemImage: "magnifyingglass", role: .search) {
                Text("Search")
            }
        }
        .tabViewBottomAccessory {
            Text("This is Apple Music!")
        }
        .tabBarMinimizeBehavior(.onScrollDown)
    }
}

#Preview {
    NewTabView()
}
