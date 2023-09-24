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
    private var conversation: Conversation

    @Environment(\.modelContext) private var modelContext

    private var message: Message?
    private let author: Author

    init(conversation: Conversation) {
        self.conversation = conversation
        self.author = conversation.author
        guard !conversation.messages.isEmpty else { return }
        self.message = conversation.messages.sorted { $0!.timestamp > $1!.timestamp }.first!
    }

    var body: some View {
        HStack {
            author.profileImage.getImage
                .resizable()
                .scaledToFill()
                .circleViewModifier(frameWidth: UIScreen.main.bounds.width * 0.15)

            VStack(alignment: .leading, spacing: 2.0) {        
                HStack(spacing: 4) {
                    Text(author.name)
                        .fontWeight(.semibold)
                        .font(.subheadline)
                    Text("\(author.profession.toString.capitalized)")
                        .font(.caption)
                        .opacity(0.7)
                }
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
