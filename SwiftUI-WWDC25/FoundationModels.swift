//
//  FoundationModels.swift
//  SwiftUI-WWDC25
//
//  Created by Nonprawich I. on 16/6/25.
//

import FoundationModels
import SwiftUI

enum ModelMode: String, CaseIterable {
    case normal = "Normal"
    case streaming = "Streaming"
}

struct FoundationModels: View {
    @State private var prompt: String = ""
    @State private var answer: String = ""
    @State private var isDisabled: Bool = false
    @State private var mode: ModelMode = .normal
    
    var body: some View {
        NavigationStack {
            ScrollView {
                Text(answer)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .multilineTextAlignment(.leading)
                    .padding(15)
            }
            .frame(maxHeight: .infinity)
            
            VStack {
                Picker("Mode", selection: $mode) {
                    ForEach(ModelMode.allCases, id: \.self) { mode in
                        Text(mode.rawValue)
                    }
                }
                .pickerStyle(.segmented)
                
                HStack(spacing: 10) {
                    TextField("Prompt", text: $prompt)
                        .padding(.horizontal, 15)
                        .padding(.vertical, 10)
                        .glassEffect(.regular, in: .capsule)
                    
                    Button {
                        Task {
                            guard !prompt.isEmpty else { return }
                            isDisabled = true
                            answer = "" // reset previous answer
                            
                            do {
                                if mode == .normal {
                                    await runNormal()
                                } else {
                                    await runStreaming()
                                }
                            } catch {
                                print(error.localizedDescription)
                            }
                            
                            isDisabled = false
                        }
                    } label: {
                        Image(systemName: "apple.intelligence")
                            .frame(width: 30, height: 30)
                    }
                    .buttonStyle(.glass)
                    .disabled(isDisabled)
                }
            }
            .navigationTitle("Foundation Models")
            .padding(15)
        }
    }
    
    // Normal response
    func runNormal() async {
        do {
            let session = LanguageModelSession()
            let response = try await session.respond(to: prompt)
            self.answer = response.content
        } catch {
            self.answer = "Error: \(error.localizedDescription)"
        }
    }
    
    // Streaming response
    func runStreaming() async {
        do {
            let session = LanguageModelSession()
            let response = session.streamResponse(to: prompt)
            
            for try await chunk in response {
                    self.answer = chunk
            }
        } catch {
            await MainActor.run {
                self.answer = "Error: \(error.localizedDescription)"
            }
        }
    }
}

#Preview {
    FoundationModels()
}
