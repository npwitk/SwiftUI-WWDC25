//
//  NativeWebView.swift
//  SwiftUI-WWDC25
//
//  Created by Nonprawich I. on 16/6/25.
//

import SwiftUI
import WebKit

struct NativeWebView: View {
    @State private var page = WebPage()
    
    var url: URL {
        URL(string: "https://npwitk.com")!
    }
    
    var body: some View {
//        WebView(url: url)
        
        // Load pages by using WebPage
        
        WebView(page)
            .webViewMagnificationGestures(.disabled)
            .onAppear {
                page.load(URLRequest(url: url))
            }
    }
}

#Preview {
    NativeWebView()
}
