//
//  Message.swift
//  Messenger-OpenAI
//
//  Created by Łukasz Bielawski on 22/09/2023.
//

import Foundation
import SwiftData

@Model
final class Message: Codable, Identifiable {
    @Attribute(.unique)
    var id = UUID()

//    var author: Author?

    var timestamp: Date
    var content: String
    var isUserMessage: Bool

    enum CodingKeys: String, CodingKey {
        case id
        case timestamp
        case content
//        case author
        case isUserMessage
    }

    init(
        timestamp: Date = .now, content: String = "", isUserMessage: Bool)
    {
        self.timestamp = timestamp
        self.content = content
        self.isUserMessage = isUserMessage
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(UUID.self, forKey: .id)
        self.timestamp = try container.decode(Date.self, forKey: .timestamp)
        self.content = try container.decode(String.self, forKey: .content)
//        self.author = try container.decodeIfPresent(Author.self, forKey: .author)
        self.isUserMessage = try container.decode(Bool.self, forKey: .isUserMessage)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(timestamp, forKey: .timestamp)
        try container.encode(content, forKey: .content)
//        try container.encodeIfPresent(author, forKey: .author)
        try container.encode(isUserMessage, forKey: .isUserMessage)

    }
}
