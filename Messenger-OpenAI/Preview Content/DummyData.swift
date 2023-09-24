//
//  DummyData.swift
//  Messenger-OpenAI
//
//  Created by Łukasz Bielawski on 22/09/2023.
//

import Foundation
import UIKit

extension Message {
    static var dummyData: [Message] = {
        [
            Message(timestamp: Date.distantPast, content: "Am I sick?", isUserMessage: true),
            Message(timestamp: Date(timeIntervalSinceNow: -80000), content:
                        """
    Thank you. Very long worddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
    Very long message incoming.  Very long message incoming.  Very long message incoming.  Very long message incoming.  Very long message incoming.  Very long message incoming.  Very long message incoming.  Very long message incoming.  Very long message incoming.  Very long message incoming.  Very long message incoming.  Very long message incoming.  Very long message incoming.  Very long message incoming.  Very long message incoming.  Very long message incoming.  Very long message incoming.  Very long message incoming.  Very long message incoming.  Very long message incoming.  Very long message incoming.  Very long mess age incoming.  Very long message incoming.  Very long message incoming.  Very long message incoming.
    """
                    , isUserMessage: true),
            Message(timestamp: Date(timeIntervalSinceNow: -86400 * 1), content: "Many messages with aproximatly two lines of text.", isUserMessage: false),
            Message(timestamp: Date(timeIntervalSinceNow: -86400 * 2), content: "Many messages with aproximatly two lines of text.", isUserMessage: false),
            Message(timestamp: Date(timeIntervalSinceNow: -86400 * 3), content: "Many messages with aproximatly two lines of text.", isUserMessage: false),
            Message(timestamp: Date(timeIntervalSinceNow: -86400 * 4), content: "Many messages with aproximatly two lines of text.", isUserMessage: false),
            Message(timestamp: Date(timeIntervalSinceNow: -86400 * 5), content: "Many messages with aproximatly two lines of text.", isUserMessage: false),
            Message(timestamp: Date(timeIntervalSinceNow: -86400 * 6), content: "Many messages with aproximatly two lines of text.", isUserMessage: false),
            Message(timestamp: Date(timeIntervalSinceNow: -86400 * 7), content: "Many messages with aproximatly two lines of text.", isUserMessage: false),
            Message(timestamp: Date(timeIntervalSinceNow: -86400 * 8), content: "Many messages with aproximatly two lines of text.", isUserMessage: false),
            Message(timestamp: Date(timeIntervalSinceNow: -86400 * 9), content: "Many messages with aproximatly two lines of text.", isUserMessage: false),
            Message(timestamp: Date(timeIntervalSinceNow: -86400 * 9), content: "Many messages with aproximatly two lines of text.", isUserMessage: false),
            Message(timestamp: Date(timeIntervalSinceNow: -86400 * 9), content: "Many messages with aproximatly two lines of text.", isUserMessage: false),
            Message(timestamp: Date(timeIntervalSinceNow: -86400 * 9), content: "Many messages with aproximatly two lines of text.", isUserMessage: false),
            Message(timestamp: Date(timeIntervalSinceNow: -86400 * 9), content: "Many messages with aproximatly two lines of text.", isUserMessage: false),
            Message(timestamp: Date(timeIntervalSinceNow: -86400 * 9), content: "Many messages with aproximatly two lines of text.", isUserMessage: false),
            Message(timestamp: Date(timeIntervalSinceNow: -86400 * 300), content: "Many messages with aproximatly two lines of text.", isUserMessage: false),
            Message(timestamp: Date(timeIntervalSinceNow: -86400 * 600), content: "Many messages with aproximatly two lines of text.", isUserMessage: false),

            Message(timestamp: Date.now, content: "Go to the blackboard.", isUserMessage: false),
        ]
        
    }()
}

extension Author {
    static var dummyData: [Author] = {
        [
            Author(name: "Jake Hawkings", profession: .doctor, profileImage: .apple),
            Author(name: "Alvin Squirrel", profession: .mathTeacher, profileImage: .butterfly),
            Author(name: "Alan Turner", profession: .programmer, profileImage: .lion),
        ]
    }()
}

extension Conversation {
    static var dummyData: [Conversation] = {
        [
            Conversation(author: Author.dummyData[0], messages: Array(Message.dummyData[0...Message.dummyData.count - 2])),
            Conversation(author: Author.dummyData[1], messages: [Message.dummyData.last]),
            Conversation(author: Author.dummyData[2], messages: []),
        ]
    }()
}
