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
    let homeTeam: Countries
    let awayTeam: Countries
    let score: String
    let tournamentStage: TournamentStage
    let group: Group?

    init(date: String, homeTeam: Countries, awayTeam: Countries, score: String, tournamentStage: TournamentStage, group: Group? = nil) {
        self.date = date
        self.homeTeam = homeTeam
        self.awayTeam = awayTeam
        self.score = score
        self.tournamentStage = tournamentStage
        self.group = group
    }
}
