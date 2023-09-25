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
        let schema = Schema([Conversation.self, Author.self, Message.self])
        let configuration = ModelConfiguration()
        let container = try! ModelContainer(
            for: schema,
            configurations: [configuration]
        )

//        if isFirstTimeLaunched {
//            Conversation.dummyData.forEach { conversation in
//                container.mainContext.insert(conversation)
//            }
//            isFirstTimeLaunched = false
//        }

        return container
    }
}
