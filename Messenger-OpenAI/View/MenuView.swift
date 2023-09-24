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
    @Query private var conversations: [Conversation]

    @State private var toDelete: Bool = false
    @State private var isCreateConversationSheetPresented: Bool = false

    var sortedConversations: [Conversation] {
        return conversations.sorted(using: ConversationComparator(order: .forward))
    }

    var body: some View {
        NavigationStack {
            VStack {
                if sortedConversations.isEmpty {
                    ContentUnavailableView("No ongoing conversations", systemImage: "pencil.and.outline", description: Text("Consider starting a new one by clicking plus button"))
                } else {
                    ScrollView {
                        ForEach(sortedConversations) { conversation in
                            NavigationLink(destination:
                                ConversationView(conversation: conversation, toDelete: $toDelete)
                                    .onDisappear {
                                        guard toDelete else { return }
                                        self.deleteConversation(conversation: conversation)
                                        toDelete = false
                                    }
                            ) {
                                ConversationCellView(conversation: conversation)
                                    .modelContext(modelContext)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                        Color.backgroundColor
                    }
                }
            }.background(Color.backgroundColor)
                .navigationTitle("OpenAI Messenger")
                .toolbar {
                    ToolbarItem(placement: .primaryAction) {
                        Button {
                            isCreateConversationSheetPresented = true
                        } label: {
                            Image(systemName: "plus")
                                .font(.title3)
                        }
                    }
                }.sheet(isPresented: $isCreateConversationSheetPresented) {
                    CreateConversationView { author in
                        self.createNewConversation(author: author)
                    }
                }
        }
    }

    private func createNewConversation(author: Author) {
        withAnimation {
            let newConversation = Conversation(author: author, messages: [])
            self.modelContext.insert(newConversation)
            try? self.modelContext.save()
        }
    }

    private func deleteConversation(conversation: Conversation) {
        withAnimation {
            self.modelContext.delete(conversation)
            try? self.modelContext.save()
        }
    }
}

#Preview {
    let preview = PreviewContainer()
    return MenuView()
        .modelContainer(preview.container)
}
