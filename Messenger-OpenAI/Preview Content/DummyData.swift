//
//  DummyData.swift
//  Messenger-OpenAI
//
//  Created by Łukasz Bielawski on 22/09/2023.
//

import Foundation

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
            Message(timestamp: Date(timeIntervalSinceNow: -100000), content: "Many messages with aproximatly two lines of text.", isUserMessage: false),
            Message(timestamp: Date(timeIntervalSinceNow: -100000), content: "Many messages with aproximatly two lines of text.", isUserMessage: false),
            Message(timestamp: Date(timeIntervalSinceNow: -100000), content: "Many messages with aproximatly two lines of text.", isUserMessage: false),
            Message(timestamp: Date(timeIntervalSinceNow: -100000), content: "Many messages with aproximatly two lines of text.", isUserMessage: false),
            Message(timestamp: Date(timeIntervalSinceNow: -100000), content: "Many messages with aproximatly two lines of text.", isUserMessage: false),
            Message(timestamp: Date(timeIntervalSinceNow: -100000), content: "Many messages with aproximatly two lines of text.", isUserMessage: false),
            Message(timestamp: Date(timeIntervalSinceNow: -100000), content: "Many messages with aproximatly two lines of text.", isUserMessage: false),
            Message(timestamp: Date(timeIntervalSinceNow: -100000), content: "Many messages with aproximatly two lines of text.", isUserMessage: false),
            Message(timestamp: Date(timeIntervalSinceNow: -100000), content: "Many messages with aproximatly two lines of text.", isUserMessage: false),
            Message(timestamp: Date(timeIntervalSinceNow: -100000), content: "Many messages with aproximatly two lines of text.", isUserMessage: false),
            Message(timestamp: Date(timeIntervalSinceNow: -100000), content: "Many messages with aproximatly two lines of text.", isUserMessage: false),
            Message(timestamp: Date(timeIntervalSinceNow: -100000), content: "Many messages with aproximatly two lines of text.", isUserMessage: false),
            Message(timestamp: Date(timeIntervalSinceNow: -100000), content: "Many messages with aproximatly two lines of text.", isUserMessage: false),
            Message(timestamp: Date(timeIntervalSinceNow: -100000), content: "Many messages with aproximatly two lines of text.", isUserMessage: false),
            Message(timestamp: Date(timeIntervalSinceNow: -100000), content: "Many messages with aproximatly two lines of text.", isUserMessage: false),
            Message(timestamp: Date(timeIntervalSinceNow: -100000), content: "Many messages with aproximatly two lines of text.", isUserMessage: false),

            Message(timestamp: Date.now, content: "Go to the blackboard.", isUserMessage: false),
        ]
        
    }()
}

extension Author {
    static var dummyData: [Author] = {
        [
            Author(name: "Jake Hawkings", profession: .doctor),
            Author(name: "Alvin Squirrel", profession: .mathTeacher),
            Author(name: "Alan Turner", profession: .programmer),
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
