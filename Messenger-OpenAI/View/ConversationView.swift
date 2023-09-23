//
//  ConversationView.swift
//  Messenger-OpenAI
//
//  Created by Łukasz Bielawski on 23/09/2023.
//

import SwiftData
import SwiftUI

struct ConversationView: View {
    @Bindable var conversation: Conversation

    @Namespace var bottomID

    @Environment(\.modelContext) private var modelContext

    var sortedMessages: [Message] {
        guard !conversation.messages.isEmpty else { return [] }
        return conversation.messages.sorted { $0!.timestamp < $1!.timestamp }.compactMap { $0 }
    }

    var body: some View {
        ZStack {
            Color.backgroundColor
                .ignoresSafeArea()
            ScrollViewReader { proxy in
                ScrollView {
                    Text("This is the beggining of your converastion with \(conversation.author.name)")
                        .font(.caption)
                        .padding(.bottom)
                    LazyVStack(spacing: 8) {
                        ForEach(sortedMessages) { message in
                            if message.isUserMessage {
                                UserMessageView(message: message)
                                    .containerRelativeFrame(.horizontal, alignment: .trailing)
                            } else {
                                AuthorMessageView(message: message, conversation: conversation)
                                    .containerRelativeFrame(.horizontal, alignment: .leading)
                            }
                        }
                        Divider()
                            .opacity(0)
                            .id(bottomID)
                    }
                }.onAppear {
                    proxy.scrollTo(bottomID)
                }
            }
        }
    }
}

extension ConversationView {
    struct AuthorMessageView: View {
        let message: Message

        @Bindable var conversation: Conversation

        var body: some View {
            HStack(alignment: .bottom) {
                conversation.author.profession.professionImageName
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.main.bounds.size.width * 0.065,
                           height: UIScreen.main.bounds.size.width * 0.065)
                    .padding(.vertical, 8)
                VStack(alignment: .leading, spacing: 2) {
                    Text(conversation.author.name)
                        .font(.caption)
                        .padding(.leading, 8)
                    HStack {
                        VStack(alignment: .leading, spacing: 2.0) {
                            Text(message.timestamp.convertToString)
                                .font(.caption2)
                                .opacity(0.7)

                            Text(message.content)
                                .font(.footnote)
                        }
                        .padding(8)
                        Spacer()
                    }
                    .background(Color.primaryColor.cornerRadius(16.0))
                }
            }
            .padding(.horizontal)
            .containerRelativeFrame(.horizontal, alignment: .leading) { value, _ in
                value * 0.8
            }
        }
    }

    struct UserMessageView: View {
        let message: Message

        var body: some View {
            HStack(alignment: .bottom) {
                VStack(alignment: .leading, spacing: 2) {
                    HStack {
                        VStack(alignment: .leading, spacing: 2.0) {
                            Text(message.timestamp.convertToString)
                                .font(.caption2)
                                .foregroundStyle(Color.white)
                                .opacity(0.7)
                            Text(message.content)
                                .foregroundStyle(Color.white)
                                .font(.footnote)
                        }
                        .padding(8)
                        Spacer()
                    }
                    .background(Color.accentColor.cornerRadius(16.0))
                }
            }
            .padding(.horizontal)
            .padding(.vertical, 8)
            .containerRelativeFrame(.horizontal, alignment: .trailing) { value, _ in
                value * 0.8
            }
        }
    }
}

#Preview {
    let preview = PreviewContainer()
    return ConversationView(conversation: Conversation.dummyData[0])
        .modelContainer(preview.container)
}
