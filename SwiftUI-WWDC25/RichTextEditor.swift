//
//  RichTextEditor.swift
//  SwiftUI-WWDC25
//
//  Created by Nonprawich I. on 16/6/25.
//

import SwiftUI

struct RichTextEditor: View {
    @State private var richText = AttributedString()
    var body: some View {
        TextEditor(text: $richText)
            .frame(height: 300)
            .padding(15)
    }
}

#Preview {
    RichTextEditor()
}
