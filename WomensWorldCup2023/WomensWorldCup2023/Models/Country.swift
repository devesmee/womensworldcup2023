//
//  Country.swift
//  WomensWorldCup2023
//
//  Created by devesmee on 14/07/2023.
//

import Foundation
import SwiftData

@Model class Country: Favouritable, Codable {
    let id = UUID()
    let country: CountryEnum
    var favourited = false
    let matchesPlayed: Int
    let goalDifference: Int
    let points: Int
    
    private enum CodingKeys: CodingKey {
        case country, matchesPlayed, goalDifference, points
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        country = try container.decode(CountryEnum.self, forKey: .country)
        matchesPlayed = try container.decode(Int.self, forKey: .matchesPlayed)
        goalDifference = try container.decode(Int.self, forKey: .goalDifference)
        points = try container.decode(Int.self, forKey: .points)
    }
    
    func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(country, forKey: .country)
        try container.encode(matchesPlayed, forKey: .matchesPlayed)
        try container.encode(goalDifference, forKey: .goalDifference)
        try container.encode(points, forKey: .points)
    }
    
    init(country: CountryEnum, matchesPlayed: Int, goalDifference: Int, points: Int) {
        self.country = country
        self.matchesPlayed = matchesPlayed
        self.goalDifference = goalDifference
        self.points = points
    }
    
    static func == (lhs: Country, rhs: Country) -> Bool {
        return lhs.id == rhs.id
    }
}

extension Country {
    var name: String {
        country.rawValue
    }
}
