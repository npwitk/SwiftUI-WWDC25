//
//  ListSectionLabel.swift
//  SwiftUI-WWDC25
//
//  Created by Nonprawich I. on 22/6/25.
//

import SwiftUI

struct ListSectionLabel: View {
    let letters = ["A", "B", "C", "D", "E", "F", "G"]
    
    var body: some View {
        List(letters, id: \.self) { letter in
            Section(letter) {
                ForEach(0..<10) { number in
                    Text("Row \(number)")
                }
            }
            .sectionIndexLabel(letter)
        }
//        .listSectionIndexVisibility(.hidden)
    }
}

#Preview {
    ListSectionLabel()
}
