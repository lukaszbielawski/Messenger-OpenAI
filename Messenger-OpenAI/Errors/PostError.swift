//
//  PostError.swift
//  Messenger-OpenAI
//
//  Created by Łukasz Bielawski on 25/09/2023.
//

import Foundation

enum PostError: Error {
    case encodingError
    case statusCodeError
    case decodingError
}
