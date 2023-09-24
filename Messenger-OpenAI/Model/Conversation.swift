//
//  Conversation.swift
//  Messenger-OpenAI
//
//  Created by Łukasz Bielawski on 23/09/2023.
//

import Foundation
import SwiftData

@Model
class Conversation: Codable, Identifiable {
    @Attribute(.unique)
    var id = UUID()

    @Relationship(deleteRule: .cascade)
    var author: Author

    @Relationship(deleteRule: .nullify)
    var messages: [Message?] = []

    init(author: Author, messages: [Message?] = []) {
        self.author = author
        self.messages = messages
    }

    enum CodingKeys: CodingKey {
        case author
        case messages
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.author = try container.decode(Author.self, forKey: .author)
        self.messages = try container.decode([Message?].self, forKey: .messages)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(author, forKey: .author)
        try container.encode(messages, forKey: .messages)
    }
}
