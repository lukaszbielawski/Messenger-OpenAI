//
//  PreviewContainer.swift
//  Messenger-OpenAI
//
//  Created by Łukasz Bielawski on 22/09/2023.
//

import Foundation
import SwiftData

class PreviewContainer {
    
    let container: ModelContainer!
    
    init(_ types: [any PersistentModel.Type] = [Author.self, Message.self]) {
        
        let schema = Schema(types)
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        
        self.container = try! ModelContainer(for: schema, configurations: [config])
        
        addItems()
        
    }
    
    func addItems() {
        Task { @MainActor in
            Author.dummyData.forEach { author in
                container.mainContext.insert(author)
                author.messages.forEach { message in
                    message?.author = author
                }
            }
        }
    }
    
    
 
}
