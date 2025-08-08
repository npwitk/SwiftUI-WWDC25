//
//  DraggableGlassView.swift
//  SwiftUI-WWDC25
//
//  Created by Nonprawich I. on 8/8/25.
//

// Credits: https://livsycode.com/swiftui/glass-options-in-ios-26-clear-vs-regular-frosted-glass/

import SwiftUI

@available(iOS 26.0, *)
struct DraggableGlassView: View {
    @State private var firstCircleOffset: CGSize = .zero
    @State private var firstCircleDragOffset: CGSize = .zero

    @State private var secondCircleOffset: CGSize = .zero
    @State private var secondCircleDragOffset: CGSize = .zero

    @State private var isFirstClear: Bool = true
    @State private var isSecondClear: Bool = false

    @State private var firstGlass: Glass = .clear
    @State private var secondGlass: Glass = .regular

    var body: some View {
        ZStack {
            Image(.applePark)
                .resizable()
                .scaledToFill()

            GlassEffectContainer {
                HStack {
                    Circle()
                        .glassEffect(firstGlass)
                        .frame(width: 180)
                        .offset(
                            x: firstCircleOffset.width + firstCircleDragOffset.width,
                            y: firstCircleOffset.height + firstCircleDragOffset.height
                        )
                        .gesture(
                            DragGesture()
                                .onChanged { gesture in
                                    firstCircleDragOffset = gesture.translation
                                }
                                .onEnded { gesture in
                                    firstCircleOffset.width += gesture.translation.width
                                    firstCircleOffset.height += gesture.translation.height
                                    firstCircleDragOffset = .zero
                                }
                        )

                    Circle()
                        .glassEffect(secondGlass)
                        .frame(width: 180)
                        .offset(
                            x: secondCircleOffset.width + secondCircleDragOffset.width,
                            y: secondCircleOffset.height + secondCircleDragOffset.height
                        )
                        .gesture(
                            DragGesture()
                                .onChanged { gesture in
                                    secondCircleDragOffset = gesture.translation
                                }
                                .onEnded { gesture in
                                    secondCircleOffset.width += gesture.translation.width
                                    secondCircleOffset.height += gesture.translation.height
                                    secondCircleDragOffset = .zero
                                }
                        )
                }
            }
        }
        .toolbar {
            ToolbarItemGroup(placement: .bottomBar) {
                Toggle("1", isOn: $isFirstClear)
                Toggle("2", isOn: $isSecondClear)
            }
        }
        .onChange(of: isFirstClear) { _, newValue in
            firstGlass = newValue ? .clear : .regular
        }
        .onChange(of: isSecondClear) { _, newValue in
            secondGlass = newValue ? .clear : .regular
        }
        .ignoresSafeArea()
    }
}

#Preview {
    DraggableGlassView()
}
