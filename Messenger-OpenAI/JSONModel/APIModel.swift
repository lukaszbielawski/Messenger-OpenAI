//
//  APIModel.swift
//  Messenger-OpenAI
//
//  Created by Łukasz Bielawski on 25/09/2023.
//

import Foundation

struct APIModel: Codable {
    let id, object: String
    let created: Int
    let model: String
    let choices: [Choice]
    let usage: Usage
}

struct Choice: Codable {
    let index: Int
    let message: APIMessage
    let finishReason: String

    enum CodingKeys: String, CodingKey {
        case index, message
        case finishReason = "finish_reason"
    }
}

struct APIMessage: Codable {
    let role, content: String

    var toRoleType: RoleType {
        switch role {
        case "system": return .system
        case "user": return .user
        default: return .assistant
        }
    }
}

struct Usage: Codable {
    let promptTokens, completionTokens, totalTokens: Int

    enum CodingKeys: String, CodingKey {
        case promptTokens = "prompt_tokens"
        case completionTokens = "completion_tokens"
        case totalTokens = "total_tokens"
    }
}
