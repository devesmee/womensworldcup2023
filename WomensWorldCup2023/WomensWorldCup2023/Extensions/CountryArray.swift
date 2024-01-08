//
//  CountryArray.swift
//  WomensWorldCup2023
//
//  Created by Esmee Kluijtmans on 05/07/2023.
//

import Foundation

extension Array where Element == Country {
    var sortedByAlphabet: [Country] {
        self.sorted { $0.name < $1.name }
    }
}
