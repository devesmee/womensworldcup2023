//
//  TournamentStage.swift
//  WomensWorldCup2023
//
//  Created by Esmee Kluijtmans on 23/06/2023.
//

import Foundation

enum TournamentStage: String, Decodable {
    case groupStage = "Group stage"
    case round16 = "Round of 16"
    case quarterFinal = "Quarter final"
    case semiFinal = "Semi final"
    case thirdPlace = "Third place"
    case final = "Final"
}
