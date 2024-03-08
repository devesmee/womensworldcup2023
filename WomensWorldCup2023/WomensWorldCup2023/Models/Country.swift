//
//  Country.swift
//  WomensWorldCup2023
//
//  Created by devesmee on 14/07/2023.
//

import Foundation

@Observable class Country: Favouritable, Codable {
    let country: CountryEnum
    let matchesPlayed: Int
    let goalDifference: Int
    let points: Int
    
    init(country: CountryEnum, matchesPlayed: Int, goalDifference: Int, points: Int) {
        self.country = country
        self.matchesPlayed = matchesPlayed
        self.goalDifference = goalDifference
        self.points = points
    }
}

extension Country {
    var name: String {
        country.rawValue
    }
}
