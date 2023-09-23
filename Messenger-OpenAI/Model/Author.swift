//
//  Author.swift
//  Messenger-OpenAI
//
//  Created by Łukasz Bielawski on 22/09/2023.
//

import Foundation
import SwiftData
import SwiftUI

@Model
final class Author: Codable, Identifiable {
    @Attribute(.unique)
    var id: UUID

    var name: String
    var profession: Profession

//    @Relationship(deleteRule: .nullify, inverse: \Message.author)
//    var messages: [Message?]
    

    init(id: UUID = UUID(), name: String = "", profession: Profession = .doctor, messages: [Message] = []) {
        self.id = id
        self.name = name
        self.profession = profession
//        self.messages = messages
//        for message in messages {
//            message.author = self
//        }
    }

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case profession
//        case messages
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(UUID.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.profession = try container.decode(Profession.self, forKey: .profession)
//        self.messages = try container.decode([Message?].self, forKey: .messages)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(profession, forKey: .profession)
//        try container.encode(messages, forKey: .messages)
    }
}
