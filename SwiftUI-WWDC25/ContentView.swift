//
//  ContentView.swift
//  SwiftUI-WWDC25
//
//  Created by Nonprawich I. on 16/6/25.
//

import SwiftUI

enum Destination: String, CaseIterable, Identifiable {
    case animatableMacro = "Animatable Macro"
    case assistiveAccess = "Assistive Access"
    case backgroundExtension = "Background Extension"
    case concentricRectangle = "Concentric Rectangle"
    case foundationModels = "Foundation Models"
    case glassEffectContainer = "Glass Effect Container"
    case liquidGlass = "Liquid Glass"
    case listSectionLabel = "List Section Label"
    case miscellaneous = "Miscellaneous"
    case nativeWebView = "Native Web View"
    case navigation = "Navigation"
    case newTabView = "New Tab View"
    case richTextEditor = "Rich Text Editor"
    case scenePadding = "Scene Padding"
    case sfSymbolEffects = "SF Symbol Effects"
    case swiftCharts3D = "Swift Charts 3D"
    case toolBarSpacer = "Toolbar Spacer"
    
    var id: String { self.rawValue }
}

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                ForEach(Destination.allCases) { destination in
                    NavigationLink(destination.rawValue, value: destination)
                }
            }
            .navigationTitle("SwiftUI Examples")
            .navigationDestination(for: Destination.self) { destination in
                destinationView(for: destination)
                    .navigationTitle(destination.rawValue)
            }
        }
    }
    
    @ViewBuilder
    private func destinationView(for destination: Destination) -> some View {
        switch destination {
        case .animatableMacro:
            AnimatableMacro()
        case .assistiveAccess:
            NormalView()
        case .backgroundExtension:
            BackgroundExtension()
        case .concentricRectangle:
            ConcentricRectangleView2()
        case .foundationModels:
            FoundationModels()
        case .glassEffectContainer:
            GlassEffectContainerView()
        case .liquidGlass:
            LiquidGlass()
        case .listSectionLabel:
            ListSectionLabel()
        case .miscellaneous:
            Miscellaneous()
        case .nativeWebView:
            NativeWebView()
        case .navigation:
            Navigation()
        case .newTabView:
            NewTabView()
        case .richTextEditor:
            RichTextEditor()
        case .scenePadding:
            ScenePadding()
        case .sfSymbolEffects:
            SFSymbolEffects()
        case .swiftCharts3D:
            SwiftCharts3D()
        case .toolBarSpacer:
            ToolBarSpacer()
        }
    }
}

#Preview {
    ContentView()
}
