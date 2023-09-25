//
//  PostModel.swift
//  Messenger-OpenAI
//
//  Created by Łukasz Bielawski on 25/09/2023.
//

import Foundation

struct PostModel: Codable {
    let model: String
    let messages: [APIMessage]
}
