//
//  CountryArray.swift
//  WomensWorldCup2023
//
//  Created by Esmee Kluijtmans on 05/07/2023.
//

import Foundation

extension Array where Element == CountryEnum {
    var sortedByAlphabet: [CountryEnum] {
        self.sorted { $0.rawValue < $1.rawValue }
    }
}
