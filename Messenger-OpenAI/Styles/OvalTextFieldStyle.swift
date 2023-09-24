//
//  OvalTextFieldStyle.swift
//  Messenger-OpenAI
//
//  Created by Łukasz Bielawski on 24/09/2023.
//

import Foundation
import SwiftUI

struct OvalTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(10)
            .background(Color.backgroundColor)
            .cornerRadius(24)
    }
}
