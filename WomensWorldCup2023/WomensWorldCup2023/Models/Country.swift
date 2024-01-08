//
//  Country.swift
//  WomensWorldCup2023
//
//  Created by Esmee Kluijtmans on 14/07/2023.
//

import Foundation

struct Country: Identifiable, Decodable, Hashable {
    let id = UUID()
    let country: CountryEnum
    let matchesPlayed: Int
    let goalDifference: Int
    let points: Int
}

extension Country {
    var name: String {
        country.rawValue
    }
}
