//
//  ConversationView+MessageView.swift
//  Messenger-OpenAI
//
//  Created by Łukasz Bielawski on 24/09/2023.
//

import Foundation
import SwiftUI

extension ConversationView {
    struct AuthorMessageView: View {
        let message: Message

        @Bindable var author: Author

        var body: some View {
            HStack(alignment: .bottom) {
                author.profileImage.getImage
                    .resizable()
                    .scaledToFill()
                    .circleViewModifier(frameWidth: UIScreen.main.bounds.size.width * 0.065)
                    .padding(.vertical, 8)
                VStack(alignment: .leading, spacing: 2) {
                    HStack(spacing: 4) {
                        Group {
                            Text(author.name)
                                .padding(.leading, 8)
                            Text("\(author.profession.toString.capitalized)")
                                .opacity(0.7)
                        }
                        .font(.caption)
                    }
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
            .frame(maxWidth: 400)
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
            .padding(.top, 8)
            .frame(maxWidth: 400)
            .containerRelativeFrame(.horizontal, alignment: .trailing) { value, _ in
                value * 0.8
            }
        }
    }
}
