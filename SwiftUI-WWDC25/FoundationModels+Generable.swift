//
//  FoundationModels+Generable.swift
//  SwiftUI-WWDC25
//
//  Created by Nonprawich I. on 16/6/25.
//

import Foundation
import FoundationModels
import SwiftUI

@Generable
struct Todo: Identifiable {
    var id: String
    var task: String
}

struct FoundationModels_Generable: View {
    @State private var todos: [Todo] = []
    @State private var isGenerating: Bool = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(todos) { todo in
                    Text(todo.task)
                }
            }
            .navigationTitle("To Do List")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("", systemImage: "apple.intelligence") {
                        let prompt = "Create 10 to do list items"
                        
                        Task {
                            do {
                                let session = LanguageModelSession()
                                let response = session.streamResponse(to: prompt, generating: [Todo].self)
                                
                                isGenerating = true
                                
                                for try await chunkTodos in response {
                                    self.todos = chunkTodos.compactMap({
                                        if let id = $0.id, let task = $0.task {
                                            return .init(id: id, task: task)
                                        }
                                        
                                        return nil
                                    })
                                }
                                
                                isGenerating = false
                            } catch {
                                isGenerating = false
                                print(error.localizedDescription)
                            }
                        }
                    }
                    .disabled(isGenerating)
                }
            }
            .scrollEdgeEffectStyle(.hard, for: .top) // no more glass style
        }
    }
}

#Preview {
    FoundationModels_Generable()
}
