//
//  ContentView.swift
//  Messenger-OpenAI
//
//  Created by Łukasz Bielawski on 20/09/2023.
//

import SwiftUI
import SwiftData

struct MenuView: View {
    @Environment(\.modelContext) private var modelContext
    @Query var authors: [Author]

    var body: some View {
        NavigationStack {
            ForEach(authors) { author in
                HStack {
                    ConversationCellView(author: author)
                        .modelContext(modelContext)
                }
            }
        }
    }
    
    
    

    private func addItem() {
        withAnimation {
//            let newItem = Message(timestamp: Date())
//            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(authors[index])
            }
        }
    }
}

#Preview {
    let preview = PreviewContainer()
    return MenuView()
        .modelContainer(preview.container)

}
