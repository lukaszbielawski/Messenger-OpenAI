//
//  ViewExtensions.swift
//  Messenger-OpenAI
//
//  Created by Łukasz Bielawski on 24/09/2023.
//

import Foundation
import SwiftUI

extension View {
    func circleViewModifier(frameWidth: CGFloat) -> some View {
        self
            .frame(width: frameWidth,
                   height: frameWidth)
            .cornerRadius(frameWidth / 2)

    }
}
