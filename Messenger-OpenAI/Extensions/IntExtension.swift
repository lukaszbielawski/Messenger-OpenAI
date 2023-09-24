//
//  IntExtension.swift
//  Messenger-OpenAI
//
//  Created by Łukasz Bielawski on 22/09/2023.
//

import Foundation

extension Int {
    var addZeroIfOneDigit: String {
        switch self {
        case 0...10:
            return "0" + String(self)
        default:
            return String(self)
        }
    }
}
