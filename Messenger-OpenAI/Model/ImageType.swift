//
//  ImageType.swift
//  Messenger-OpenAI
//
//  Created by Łukasz Bielawski on 24/09/2023.
//

import Foundation
import SwiftUI

enum ImageType: Int, Codable, CaseIterable {
    case cheese = 1
    case apple = 2
    case butterfly = 3
    case waterfall = 4
    case lion = 5
    case wood = 6
    case sun = 7
    case moon = 8
    case ball = 9

    var getImage: Image {
        return Image("image0\(self.rawValue)")
    }
}
