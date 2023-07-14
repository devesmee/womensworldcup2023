//
//  Match.swift
//  WomensWorldCup2023
//
//  Created by Esmee Kluijtmans on 23/06/2023.
//

import Foundation

struct Match: Identifiable, Decodable {
    let id = UUID()
    let date: String
    let homeTeam: CountryEnum
    let awayTeam: CountryEnum
    let score: String
    let tournamentStage: TournamentStage
    let group: GroupEnum?

    init(date: String, homeTeam: CountryEnum, awayTeam: CountryEnum, score: String, tournamentStage: TournamentStage, group: GroupEnum? = nil) {
        self.date = date
        self.homeTeam = homeTeam
        self.awayTeam = awayTeam
        self.score = score
        self.tournamentStage = tournamentStage
        self.group = group
    }
}
