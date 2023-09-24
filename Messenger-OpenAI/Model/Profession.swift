//
//  Profession.swift
//  Messenger-OpenAI
//
//  Created by Łukasz Bielawski on 22/09/2023.
//

import Foundation
import SwiftUI

enum Profession: Codable, CaseIterable {
    
    case mathTeacher
    case doctor
    case programmer

    var toString: String {
        switch self {
        case .mathTeacher:
            return "math teacher"
        case .doctor:
            return "doctor"
        case .programmer:
            return "programmer"
        }
    }
}
