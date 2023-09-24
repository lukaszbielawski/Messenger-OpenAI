//
//  Comparator.swift
//  Messenger-OpenAI
//
//  Created by Łukasz Bielawski on 23/09/2023.
//

import Foundation

struct ConversationComparator: SortComparator {
    typealias Compared = Conversation
    
    var order: SortOrder
    
    func compare(_ lhs: Conversation, _ rhs: Conversation) -> ComparisonResult {
        let (leftMessages, rightMessages) = (lhs.messages, rhs.messages)

        var leftBest: Date?, rightBest: Date? = nil
        
        for left in leftMessages {
            guard let left else { continue }
            if left.timestamp > leftBest ?? .distantPast {
                leftBest = left.timestamp
            }
        }
        
        for right in rightMessages {
            guard let right else { continue }
            if right.timestamp > rightBest ?? .distantPast {
                rightBest = right.timestamp
            }
        }
        
        switch (leftBest, rightBest) {
        case (.some(leftBest), .none):
            return ComparisonResult.orderedAscending
        case (.none, .some(rightBest)):
            return ComparisonResult.orderedDescending
        case (.some(leftBest), .some(rightBest)):
            guard let leftBest, let rightBest else { return .orderedSame }
            
            if leftBest < rightBest {
                return ComparisonResult.orderedDescending
            } else if leftBest > rightBest {
                return ComparisonResult.orderedAscending
            } else {
                return ComparisonResult.orderedSame
            }
        default:
            return ComparisonResult.orderedSame
        }
    }
}
