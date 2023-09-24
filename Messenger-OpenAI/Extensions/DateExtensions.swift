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

        let nowDateComponents = Calendar.current.dateComponents([.year, .month, .day], from: .now)
        let thenDateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: self)

        if nowDateComponents.day! == thenDateComponents.day! {
            return "\(thenDateComponents.hour!.addZeroIfOneDigit):\(thenDateComponents.minute!.addZeroIfOneDigit)"
        } else if Calendar.current.isDateInYesterday(self) {
            return "Yesterday, \(thenDateComponents.hour!.addZeroIfOneDigit):\(thenDateComponents.minute!.addZeroIfOneDigit)"
        } else if difference.day! < 7 &&
            Calendar.current.component(.weekday, from: self) != Calendar.current.component(.weekday, from: .now)
        {
            return "\(self.dayOfWeek), \(thenDateComponents.hour!.addZeroIfOneDigit):\(thenDateComponents.minute!.addZeroIfOneDigit)"
        } else if nowDateComponents.year == thenDateComponents.year {
            return "\(thenDateComponents.day!.addZeroIfOneDigit).\(thenDateComponents.month!.addZeroIfOneDigit)"
        } else {
            return "\(thenDateComponents.day!.addZeroIfOneDigit).\(thenDateComponents.month!.addZeroIfOneDigit).\(thenDateComponents.year!)"
        }
    }

    var dayOfWeek: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self).capitalized
    }
}
