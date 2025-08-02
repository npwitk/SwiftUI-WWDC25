//
//  SwiftUI_WWDC25App.swift
//  SwiftUI-WWDC25
//
//  Created by Nonprawich I. on 16/6/25.
//

import SwiftUI

@main
struct SwiftUI_WWDC25App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        
        AssistiveAccess {
            AssistiveAccessContentView()
        }
    }
}
