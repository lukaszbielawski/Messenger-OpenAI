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
    
    init(_ types: [any PersistentModel.Type] = [Conversation.self, Author.self, Message.self]) {
        
        let schema = Schema(types)
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        
        self.container = try! ModelContainer(for: schema, configurations: [config])
        
        addItems()
        
    }
    
    private func addItems() {
        Task { @MainActor in
            Conversation.dummyData.forEach { conversation in
                container.mainContext.insert(conversation)
            }
        }
    }
    
    
 
}
