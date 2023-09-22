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
    @Bindable var author: Author

    @Environment(\.modelContext) private var modelContext

    var message: Message?

    init(author: Author) {
        self.author = author
        guard !author.messages.isEmpty else { return }
        self.message = author.messages.sorted { $0!.timestamp > $1!.timestamp }.first!
    }

    var body: some View {
        GeometryReader { geo in
            HStack {
                author.profession.professionImageName
                    .resizable()
                    .scaledToFit()
                    .frame(width: geo.size.width * 0.25)
                    .cornerRadius(geo.size.width * 0.25)
                VStack(alignment: .leading, spacing: 8.0) {
                    Text(author.name)
                        .font(.title2)
                        .fontWeight(.semibold)
                    Text(message?.timestamp.convertToString ?? "")

                    Text("\((message != nil && message!.author == nil) ? "You: " : "")\(message?.content ?? "")")
                        .opacity(message == nil ? 0 : 1)
                        .lineLimit(2)
                }
                .padding()
                Spacer()
            }
            .padding()
            .background {
                Color.primaryColor.cornerRadius(16.0)
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    let preview = PreviewContainer()
    return ConversationCellView(author: Author.dummyData.first!)
        .modelContainer(preview.container)
}
