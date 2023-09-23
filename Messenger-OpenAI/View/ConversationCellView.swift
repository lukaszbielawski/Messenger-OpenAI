//
//  ConversationCellView.swift
//  Messenger-OpenAI
//
//  Created by Łukasz Bielawski on 22/09/2023.
//

import Foundation
import SwiftData
import SwiftUI

struct ConversationCellView: View {
    var conversation: Conversation

    @Environment(\.modelContext) private var modelContext

    var message: Message?
    let author: Author

    init(conversation: Conversation) {
        self.conversation = conversation
        self.author = conversation.author
        guard !conversation.messages.isEmpty else { return }
        self.message = conversation.messages.sorted { $0!.timestamp > $1!.timestamp }.first!

    }

    var body: some View {
            HStack {
                author.profession.professionImageName
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.main.bounds.size.width * 0.15,
                           height: UIScreen.main.bounds.size.width * 0.15)
                VStack(alignment: .leading, spacing: 2.0) {
                    Text(author.name)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    Text(message?.timestamp.convertToString ?? "")
                        .font(.caption)

                    Text("\(((message != nil && !message!.isUserMessage) || message == nil) ? "" : "You: ")\(message?.content ?? "")")
                        .font(.footnote)
                        .opacity(message == nil ? 0 : 1)
                        .lineLimit(1)
                }
                .padding(8)
                Spacer()
            }
            .padding(.horizontal)
            .background(Color.primaryColor.cornerRadius(16.0))
            .padding(.horizontal)
    }
}

#Preview {
    let preview = PreviewContainer()
    return ConversationCellView(conversation: Conversation.dummyData.first!)
        .modelContainer(preview.container)
}
