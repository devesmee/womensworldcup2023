//
//  Match.swift
//  WomensWorldCup2023
//
//  Created by Esmee Kluijtmans on 23/06/2023.
//

import Foundation

struct Match: Identifiable, Codable {
    let id = UUID()
    let date: Date
    let homeTeam: CountryEnum
    let awayTeam: CountryEnum
    let score: String
    let tournamentStage: TournamentStage
    let group: GroupEnum?

    init(
        date: Date,
        homeTeam: CountryEnum,
        awayTeam: CountryEnum,
        score: String,
        tournamentStage: TournamentStage,
        group: GroupEnum? = nil
    ) {
        self.date = date
        self.homeTeam = homeTeam
        self.awayTeam = awayTeam
        self.score = score
        self.tournamentStage = tournamentStage
        self.group = group
    }

    enum CodingKeys: CodingKey {
        case id
        case date
        case homeTeam
        case awayTeam
        case score
        case tournamentStage
        case group
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        let dateString = try container.decode(String.self, forKey: .date)
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        formatter.timeZone = TimeZone(abbreviation: "UTC")
        self.date = formatter.date(from: dateString) ?? Date()

        self.homeTeam = try container.decode(CountryEnum.self, forKey: .homeTeam)
        self.awayTeam = try container.decode(CountryEnum.self, forKey: .awayTeam)
        self.score = try container.decode(String.self, forKey: .score)
        self.tournamentStage = try container.decode(TournamentStage.self, forKey: .tournamentStage)
        self.group = try container.decodeIfPresent(GroupEnum.self, forKey: .group)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.homeTeam, forKey: .homeTeam)
        try container.encode(self.awayTeam, forKey: .awayTeam)
        try container.encode(self.score, forKey: .score)
        try container.encode(self.tournamentStage, forKey: .tournamentStage)
        try container.encodeIfPresent(self.group, forKey: .group)

        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        formatter.timeZone = TimeZone(abbreviation: "UTC")
        let formattedDate = formatter.string(from: self.date)
        try container.encode(formattedDate, forKey: .date)
    }
}
