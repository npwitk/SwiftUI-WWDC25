//
//  BackgroundExtension.swift
//  SwiftUI-WWDC25
//
//  Created by Nonprawich I. on 16/6/25.
//

import SwiftUI

struct BackgroundExtension: View {
    var body: some View {
        GeometryReader {
            let size = $0.size
            
            Image(.applePark)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: size.width, height: size.height)
                .clipped()
                .backgroundExtensionEffect()
        }
    }
}

#Preview {
    BackgroundExtension()
}
