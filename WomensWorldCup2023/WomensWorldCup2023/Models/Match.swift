//
//  Match.swift
//  WomensWorldCup2023
//
//  Created by devesmee on 23/06/2023.
//

import Foundation
import Observation

@Observable class Match: Favouritable, Codable {
    private(set) var id = UUID()
    private(set) var abbreviation: String
    private(set) var date: Date
    private(set) var homeTeam: CountryEnum
    private(set) var awayTeam: CountryEnum
    private(set) var score: String
    private(set) var tournamentStage: TournamentStage
    private(set) var group: GroupEnum?
    var favourited = false

    init(
        abbreviation: String,
        date: Date,
        homeTeam: CountryEnum,
        awayTeam: CountryEnum,
        score: String,
        tournamentStage: TournamentStage,
        group: GroupEnum? = nil
    ) {
        self.abbreviation = abbreviation
        self.date = date
        self.homeTeam = homeTeam
        self.awayTeam = awayTeam
        self.score = score
        self.tournamentStage = tournamentStage
        self.group = group
    }

    enum CodingKeys: CodingKey {
        case abbreviation
        case date
        case homeTeam
        case awayTeam
        case score
        case tournamentStage
        case group
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.abbreviation = try container.decode(String.self, forKey: .abbreviation)
        
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
        try container.encode(self.abbreviation, forKey: .abbreviation)
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
    
    static func == (lhs: Match, rhs: Match) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))
    }
}
