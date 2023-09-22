//
//  Messenger_OpenAIApp.swift
//  Messenger-OpenAI
//
//  Created by Łukasz Bielawski on 20/09/2023.
//

import SwiftData
import SwiftUI

@main
struct Messenger_OpenAIApp: App {
    @AppStorage("isFirstTimeLaunched") var isFirstTimeLaunched: Bool = true
    
    var body: some Scene {
        WindowGroup {
            MenuView()
        }
        .modelContainer(AuthorsContainer.create(&isFirstTimeLaunched))
    }
}
