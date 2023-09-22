//
//  DateExtensions.swift
//  Messenger-OpenAI
//
//  Created by Łukasz Bielawski on 22/09/2023.
//

import Foundation

extension Date {
    var convertToString: String {
        let difference = Calendar.current.dateComponents([.month, .day, .hour, .minute], from: self, to: .now)

        switch difference.day! {
        case 0:
            let hours = Calendar.current.component(.hour, from: self)
            let minutes = Calendar.current.component(.minute, from: self)
            return"\(hours):\(minutes)"
        case 1:
            if Calendar.current.isDateInYesterday(self) {
                return "Yesterday"
            } else {
                let day = Calendar.current.component(.day, from: self)
                let month = Calendar.current.component(.month, from: self)
                return day.addZeroIfOneDigit + "." + month.addZeroIfOneDigit
            }
        default:
            let day = Calendar.current.component(.day, from: self)
            let month = Calendar.current.component(.month, from: self)
            return day.addZeroIfOneDigit + "." + month.addZeroIfOneDigit
        }
    }
}
