//
//  ContentView.swift
//  Messenger-OpenAI
//
//  Created by Łukasz Bielawski on 20/09/2023.
//

import SwiftData
import SwiftUI

struct MenuView: View {
    @Environment(\.modelContext) private var modelContext
    @Query var conversations: [Conversation]
    @State var conversationPresented = false
    
    var sortedConversations: [Conversation] {
        return conversations.sorted(using: OptionalDateComparator(order: .forward))
    }
    
    
    var body: some View {
        NavigationStack {
            VStack {
                ForEach(sortedConversations) { conversation in
                    NavigationLink(destination:
                        ConversationView(conversation: conversation)
                    ) {
                        ConversationCellView(conversation: conversation)
                            .modelContext(modelContext)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
                Color.backgroundColor
            }
            .background(Color.backgroundColor)
            .navigationTitle("OpenAI Messenger")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button {
                        print("plus")
                    } label: {
                        Image(systemName: "plus")
                    }
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
                modelContext.delete(conversations[index])
            }
        }
    }
}

#Preview {
    let preview = PreviewContainer()
    return MenuView()
        .modelContainer(preview.container)
}
