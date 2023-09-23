//
//  Profession.swift
//  Messenger-OpenAI
//
//  Created by Łukasz Bielawski on 22/09/2023.
//

import Foundation
import SwiftUI

enum Profession: Codable {
    case mathTeacher
    case doctor
    case programmer
    
    var professionImageName: Image {
        switch self {
        case .mathTeacher:
            return Image(systemName: "person.circle.fill")
//            return Image("MathTeacher")
        case .doctor:
            return Image(systemName: "person.circle.fill")
//            return Image("Doctor")
        default:
            return Image(systemName: "person.circle.fill")
        }
    }
}
