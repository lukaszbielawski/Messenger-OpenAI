//
//  ConversationView.swift
//  Messenger-OpenAI
//
//  Created by Łukasz Bielawski on 23/09/2023.
//

import SwiftData
import SwiftUI

struct ConversationView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss

    @Bindable var conversation: Conversation

    @Binding var toDelete: Bool

    @FocusState private var isTextFieldFocused: Bool
    @State private var textFieldValue = ""
    @State private var isAlertShown = false

    @Namespace private var bottomID

    var sortedMessages: [Message] {
        guard !conversation.messages.isEmpty else { return [] }
        return conversation.messages.sorted { $0!.timestamp < $1!.timestamp }.compactMap { $0 }
    }

    var body: some View {
        ZStack(alignment: .bottom) {
            Color.backgroundColor
                .ignoresSafeArea()
            VStack(spacing: 0) {
                ScrollViewReader { proxy in
                    ScrollView {
                        ConversationBeginningView(author: conversation.author)
                        LazyVStack(spacing: 8) {
                            ForEach(sortedMessages) { message in
                                if message.isUserMessage {
                                    UserMessageView(message: message)
                                        .containerRelativeFrame(.horizontal, alignment: .trailing)
                                } else {
                                    AuthorMessageView(message: message, author: conversation.author)
                                        .containerRelativeFrame(.horizontal, alignment: .leading)
                                }
                            }
                            Divider()
                                .opacity(0)
                                .id(bottomID)
                        }
                    }.onAppear {
                        proxy.scrollTo(bottomID)
                    }.onChange(of: conversation.messages.count) { _, _ in
                        withAnimation {
                            proxy.scrollTo(bottomID)
                        }
                    }
                }
                .onTapGesture {
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }
                MessageTextFieldView(textFieldValue: $textFieldValue, isTextFieldFocused: _isTextFieldFocused) {
                    self.createMessage(content: textFieldValue, isUserMessage: true)
                }
            }
        }.toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button {
                    isAlertShown = true
                } label: {
                    Image(systemName: "trash.fill")
                }
                .alert("Do you want to delete this conversation permanently?",
                       isPresented: $isAlertShown,
                       actions: {
                           Button("Cancel", role: .cancel) {}
                           Button("Delete", role: .destructive) {
                               deleteConversation()
                           }
                       })
            }
        }
    }
}

extension ConversationView {
    private func deleteConversation() {
        toDelete = true
        dismiss()
    }

    private func createMessage(content: String, isUserMessage: Bool) {
        guard !textFieldValue.isEmpty || !isUserMessage else { return }

        let message = Message(timestamp: .now, content: content, isUserMessage: isUserMessage)
        modelContext.insert(message)
        conversation.messages.append(message)

        if isUserMessage {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            textFieldValue = ""
        }
    }
}

extension ConversationView {
    struct ConversationBeginningView: View {
        @Bindable var author: Author

        var body: some View {
            VStack(spacing: 16) {
                author.profileImage.getImage
                    .resizable()
                    .scaledToFill()
                    .circleViewModifier(frameWidth: 150)
                Text(author.name)
                    .font(.title)
                Text("This is the beggining of your converastion with \(author.name), a \(author.profession.toString)")
                    .multilineTextAlignment(.center)
                    .font(.caption)
                    .padding(.bottom)
                    .padding(.horizontal, 50)
            }
        }
    }

    struct MessageTextFieldView: View {
        @Binding var textFieldValue: String

        @FocusState var isTextFieldFocused: Bool

        var onSendButtonTap: () -> Void

        var body: some View {
            HStack(spacing: 16) {
                Spacer()
                TextField("Type to chatbot", text: $textFieldValue, axis: .vertical)
                    .lineLimit(isTextFieldFocused ? 1...6 : 1...1)
                    .textFieldStyle(OvalTextFieldStyle())
                    .focused($isTextFieldFocused)

                Button {
                    onSendButtonTap()
                } label: {
                    Image(systemName: "paperplane.fill")
                        .font(.title2)
                }
                .padding(.trailing)
            }
            .animation(.easeInOut, value: isTextFieldFocused)
            .containerRelativeFrame(.horizontal) { value, _ in
                value * (isTextFieldFocused ? 0.9 : 0.6)
            }
            .frame(maxWidth: .infinity, alignment: .bottomTrailing)
            .padding()
            .background(Color.primaryColor
                .ignoresSafeArea()
            )
        }
    }
}

#Preview {
    let preview = PreviewContainer()
    let toDelete: Binding<Bool> = .constant(false)
    return ConversationView(conversation: Conversation.dummyData[0], toDelete: toDelete)
        .modelContainer(preview.container)
}
