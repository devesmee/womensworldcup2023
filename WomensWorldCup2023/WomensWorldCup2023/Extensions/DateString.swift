//
//  MatchDate.swift
//  WomensWorldCup2023
//
//  Created by Esmee Kluijtmans on 25/08/2023.
//

import Foundation

extension Date {

    var dayMonthYear: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM yyyy"

        return dateFormatter.string(from: self)
    }

    var dayMonthShortened: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM"

        return dateFormatter.string(from: self)
    }
}
