//
//  DateFormatterHelper.swift
//  News App
//
//  Created by Wildan Nafian on 9/22/24.
//

import Foundation

struct DateFormatterHelper {
    func formatDate(input: String) -> String{
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        inputFormatter.timeZone = TimeZone(abbreviation: "UTC")

        if let date = inputFormatter.date(from: input) {
            let outputFormatter = DateFormatter()
            outputFormatter.dateFormat = "d MMMM yyyy | HH:mm:ss"
            outputFormatter.locale = Locale(identifier: "en_US")
            return outputFormatter.string(from: date)
        } else {
            return ""
        }
    }
}
