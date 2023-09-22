//
//  AuthorsContainer.swift
//  Messenger-OpenAI
//
//  Created by Łukasz Bielawski on 22/09/2023.
//

import Foundation
import SwiftData

actor AuthorsContainer {
    @MainActor
    static func create(_ isFirstTimeLaunched: inout Bool) -> ModelContainer {
        let schema = Schema([Author.self, Message.self])
        let configuration = ModelConfiguration()
        let container = try! ModelContainer(for: schema, configurations: [configuration])
        if isFirstTimeLaunched {
            Author.dummyData.forEach { author in
                container.mainContext.insert(author)
                author.messages.forEach { message in
                    message?.author = author
                }
            }
            isFirstTimeLaunched = false
        }

        return container
    }
}
