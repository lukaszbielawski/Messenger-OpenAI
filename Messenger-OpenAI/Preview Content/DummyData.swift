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
            Message(timestamp: Date.distantPast, content: "You are sick."),
            Message(timestamp: Date.distantPast, content: "Best medicine for your sickness is onion juice."),
            Message(timestamp: Date.now, content: "Go to blackboard"),
        ]
        
    }()
}

extension Author {
    static var dummyData: [Author] = {
        [
            Author(name: "Jake Hawkings", profession: .doctor, messages:
                    [
                Message.dummyData[0], Message.dummyData[1]
                    ]),
            Author(name: "Alvin Squirrel", profession: .mathTeacher, messages: [
                Message.dummyData[2]
            ]),
        ]
    }()
}
